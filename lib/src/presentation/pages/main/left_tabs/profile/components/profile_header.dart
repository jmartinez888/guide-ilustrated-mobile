import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:species/src/presentation/router/routes.dart';

class ProfileHeader extends StatefulWidget {
  const ProfileHeader({super.key});

  @override
  State<ProfileHeader> createState() => _ProfileHeaderState();
}

class _ProfileHeaderState extends State<ProfileHeader> {
  Future<Map<String, dynamic>> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      }
    }
    return {};
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.5,
              child: const Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final userData = snapshot.data;
          final profilePicture = userData!['profilePicture'] ?? '';
          final name = userData['name'] ?? '';
          final lastName = userData['lastName'] ?? '';
          final email = userData['email'] ?? '';
          final phone = userData['phone'] ?? '';
          final userId = userData['id'] ?? '';

          final profileIncomplete =
              name.isEmpty || lastName.isEmpty || phone.isEmpty;
          if (profileIncomplete) {
            return _IncompleteProfile(
              userId: userId,
              email: email,
            );
          } else {
            return _CompleteProfile(
              userId: userId,
              name: name,
              lastName: lastName,
              email: email,
              phone: '+$phone',
              profilePicture: profilePicture,
            );
          }
        } else {
          return const Text('Usuario no encontrado');
        }
      },
    );
  }
}

class _IncompleteProfile extends StatelessWidget {
  final String userId;
  final String email;

  const _IncompleteProfile({required this.userId, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.account_circle_rounded,
            color: Colors.grey[400],
            size: 200,
          ),
          const SizedBox(height: 15.0),
          Text(email,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  )),
          const SizedBox(height: 16.0),
          const Text(
            'Completa tu perfil para acceder a todas las funcionalidades de la aplicación.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: () {
              context.pushNamed(Routes.editProfile,
                  pathParameters: {'userId': userId.toString()});
            },
            child: const Text('Completar perfil'),
          )
        ],
      ),
    );
  }
}

class _CompleteProfile extends StatelessWidget {
  final String userId;
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String profilePicture;

  const _CompleteProfile({
    required this.userId,
    required this.name,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.profilePicture,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          FutureBuilder<bool>(
            future: doesImageExist(profilePicture),
            builder: (context, imageSnapshot) {
              final imageExists = imageSnapshot.data ?? false;
              return imageExists
                  ? CircleAvatar(
                      radius: 100,
                      backgroundImage: NetworkImage(profilePicture),
                    )
                  : const Icon(
                      Icons.account_circle_rounded,
                      color: Colors.grey,
                      size: 200,
                    );
            },
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.center,
            child: Text(
              '$name $lastName',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.phone_iphone),
              const SizedBox(width: 8.0),
              Text(
                phone,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email),
              const SizedBox(width: 8.0),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            ),
            onPressed: () {
              context.pushNamed(Routes.editProfile,
                  pathParameters: {'userId': userId.toString()});
            },
            child: const Text('Editar perfil'),
          ),
        ],
      ),
    );
  }
}

Future<bool> doesImageExist(String imageUrl) async {
  final storage = FirebaseStorage.instance;
  try {
    final ref = storage.refFromURL(imageUrl);
    await ref.getMetadata();
    return true;
  } catch (e) {
    return false;
  }
}
