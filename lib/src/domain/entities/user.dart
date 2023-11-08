import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String email;
  final String? name;
  final String? lastName;
  final String? phone;
  final Timestamp? created;
  // final String? profilePicture;

  User({
    required this.id,
    required this.email,
    this.name,
    this.lastName,
    this.phone,
    this.created,
    // this.profilePicture,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'lastName': lastName,
        'phone': phone,
        'created': created,
        // 'profilePicture': profilePicture,
      };
}
