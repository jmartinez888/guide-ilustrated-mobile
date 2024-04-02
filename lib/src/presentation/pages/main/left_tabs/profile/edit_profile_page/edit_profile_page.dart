import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:species/src/domain/repositories/account/account_repository.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/global/utils/upload_image.dart';
import 'package:species/src/presentation/global/widgets/custom_back_button.dart';
import 'package:species/src/presentation/global/widgets/messages/custom_snack_bar.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/edit_profile_page/components/image_picker.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/edit_profile_page/components/profile_form.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/widgets/success_modal.dart';
import 'package:species/src/generated/translations.g.dart';

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

  AccountRepository get _userIiapRepositoryImpl => context.read();

  bool enabled = true;

  Uint8List? _image;

  String? _imageUrl;

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
      if (mounted) {
        customSnackBar(
          context: context,
          title: texts.editProfile.errorSnack,
          error: true,
        );
      }
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
        title: Text(texts.editProfile.title),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            physics: const BouncingScrollPhysics(),
            children: [
              InputImagePicker(
                imageUrl: _imageUrl,
                image: _image,
                onSelectedImage: _selectImage,
              ),
              const SizedBox(height: 16.0),
              ProfileForm(
                action: FilledButton.icon(
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
                  label: enabled
                      ? Text(texts.editProfile.save)
                      : Text(texts.editProfile.saving),
                ),
                nameController: _nameController,
                lastnameController: _lastnameController,
                phoneController: _phoneController,
              ),
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
      enabled = false;
      setState(() {});
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

        if (_image == null) {
          // Si la imagen es nula, simplemente guarda el perfil sin la imagen
          await _userIiapRepositoryImpl.saveProfileWithoutImage(
            userId: userId,
            name: name,
            lastName: lastName,
            phone: phone,
            email: email,
          );
        } else {
          // Si la imagen no es nula, guarda el perfil con la imagen
          await _userIiapRepositoryImpl.saveProfile(
            userId: userId,
            name: name,
            lastName: lastName,
            phone: phone,
            email: email,
            profilePicture: _image!,
          );
        }

        // Muestra un mensaje de éxito
        if (mounted) {
          profileSuccessModal(context);
        }

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
        if (mounted) {
          customSnackBar(
            context: context,
            title: 'Error al guardar el perfil',
            error: true,
          );
        }

        // Habilitar el botón de guardar
        enabled = true;
        setState(() {});
      }
    }
  }
}
