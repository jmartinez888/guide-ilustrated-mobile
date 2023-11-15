import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:species/src/domain/entities/class.dart';
import 'package:species/src/domain/entities/family.dart';
import 'package:species/src/domain/entities/order.dart';

class OrderByNameScientificDialog extends StatelessWidget {
  final String? orderNameScientific;
  final Function(String?) onValueChanged;
  final Function() onDialogClosed;

  const OrderByNameScientificDialog({
    super.key,
    required this.orderNameScientific,
    required this.onValueChanged,
    required this.onDialogClosed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Ordenar por nombre científico',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      content: Wrap(
        children: [
          RadioListTile(
            title: const Text('Ascendente'),
            value: 'ASC',
            groupValue: orderNameScientific,
            onChanged: (value) {
              onValueChanged(value as String);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Descendente'),
            value: 'DESC',
            groupValue: orderNameScientific,
            onChanged: (value) {
              onValueChanged(value as String);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Ninguno'),
            value: null,
            groupValue: orderNameScientific,
            onChanged: (value) {
              onValueChanged(value);
              onDialogClosed();
            },
          ),
        ],
      ),
    );
  }
}

class FilterBySoundDialog extends StatelessWidget {
  final int? hasSound;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;

  const FilterBySoundDialog({
    super.key,
    required this.hasSound,
    required this.onValueChanged,
    required this.onDialogClosed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Filtrar por sonido',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      content: Wrap(
        children: [
          RadioListTile(
            title: const Text('Con sonido'),
            value: 1,
            groupValue: hasSound,
            onChanged: (value) {
              onValueChanged(value as int);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Sin sonido'),
            value: 0,
            groupValue: hasSound,
            onChanged: (value) {
              onValueChanged(value as int);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Ninguno'),
            value: null,
            groupValue: hasSound,
            onChanged: (value) {
              onValueChanged(value);
              onDialogClosed();
            },
          ),
        ],
      ),
    );
  }
}

class FilterByConservationStatusDialog extends StatelessWidget {
  final int? conservationStatus;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;

  const FilterByConservationStatusDialog({
    super.key,
    required this.conservationStatus,
    required this.onValueChanged,
    required this.onDialogClosed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Filtrar por estado de conservación',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      content: Wrap(
        children: [
          RadioListTile(
            title: const Text('En peligro'),
            value: 1,
            groupValue: conservationStatus,
            onChanged: (value) {
              onValueChanged(value as int);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Vulnerable'),
            value: 2,
            groupValue: conservationStatus,
            onChanged: (value) {
              onValueChanged(value as int);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Casi amenazado'),
            value: 3,
            groupValue: conservationStatus,
            onChanged: (value) {
              onValueChanged(value as int);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Preocupación menor'),
            value: 4,
            groupValue: conservationStatus,
            onChanged: (value) {
              onValueChanged(value as int);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Ninguno'),
            value: null,
            groupValue: conservationStatus,
            onChanged: (value) {
              onValueChanged(value);
              onDialogClosed();
            },
          ),
        ],
      ),
    );
  }
}

class FilterByTaxonomyDialog extends StatelessWidget {
  final int? taxonomyId;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;

  const FilterByTaxonomyDialog({
    Key? key,
    required this.taxonomyId,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Dialog(
      shadowColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        constraints: BoxConstraints(
          maxWidth: 400,
          maxHeight: isMobile
              ? MediaQuery.of(context).size.height * 0.6
              : MediaQuery.of(context).size.height * 0.7,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filtrar por taxonomía',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            ListRadioOptions(
              taxonomyId: taxonomyId,
              onValueChanged: onValueChanged,
              onDialogClosed: onDialogClosed,
            ),
          ],
        ),
      ),
    );
  }
}

class ListRadioOptions extends StatelessWidget {
  final List<TaxonomyOption> taxonomyOptions = [
    TaxonomyOption('Aves', 1),
    TaxonomyOption('Mamíferos', 2),
    TaxonomyOption('Reptiles', 3),
    TaxonomyOption('Anfibios', 4),
    TaxonomyOption('Peces', 5),
    TaxonomyOption('Insectos', 6),
    TaxonomyOption('Arboles', 7),
    TaxonomyOption('Palmeras', 8),
    TaxonomyOption('Ninguno', null),
  ];

  final int? taxonomyId;
  final Function(int? p1) onValueChanged;
  final Function() onDialogClosed;

