import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:species/src/data/services/remote/account_api.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/user/user.dart';
import 'package:species/src/domain/failures/firebase_request/firebase_request_failure.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';

class AccountRepositoryImpl extends AccountRepository {
  final AccountApi _accountApi;
  late final StreamController<UserC> _controller;

  UserC? _lastUserData;
  StreamSubscription? _subscription;
  String? _currentUserId;

  final firebaseFirestoreInstance =
      FirebaseFirestore.instance.collection('users');
  final firebaseStorageInstance = FirebaseStorage.instance;

  AccountRepositoryImpl({required AccountApi accountApi})
      : _accountApi = accountApi {
    _controller = StreamController<UserC>.broadcast(
      onListen: () {
        // When a new listener subscribes, re-emit the last cached value
        // so the StreamBuilder gets data immediately.
        if (_lastUserData != null) {
          _controller.add(_lastUserData!);
        }
      },
    );
  }

  @override
  Future createUser({
    required String userId,
    required String email,
  }) {
    return _accountApi.createUser(userId: userId, email: email);
  }

  @override
  Future<Either<FirebaseRequestFailure, UserC>> getUserData(String userId) {
    return _accountApi.getUserData(userId);
  }

  @override
  Future<Either<FirebaseRequestFailure, String>> uploadProfilePicture(
    String folderName,
    String fileName,
    Uint8List file,
  ) async {
    try {
      Reference ref =
          firebaseStorageInstance.ref().child(folderName).child(fileName);
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return Either.right(downloadUrl);
    } catch (e) {
      return Either.left(FirebaseRequestFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<FirebaseRequestFailure, void>> saveProfile({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
    required Uint8List profilePicture,
  }) async {
    try {
      final result = await uploadProfilePicture(
        'profilePictures',
        userId,
        profilePicture,
      );
      return result.when(
        (failure) => Either.left(failure),
        (downloadUrl) async {
          await firebaseFirestoreInstance.doc(userId).update({
            'name': name,
            'lastName': lastName,
            'phone': phone,
            'email': email,
            'profilePicture': downloadUrl,
          });
          return Either.right(null);
        },
      );
    } catch (e) {
      return Either.left(FirebaseRequestFailure.unknown(e.toString()));
    }
  }

  @override
  Future<Either<FirebaseRequestFailure, void>> saveProfileWithoutImage({
    required String userId,
    required String name,
    required String lastName,
    required String phone,
    required String email,
  }) async {
    try {
      await firebaseFirestoreInstance.doc(userId).update({
        'name': name,
        'lastName': lastName,
        'phone': phone,
        'email': email,
      });
      return Either.right(null);
    } catch (e) {
      return Either.left(FirebaseRequestFailure.unknown(e.toString()));
    }
  }

  @override
  Future<void> deleteUserAccount({
    required String email,
    required String password,
  }) {
    return _accountApi.deleteUserAccount(
      email: email,
      password: password,
    );
  }

  @override
  Future<Map<String, dynamic>> getUserInfo() async {
    return _accountApi.getUserInfo();
  }

  @override
  bool acces() {
    return _accountApi.acces();
  }

  @override
  Future<void> getStreamUserData(String userId) async {
    // Avoid re-subscribing if already listening to the same user
    if (_currentUserId == userId && _subscription != null) {
      return;
    }
    _currentUserId = userId;
    _subscription?.cancel();
    _subscription = firebaseFirestoreInstance.doc(userId).snapshots().listen(
      (DocumentSnapshot documentSnapshot) {
        if (!_controller.isClosed) {
          if (documentSnapshot.exists) {
            _lastUserData =
                UserC.fromJson(documentSnapshot.data() as Map<String, dynamic>);
            _controller.add(_lastUserData!);
          }
        }
      },
      onError: (error) {
        print('Stream error (likely sign-out permission denied): $error');
        _subscription?.cancel();
        _currentUserId = null;
      },
    );
  }

  @override
  UserC get userData => _lastUserData!;

  @override
  Stream<UserC> get onUserDataChanged => _controller.stream;
}
