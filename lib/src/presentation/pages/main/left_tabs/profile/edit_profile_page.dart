import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:species/src/data/repositories_implementation/user_iiap/user_iiap_repository_impl.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/global/utils/upload_image.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';

class EditProfile extends StatefulWidget {
  final String userId;

  const EditProfile({super.key, required this.userId});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> with FormMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController(),
      _lastnameController = TextEditingController(),
      _phoneController = TextEditingController();
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastnameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  final UserIiapRepositoryImpl _userIiapRepositoryImpl =
      UserIiapRepositoryImpl();

  bool validateInInput = false;
  bool enabled = true;

  Uint8List? _image;

  void _selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _phoneController.dispose();
    _nameFocusNode.dispose();
    _lastnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: const Text('Editar perfil'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            physics: const BouncingScrollPhysics(),
            children: [
              _image != null
                  ? CircleAvatar(
                      backgroundImage: MemoryImage(_image!),
                      radius: 100,
                    )
                  : Center(
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/logo.png'),
                            radius: 100,
                          ),
                          Positioned(
                            bottom: -10,
                            right: 10,
                            child: IconButton(
                              onPressed: _selectImage,
                              icon: const Icon(
                                Icons.add_a_photo,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _nameController,
                focusNode: _nameFocusNode,
                onTapOutside: (event) => _nameFocusNode.unfocus(),
                decoration: const InputDecoration(
                  labelText: 'Nombre',
                  hintText: 'Ingrese su nombre',
                  prefixIcon: Icon(Icons.person),
                ),
                textInputAction: TextInputAction.next,
                validator: nameValidator,
                onFieldSubmitted: (value) {
                  _nameFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_lastnameFocusNode);
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _lastnameController,
                focusNode: _lastnameFocusNode,
                onTapOutside: (event) => _lastnameFocusNode.unfocus(),
                decoration: const InputDecoration(
                  labelText: 'Apellido',
                  hintText: 'Ingrese su apellido',
                  prefixIcon: Icon(Icons.person),
                ),
                textInputAction: TextInputAction.next,
                validator: lastNameValidator,
                onFieldSubmitted: (value) {
                  _lastnameFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_phoneFocusNode);
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _phoneController,
                focusNode: _phoneFocusNode,
                onTapOutside: (event) => _phoneFocusNode.unfocus(),
                decoration: const InputDecoration(
                  labelText: 'Teléfono',
                  hintText: 'Ingrese su teléfono',
                  prefixIcon: Icon(Icons.phone),
                ),
                textInputAction: TextInputAction.done,
                validator: phoneValidator,
                onFieldSubmitted: (value) {
                  _phoneFocusNode.unfocus();
                },
              ),
              const SizedBox(height: 16.0),
              FilledButton(
                onPressed: () {
                  _saveProfile(context: context);
                },
                child: const Text('Guardar'),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  void _saveProfile({
    required BuildContext context,
  }) async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final lastName = _lastnameController.text;
      final phone = _phoneController.text;

      final Map<String, dynamic> arguments =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final userId = arguments['userId'] as String;

      try {
        // Obtén los datos actuales del usuario antes de actualizar
        final currentUserData =
            await _userIiapRepositoryImpl.getUserData(userId);

        // Asegúrate de que el campo 'email' no sea nulo
        final email = currentUserData['email'] ?? '';

        // Llama a la función para actualizar el usuario en Firebase
        await _userIiapRepositoryImpl.saveProfile(
          userId: userId,
          name: name,
          lastName: lastName,
          phone: phone,
          email: email,
          profilePicture: _image!,
        );

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Perfil actualizado con éxito'),
        ));
      } catch (error) {
        print('Error al actualizar el perfil: $error');
      }
    }
  }
}
