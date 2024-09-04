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

  late final AccountRepository _userIiapRepositoryImpl;

  bool enabled = true;
  Uint8List? _image;
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _userIiapRepositoryImpl = context.read<AccountRepository>();
    _loadUserData();
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

  void _selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
    }
  }

  void _loadUserData() async {
    final userId = widget.userId;
    final userData = await _userIiapRepositoryImpl.getUserData(userId);

    userData.when(
      (failure) {
        customSnackBar(
          context: context,
          title: texts.editProfile.errorSnack,
          error: true,
        );
      },
      (user) {
        _nameController.text = user.name ?? '';
        _lastnameController.text = user.lastName ?? '';
        _phoneController.text = user.phone ?? '';

        final profilePicture = user.profilePicture;
        if (profilePicture != null) {
          setState(() {
            _imageUrl = profilePicture;
          });
        }
      },
    );
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
                  onPressed:
                      enabled ? () => _saveProfile(context: context) : null,
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

  void _saveProfile({required BuildContext context}) async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      enabled = false;
    });

    final name = _nameController.text;
    final lastName = _lastnameController.text;
    final phone = _phoneController.text;

    try {
      final currentUserData = await _userIiapRepositoryImpl.getUserData(widget.userId);

      currentUserData.when(
        (failure) {
          if (mounted) {
            handleFailure(context);
          }
        },
        (user) async {
          final email = user.email ?? '';

          try {
            if (_image == null) {
              // Solo guardar los datos del perfil sin imagen
              final result = await _userIiapRepositoryImpl.saveProfileWithoutImage(
                userId: widget.userId,
                name: name,
                lastName: lastName,
                phone: phone,
                email: email,
              );

              // Asumimos que `result` es un `String` (mensaje de éxito)
              // ignore: use_build_context_synchronously
              handleSuccess(context);
            } else {
              // Guardar los datos del perfil junto con la imagen
              final result = await _userIiapRepositoryImpl.saveProfile(
                userId: widget.userId,
                name: name,
                lastName: lastName,
                phone: phone,
                email: email,
                profilePicture: _image!,
              );

              // Asumimos que `result` es un `String` (mensaje de éxito)
              // ignore: use_build_context_synchronously
              handleSuccess(context);
            }
          } catch (e) {
            if (mounted) {
              handleFailure(context);
            }
          }
        },
      );
    } catch (e) {
      if (mounted) {
        handleFailure(context);
      }
    }
  }
}


  void handleFailure(BuildContext context) {
    customSnackBar(
      context: context,
      title: texts.editProfile.errorSave,
      error: true,
    );
    setState(() {
      enabled = true;
    });
  }

  void handleSuccess(BuildContext context) {
    if (mounted) {
      profileSuccessModal(context);
      setState(() {
        _nameController.clear();
        _lastnameController.clear();
        _phoneController.clear();
        _image = null;
        enabled = true;
      });
    }
  }
}

