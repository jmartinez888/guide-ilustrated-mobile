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
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(
              Icons.account_circle_outlined,
              color: Colors.grey,
              weight: 1,
              size: MediaQuery.of(context).size.width * 0.25,
            ),
            const SizedBox(width: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Wrap(
                    children: [
                      Text(email, style: Theme.of(context).textTheme.titleSmall)
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                FilledButton(
                  onPressed: () {
                    context.pushNamed(Routes.editProfile,
                        pathParameters: {'userId': userId.toString()});
                  },
                  child: const Text('Editar perfil'),
                )
              ],
            ),
          ],
        ),
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
    return Container(
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: FutureBuilder<bool>(
              future: doesImageExist(profilePicture),
              builder: (context, imageSnapshot) {
                final imageExists = imageSnapshot.data ?? false;
                return imageExists
                    ? CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(profilePicture),
                      )
                    : Icon(
                        Icons.account_circle_outlined,
                        weight: 1,
                        color: Colors.grey,
                        size: MediaQuery.of(context).size.width * 0.25,
                      );
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Wrap(
                  children: [
                    Text('$name $lastName',
                        style: Theme.of(context).textTheme.titleSmall),
                  ],
                ),
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.email_outlined, size: 16.0),
                  const SizedBox(width: 8.0),
                  Text(
                    email,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.1),
                ),
                onPressed: () {
                  context.pushNamed(Routes.editProfile,
                      pathParameters: {'userId': userId.toString()});
                },
                child: const Text('Editar perfil'),
              ),
            ],
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