  ListRadioOptions({
    Key? key,
    required this.taxonomyId,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  Widget _buildRadioListTile(TaxonomyOption option) {
    return RadioListTile(
      title: Text(option.title),
      value: option.value,
      groupValue: taxonomyId,
      onChanged: (value) {
        onValueChanged(value);
        onDialogClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: taxonomyOptions.map(_buildRadioListTile).toList(),
      ),
    );
  }
}

class TaxonomyOption {
  final String title;
  final int? value;

  TaxonomyOption(this.title, this.value);
}

class FilterByClassDialog extends StatelessWidget {
  final int? selectedClass;
  final Function(int?) onClassValueChanged;
  final Function() onDialogClosed;
  final List<Class> classes;

  const FilterByClassDialog({
    super.key,
    required this.selectedClass,
    required this.onClassValueChanged,
    required this.onDialogClosed,
    required this.classes,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Filtrar por clase',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      content: Wrap(
        children: [
          CustomDropdown<String>(
            headerBuilder: (context, selectedItem) {
              return selectedClass == null
                  ? const Text('Selecciona una clase',
                      style: TextStyle(color: Colors.black54, fontSize: 16.0))
                  : Text(selectedItem, style: const TextStyle(fontSize: 16.0));
            },
            searchHintText: 'Buscar clase',
            hintText: 'Selecciona una clase',
            excludeSelected: false,
            noResultFoundText: 'No se encontraron resultados',
            items: classes.map((item) => item.name).toList(),
            onChanged: (value) {
              final selectedClassId =
                  classes.firstWhere((item) => item.name == value).id;
              onClassValueChanged(selectedClassId);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Ninguno'),
            value: null,
            groupValue: selectedClass,
            onChanged: (value) {
              onClassValueChanged(value);
              onDialogClosed();
            },
          ),
        ],
      ),
    );
  }
}

class FilterByOrderDialog extends StatelessWidget {
  final int? selectedOrder;
  final Function(int?) onOrderValueChanged;
  final Function() onDialogClosed;
  final List<OrderClass> orders;

  const FilterByOrderDialog({
    super.key,
    required this.selectedOrder,
    required this.onOrderValueChanged,
    required this.onDialogClosed,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Filtrar por orden',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      content: Wrap(
        children: [
          CustomDropdown<String>(
            headerBuilder: (context, selectedItem) {
              return selectedOrder == null
                  ? const Text('Selecciona un orden',
                      style: TextStyle(color: Colors.black54, fontSize: 16.0))
                  : Text(selectedItem, style: const TextStyle(fontSize: 16.0));
            },
            searchHintText: 'Buscar orden',
            hintText: 'Selecciona un orden',
            excludeSelected: false,
            noResultFoundText: 'No se encontraron resultados',
            items: orders.map((item) => item.name).toList(),
            onChanged: (value) {
              final selectedOrderId =
                  orders.firstWhere((item) => item.name == value).id;
              onOrderValueChanged(selectedOrderId);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Ninguno'),
            value: null,
            groupValue: selectedOrder,
            onChanged: (value) {
              onOrderValueChanged(value);
              onDialogClosed();
            },
          ),
        ],
      ),
    );
  }
}

class FilterByFamilyDialog extends StatelessWidget {
  final int? selectedFamily;
  final Function(int?) onFamilyValueChanged;
  final Function() onDialogClosed;
  final List<Family> families;

  const FilterByFamilyDialog({
    super.key,
    required this.selectedFamily,
    required this.onFamilyValueChanged,
    required this.onDialogClosed,
    required this.families,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Filtrar por familia',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
      content: Wrap(
        children: [
          CustomDropdown<String>(
            headerBuilder: (context, selectedItem) {
              return selectedFamily == null
                  ? const Text('Selecciona una familia',
                      style: TextStyle(color: Colors.black54, fontSize: 16.0))
                  : Text(selectedItem, style: const TextStyle(fontSize: 16.0));
            },
            searchHintText: 'Buscar familia',
            hintText: 'Selecciona una familia',
            excludeSelected: false,
            noResultFoundText: 'No se encontraron resultados',
            items: families.map((item) => item.name).toList(),
            onChanged: (value) {
              final selectedFamilyId =
                  families.firstWhere((item) => item.name == value).id;
              onFamilyValueChanged(selectedFamilyId);
              onDialogClosed();
            },
          ),
          RadioListTile(
            title: const Text('Ninguno'),
            value: null,
            groupValue: selectedFamily,
            onChanged: (value) {
              onFamilyValueChanged(value);
              onDialogClosed();
            },
          ),
        ],
      ),
    );
  }
}
