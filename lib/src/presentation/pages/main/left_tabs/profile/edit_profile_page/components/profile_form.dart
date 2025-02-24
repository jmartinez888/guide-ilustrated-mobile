import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/generated/translations.g.dart';

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
  bool enabled = true;
  
  String? initialCountryCode; // Variable para almacenar el código de país inicial

  @override
  void initState() {
    super.initState();
    // Aquí puedes asignar el código de país que se usó anteriormente
    initialCountryCode = 'PE'; // Reemplaza con el código de país deseado
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          enabled: enabled,
          controller: widget._nameController,
          focusNode: _nameFocusNode,
          onTapOutside: (event) => _nameFocusNode.unfocus(),
          decoration: InputDecoration(
            labelText: texts.validator.name.label,
            hintText: texts.validator.name.empty,
            prefixIcon: const Icon(Icons.person),
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
          decoration: InputDecoration(
            labelText: texts.validator.lastName.label,
            hintText: texts.validator.lastName.empty,
            prefixIcon: const Icon(Icons.person),
          ),
          textInputAction: TextInputAction.next,
          validator: lastNameValidator,
          onFieldSubmitted: (value) {
            _lastnameFocusNode.unfocus();
            FocusScope.of(context).requestFocus(_phoneFocusNode);
          },
        ),
        const SizedBox(height: 16.0),
        IntlPhoneField(
          controller: widget._phoneController,
          focusNode: _phoneFocusNode,
          decoration: InputDecoration(
            labelText: texts.validator.phone.label,
            hintText: texts.validator.phone.empty,
            border: const OutlineInputBorder(),
          ),
          initialCountryCode: initialCountryCode, // Usa la variable para el código inicial
          validator: (value) {
            if (value == null || value.number.isEmpty) {
              return texts.validator.phone.empty;
            }
            if (value.number.length != value.countryCode.length) {
              return texts.validator.phone.regExp;
            }
            return null;
          },
          onChanged: (phone) {
            // Maneja cambios en el campo de teléfono si es necesario
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
