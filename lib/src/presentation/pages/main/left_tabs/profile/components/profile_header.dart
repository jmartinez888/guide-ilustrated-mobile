import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

          return Container(
            margin: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 32.0),
                    child: CircleAvatar(
                        backgroundImage: NetworkImage(profilePicture),
                        radius: 50)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _userName(context,
                        label: name, fontSize: 16, weight: FontWeight.w600),
                    _userName(context,
                        label: lastName, fontSize: 16, weight: FontWeight.w600),
                    const SizedBox(width: 4.0),
                    _userName(context, label: email, fontSize: 14),
                    _userName(context, label: phone, fontSize: 14),
                    const SizedBox(height: 4.0),
                    FilledButton(
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
        } else {
          return const Text('Usuario no encontrado');
        }
      },
    );
  }

  Widget _userName(BuildContext context,
          {required String label,
          required double fontSize,
          FontWeight? weight}) =>
      Text(
        label,
        style: TextStyle(fontSize: fontSize, fontWeight: weight),
      );
}
