import 'package:flutter/material.dart';
import 'package:species/src/domain/entities/class.dart';
import 'package:species/src/domain/entities/family.dart';
import 'package:species/src/domain/entities/order.dart';

class OrderByNameScientificDialog extends StatelessWidget {
  final String? orderNameScientific;
  final Function(String?) onValueChanged;
  final Function() onDialogClosed;

  const OrderByNameScientificDialog({
    Key? key,
    required this.orderNameScientific,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Ordenar por nombre científico',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: OrderByNameScientificOptions(
                    orderNameScientific: orderNameScientific,
                    onValueChanged: onValueChanged,
                    onDialogClosed: onDialogClosed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderByNameScientificOptions extends StatelessWidget {
  final List<OrderByNameScientificOption> orderOptions = [
    OrderByNameScientificOption('Ascendente', 'ASC'),
    OrderByNameScientificOption('Descendente', 'DESC'),
    OrderByNameScientificOption('Ninguno', null),
  ];

  final String? orderNameScientific;
  final Function(String?) onValueChanged;
  final Function() onDialogClosed;

  OrderByNameScientificOptions({
    Key? key,
    required this.orderNameScientific,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  Widget _buildRadioListTile(OrderByNameScientificOption option) {
    return RadioListTile(
      title: Text(option.title),
      value: option.value,
      groupValue: orderNameScientific,
      onChanged: (value) {
        onValueChanged(value as String);
        onDialogClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...orderOptions.map(_buildRadioListTile).toList(),
      ],
    );
  }
}

class OrderByNameScientificOption {
  final String title;
  final String? value;

  OrderByNameScientificOption(this.title, this.value);
}

class FilterBySoundDialog extends StatelessWidget {
  final int? hasSound;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;

  const FilterBySoundDialog({
    Key? key,
    required this.hasSound,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filtrar por sonido',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SoundOptions(
                    hasSound: hasSound,
                    onValueChanged: onValueChanged,
                    onDialogClosed: onDialogClosed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SoundOptions extends StatelessWidget {
  final List<SoundOption> soundOptions = [
    SoundOption('Con sonido', 1),
    SoundOption('Sin sonido', 0),
    SoundOption('Ninguno', null),
  ];

  final int? hasSound;
  final Function(int? p1) onValueChanged;
  final Function() onDialogClosed;

  SoundOptions({
    Key? key,
    required this.hasSound,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  Widget _buildRadioListTile(SoundOption option) {
    return RadioListTile(
      title: Text(option.title),
      value: option.value,
      groupValue: hasSound,
      onChanged: (value) {
        onValueChanged(value);
        onDialogClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...soundOptions.map(_buildRadioListTile).toList(),
      ],
    );
  }
}

class SoundOption {
  final String title;
  final int? value;

  SoundOption(this.title, this.value);
}

class FilterByConservationStatusDialog extends StatelessWidget {
  final int? conservationStatus;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;

  const FilterByConservationStatusDialog({
    Key? key,
    required this.conservationStatus,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shadowColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filtrar por estado de conservación',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConservationStatusOptions(
                    conservationStatus: conservationStatus,
                    onValueChanged: onValueChanged,
                    onDialogClosed: onDialogClosed,
                  ),
                ),
              ),
              RadioListTile(
                title: const Text('Ninguno'),
                value: null,
                groupValue: conservationStatus,
                onChanged: (value) {
                  onValueChanged(value);
                  onDialogClosed();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConservationStatusOptions extends StatelessWidget {
  final List<ConservationStatusOption> conservationStatusOptions = [
    ConservationStatusOption('En peligro', 1),
    ConservationStatusOption('Vulnerable', 2),
    ConservationStatusOption('Casi amenazado', 3),
    ConservationStatusOption('Preocupación menor', 4),
  ];

  final int? conservationStatus;
  final Function(int? p1) onValueChanged;
  final Function() onDialogClosed;

  ConservationStatusOptions({
    Key? key,
    required this.conservationStatus,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  Widget _buildRadioListTile(ConservationStatusOption option) {
    return RadioListTile(
      title: Text(option.title),
      value: option.value,
      groupValue: conservationStatus,
      onChanged: (value) {
        onValueChanged(value);
        onDialogClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...conservationStatusOptions.map(_buildRadioListTile).toList(),
      ],
    );
  }
}

class ConservationStatusOption {
  final String title;
  final int? value;

  ConservationStatusOption(this.title, this.value);
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
    return Dialog(
      shadowColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filtrar por categoría',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: TaxonomyRadioOptions(
                    taxonomyId: taxonomyId,
                    onValueChanged: onValueChanged,
                    onDialogClosed: onDialogClosed,
                  ),
                ),
              ),
              RadioListTile(
                title: const Text('Ninguno'),
                value: null,
                groupValue: taxonomyId,
                onChanged: (value) {
                  onValueChanged(value);
                  onDialogClosed();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TaxonomyRadioOptions extends StatelessWidget {
  final List<TaxonomyOption> taxonomyOptions = [
    TaxonomyOption('Aves', 1),
    TaxonomyOption('Mamíferos', 2),
    TaxonomyOption('Reptiles', 3),
    TaxonomyOption('Anfibios', 4),
    TaxonomyOption('Peces', 5),
    TaxonomyOption('Insectos', 6),
    TaxonomyOption('Arboles', 7),
    TaxonomyOption('Palmeras', 8),
  ];

  final int? taxonomyId;
  final Function(int? p1) onValueChanged;
  final Function() onDialogClosed;

  TaxonomyRadioOptions({
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
    return Column(
      children: [
        ...taxonomyOptions.map(_buildRadioListTile).toList(),
      ],
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
    Key? key,
    required this.selectedClass,
    required this.onClassValueChanged,
    required this.onDialogClosed,
    required this.classes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final size = MediaQuery.of(context).size;
    return Dialog(
      shadowColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(
            maxWidth: 400,
            maxHeight: isMobile ? size.height * 0.6 : size.height * 0.8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filtrar por clase',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ClassOptions(
                    selectedClass: selectedClass,
                    onClassValueChanged: onClassValueChanged,
                    onDialogClosed: onDialogClosed,
                    classes: classes,
                  ),
                ),
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
        ),
      ),
    );
  }
}

class ClassOptions extends StatelessWidget {
  final int? selectedClass;
  final Function(int?) onClassValueChanged;
  final Function() onDialogClosed;
  final List<Class> classes;

  const ClassOptions({
    Key? key,
    required this.selectedClass,
    required this.onClassValueChanged,
    required this.onDialogClosed,
    required this.classes,
  }) : super(key: key);

  Widget _buildRadioListTile(Class classItem) {
    return RadioListTile(
      title: Text(classItem.name),
      value: classItem.id,
      groupValue: selectedClass,
      onChanged: (value) {
        onClassValueChanged(value as int);
        onDialogClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...classes.map((classItem) => _buildRadioListTile(classItem)).toList(),
      ],
    );
  }
}

class FilterByOrderDialog extends StatelessWidget {
  final int? selectedOrder;
  final Function(int?) onOrderValueChanged;
  final Function() onDialogClosed;
  final List<OrderClass> orders;

  const FilterByOrderDialog({
    Key? key,
    required this.selectedOrder,
    required this.onOrderValueChanged,
    required this.onDialogClosed,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final size = MediaQuery.of(context).size;
    return Dialog(
      shadowColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(
            maxWidth: 400,
            maxHeight: isMobile ? size.height * 0.6 : size.height * 0.8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filtrar por orden',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: OrderOptions(
                    selectedOrder: selectedOrder,
                    onOrderValueChanged: onOrderValueChanged,
                    onDialogClosed: onDialogClosed,
                    orders: orders,
                  ),
                ),
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
        ),
      ),
    );
  }
}

class OrderOptions extends StatelessWidget {
  final int? selectedOrder;
  final Function(int?) onOrderValueChanged;
  final Function() onDialogClosed;
  final List<OrderClass> orders;

  const OrderOptions({
    Key? key,
    required this.selectedOrder,
    required this.onOrderValueChanged,
    required this.onDialogClosed,
    required this.orders,
  }) : super(key: key);

  Widget _buildRadioListTile(OrderClass orderItem) {
    return RadioListTile(
      title: Text(orderItem.name),
      value: orderItem.id,
      groupValue: selectedOrder,
      onChanged: (value) {
        onOrderValueChanged(value as int);
        onDialogClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...orders.map((orderItem) => _buildRadioListTile(orderItem)).toList(),
      ],
    );
  }
}

class FilterByFamilyDialog extends StatelessWidget {
  final int? selectedFamily;
  final Function(int?) onFamilyValueChanged;
  final Function() onDialogClosed;
  final List<Family> families;

  const FilterByFamilyDialog({
    Key? key,
    required this.selectedFamily,
    required this.onFamilyValueChanged,
    required this.onDialogClosed,
    required this.families,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final size = MediaQuery.of(context).size;
    return Dialog(
      shadowColor: Colors.transparent,
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          constraints: BoxConstraints(
            maxWidth: 400,
            maxHeight: isMobile ? size.height * 0.6 : size.height * 0.8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Filtrar por familia',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: FamilyOptions(
                    selectedFamily: selectedFamily,
                    onFamilyValueChanged: onFamilyValueChanged,
                    onDialogClosed: onDialogClosed,
                    families: families,
                  ),
                ),
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
        ),
      ),
    );
  }
}

class FamilyOptions extends StatelessWidget {
  final int? selectedFamily;
  final Function(int?) onFamilyValueChanged;
  final Function() onDialogClosed;
  final List<Family> families;

  const FamilyOptions({
    Key? key,
    required this.selectedFamily,
    required this.onFamilyValueChanged,
    required this.onDialogClosed,
    required this.families,
  }) : super(key: key);

  Widget _buildRadioListTile(Family familyItem) {
    return RadioListTile(
      title: Text(familyItem.name),
      value: familyItem.id,
      groupValue: selectedFamily,
      onChanged: (value) {
        onFamilyValueChanged(value as int);
        onDialogClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...families
            .map((familyItem) => _buildRadioListTile(familyItem))
            .toList(),
      ],
    );
  }
}
