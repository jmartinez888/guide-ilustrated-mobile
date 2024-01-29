import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:flutter_multi_formatter/widgets/country_dropdown.dart';
import 'package:species/src/presentation/global/mixins/form_mixin.dart';
import 'package:species/src/presentation/pages/main/left_tabs/profile/edit_profile_page/components/country_code.dart';

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
  PhoneCountryData? _initialCountryData;

  @override
  Widget build(BuildContext context) {
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
        SizedBox(
          height: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: CountryDropdown(
                  decoration: const InputDecoration(
                    hintText: 'Código de país',
                  ),
                  menuMaxHeight: 300.0,
                  validator: (value) {
                    if (value == null) {
                      return 'Seleccione un país';
                    }
                    return null;
                  },
                  printCountryName: true,
                  initialCountryData: _initialCountryData,
                  filter: PhoneCodes.findCountryDatasByCountryCodes(
                    countryIsoCodes: countryCodes,
                  ),
                  onCountrySelected: (PhoneCountryData countryData) {
                    setState(() {
                      _initialCountryData = countryData;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                  'Nota: El numero de telefono debe iniciar con el codigo de pais. Ejemplo: 51 999 999 999',
                  style: TextStyle(color: Colors.black54, fontSize: 12.0)),
              Expanded(
                flex: 6,
                child: TextFormField(
                  key: ValueKey(_initialCountryData),
                  enabled: enabled,
                  focusNode: _phoneFocusNode,
                  onTapOutside: (event) => _phoneFocusNode.unfocus(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su número de teléfono';
                    }

                    if (value.length !=
                        _initialCountryData
                            ?.phoneMaskWithoutCountryCode.length) {
                      return 'Ingrese un número de teléfono válido';
                    }
                    return null;
                  },
                  controller: widget._phoneController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0)),
                    ),
                    hintText: _initialCountryData?.phoneMaskWithoutCountryCode,
                    hintStyle: TextStyle(color: Colors.black.withOpacity(.3)),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    PhoneInputFormatter(
                      allowEndlessPhone: false,
                      defaultCountryCode: _initialCountryData?.countryCode,
                    ),
                  ],
                ),
              ),
            ],
          ),
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
