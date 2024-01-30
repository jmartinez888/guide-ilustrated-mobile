import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _lastnameFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  bool enabled = true;

  String initialCountryCode = 'PE';
  PhoneNumber number = PhoneNumber(isoCode: 'PE');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
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
          Column(
            children: [
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
            ],
          ),
          const SizedBox(height: 16.0),
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {},
            onInputValidated: (bool value) {
              if (value) {
                setState(() {
                  enabled = false;
                });
              }
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            // ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: number,
            textFieldController: widget._phoneController,
            formatInput: true,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            inputBorder: const OutlineInputBorder(),
          ),
          const SizedBox(height: 16.0),
          SizedBox(
            width: double.infinity,
            child: widget.action,
          ),
        ],
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'PE');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _lastnameFocusNode.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }
}
