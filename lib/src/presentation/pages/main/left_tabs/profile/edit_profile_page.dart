import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:species/src/data/repositories_implementation/user_iiap/user_iiap_repository_impl.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/global/utils/upload_image.dart';
import 'package:species/src/presentation/global/widgets/buttons/custom_icon_button.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/router/routes.dart';

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

  bool enabled = true;

  Uint8List? _image;

  String? _imageUrl; // Variable para almacenar la URL de la imagen

  void _selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
    }
  }

  void _loadUserData() async {
    try {
      final userId = widget.userId;
      final userData = await _userIiapRepositoryImpl.getUserData(userId);

      _nameController.text = userData['name'] ?? '';
      _lastnameController.text = userData['lastName'] ?? '';
      _phoneController.text = userData['phone'] ?? '';

      final profilePicture = userData['profilePicture'];
      if (profilePicture != null) {
        setState(() {
          _imageUrl = profilePicture; // Almacena la URL de la imagen
        });
      }
    } catch (error) {
      customSnackBar(
        context: context,
        title: 'Error al cargar los datos del usuario',
        backgroundColor: Colors.red,
      );
    }
  }

  Future<bool> doesImageExist(String imageUrl) async {
    final storage = FirebaseStorage.instance;
    try {
      final ref = storage.refFromURL(imageUrl);
      await ref.getMetadata();
      return true; // The image exists
    } catch (e) {
      return false; // The image doesn't exist or there was an error
    }
  }

  @override
  void initState() {
    _loadUserData();
    super.initState();
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
              _imagePicker(),
              _profileForm(context),
            ],
          ),
        ),
      ),
    );
  }

  _imagePicker() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        children: [
          _image != null
              ? CircleAvatar(
                  backgroundImage: MemoryImage(_image!),
                  radius: 100,
                )
              : _imageUrl != null
                  ? FutureBuilder<bool>(
                      future: doesImageExist(_imageUrl!),
                      builder: (context, imageSnapshot) {
                        final imageExists = imageSnapshot.data ?? false;
                        return imageExists
                            ? Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(_imageUrl!),
                                    radius: 100,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: CustomIconButton(
                                      onPressed: _selectImage,
                                      icon: Icons.add_a_photo,
                                    ),
                                  ),
                                ],
                              )
                            : Stack(
                                children: [
                                  const Icon(
                                    Icons.account_circle_rounded,
                                    color: Colors.grey,
                                    size: 200,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: CustomIconButton(
                                      onPressed: _selectImage,
                                      icon: Icons.add_a_photo,
                                    ),
                                  ),
                                ],
                              );
                      },
                    )
                  : Column(
                      children: [
                        Stack(
                          children: [
                            const Icon(
                              Icons.account_circle_rounded,
                              color: Colors.grey,
                              size: 200,
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: CustomIconButton(
                                onPressed: _selectImage,
                                icon: Icons.add_a_photo,
                              ),
                            ),
                          ],
                        ),
                        const Text('Seleccione una imagen de perfil'),
                      ],
                    ),
        ],
      ),
    );
  }

  Column _profileForm(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          enabled: enabled,
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
          enabled: enabled,
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
          enabled: enabled,
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
        SizedBox(
          width: double.infinity,
          child: FilledButton.icon(
            onPressed: enabled
                ? () => _saveProfile(
                      context: context,
                    )
                : null,
            icon: enabled
                ? const Icon(Icons.save)
                : const SizedBox(
                    width: 24.0,
                    height: 24.0,
                    child: CircularProgressIndicator(),
                  ),
            label: enabled ? const Text('Guardar') : const Text('Guardando...'),
          ),
        ),
      ],
    );
  }

  void _saveProfile({
    required BuildContext context,
  }) async {
    if (_formKey.currentState!.validate()) {
      enabled = false;
      setState(() {});
      final name = _nameController.text;
      final lastName = _lastnameController.text;
      final phone = _phoneController.text;

      if (_image == null) {
        customSnackBar(
          context: context,
          title: 'Seleccione una imagen',
          backgroundColor: Colors.red,
        );

        // Habilitar el botón de guardar
        enabled = true;
        setState(() {});
        return;
      }
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

        // Muestra un mensaje de éxito

        _successModal(context);
        //

        // Limpiar el formulario
        _nameController.clear();
        _lastnameController.clear();
        _phoneController.clear();
        setState(() {
          _image = null;
        });

        // Habilitar el botón de guardar
        enabled = true;
        setState(() {});
      } catch (error) {
        customSnackBar(
          context: context,
          title: 'Error al actualizar el perfil',
          backgroundColor: Colors.red,
        );

        // Habilitar el botón de guardar
        enabled = true;
        setState(() {});
      }
    }
  }

  Future<void> _successModal(BuildContext context) {
    return showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Sus datos se han actualizado correctamente',
                    style: Theme.of(context).textTheme.bodyLarge),
                FilledButton(
                  child: const Text('Aceptar'),
                  onPressed: () => context.goNamed(Routes.profile),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
