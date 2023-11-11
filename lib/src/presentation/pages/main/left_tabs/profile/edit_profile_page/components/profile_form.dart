import 'package:flutter/material.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';

class ProfileForm extends StatefulWidget {
  final Widget? action;
  final TextEditingController _nameController;
  final TextEditingController _lastnameController;
  final TextEditingController _phoneController;

  const ProfileForm({
    Key? key,
    required this.action,
    required TextEditingController nameController,
    required TextEditingController lastnameController,
    required TextEditingController phoneController,
  })  : _nameController = nameController,
        _lastnameController = lastnameController,
        _phoneController = phoneController,
        super(key: key);
  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> with FormMixin {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastnameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool enabled = true;
    return Column(
      children: [
        TextFormField(
          enabled: enabled,
          controller: widget._nameController,
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
          controller: widget._lastnameController,
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
          controller: widget._phoneController,
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
          child: widget.action,
        ),
      ],
    );
  }
}
