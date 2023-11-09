import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';

class DeleteAccountPage extends StatelessWidget {
  final String userId;

  const DeleteAccountPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    const String userName = "John";
    const String lastName = "Doe";
    const String email = "john.doe@example.com";
    const String phone = "123-456-7890";
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Borrar cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información de usuario',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Nombre: $userName $lastName'),
            const Text('Email: $email'),
            const Text('Teléfono: $phone'),
            const SizedBox(height: 16),
            const Text(
              'Al borrar tu cuenta, estás de acuerdo con los siguientes términos:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text('- Todos tus datos serán borrados permanentemente.'),
            const Text(
                '- No podrás recuperar tu cuenta ni los datos asociados a ella.'),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                // Perform account deletion logic here
                // This could include showing a confirmation dialog
                // and then deleting the user account.
                // For simplicity, we'll just show a snackbar in this example.
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Account deleted successfully'),
                  ),
                );
              },
              child: const Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}
