import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:species/src/data/models/classes/taxonomy_for_search_iiap/taxonomy_for_search_iiap.dart';
import 'package:species/src/domain/entities/class/class.dart';
import 'package:species/src/domain/entities/conservation_states/conservation_states.dart';
import 'package:species/src/domain/entities/family/family.dart';
import 'package:species/src/domain/entities/order/order.dart';
import 'package:species/src/presentation/global/colors.dart';

class ListAlphabeticOrder extends StatelessWidget {
  final String? orderAscDesc;
  final Function(String?) onValueChanged;
  final Function() onDialogClosed;

  const ListAlphabeticOrder({
    Key? key,
    required this.orderAscDesc,
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
                'Listar por orden alfabético',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: AlphabeticOrderOptions(
                    orderNameScientific: orderAscDesc,
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

class AlphabeticOrderOptions extends StatelessWidget {
  final List<AphabeticOrderOption> orderOptions = [
    AphabeticOrderOption('A-Z', 'ASC'),
    AphabeticOrderOption('Z-A', 'DESC'),
    AphabeticOrderOption('Registro más reciente', null),
  ];

  final String? orderNameScientific;
  final Function(String?) onValueChanged;
  final Function() onDialogClosed;

  AlphabeticOrderOptions({
    Key? key,
    required this.orderNameScientific,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  Widget _buildRadioListTile(AphabeticOrderOption option) {
    return RadioListTile(
      title: Text(option.title),
      value: option.value,
      groupValue: orderNameScientific,
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
        ...orderOptions.map(_buildRadioListTile).toList(),
      ],
    );
  }
}

class AphabeticOrderOption {
  final String title;
  final String? value;

  AphabeticOrderOption(this.title, this.value);
}

class ListByNameOrder extends StatelessWidget {
  final String? orderName;
  final Function(String?) onValueChanged;
  final Function() onDialogClosed;

  const ListByNameOrder(
      {super.key,
      this.orderName,
      required this.onValueChanged,
      required this.onDialogClosed});

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
                'Ordenar por nombre',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: NameOrderOptions(
                    orderName: orderName,
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

class NameOrderOptions extends StatelessWidget {
  final List<NameOrderOption> nameOptions = [
    NameOrderOption('Nombre común', 'vc_nombre'),
    NameOrderOption('Nombre científico', 'vc_nombre_cientifico'),
    NameOrderOption('Registro más reciente', null),
  ];

  final String? orderName;
  final Function(String?) onValueChanged;
  final Function() onDialogClosed;

  NameOrderOptions({
    Key? key,
    required this.orderName,
    required this.onValueChanged,
    required this.onDialogClosed,
  }) : super(key: key);

  Widget _buildRadioListTile(NameOrderOption option) {
    return RadioListTile(
      title: Text(option.title),
      value: option.value,
      groupValue: orderName,
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
        ...nameOptions.map(_buildRadioListTile).toList(),
      ],
    );
  }
}

class NameOrderOption {
  final String title;
  final String? value;

  NameOrderOption(this.title, this.value);
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
    SoundOption('Solo con sonido', 1),
    SoundOption('Solo sin sonido', 0),
    SoundOption('Todos', null),
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
  final int? selectedConservationStatus;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;
  final List<ConservationStates>conservationStatusesList;

  const FilterByConservationStatusDialog({
    Key? key,
    required this.selectedConservationStatus,
    required this.onValueChanged,
    required this.onDialogClosed,
    required this.conservationStatusesList,
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
                'Filtrar por estado de conservación',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConservationStatusOptions(
                    conservationStatus: selectedConservationStatus,
                    onValueChanged: onValueChanged,
                    onDialogClosed: onDialogClosed,
                    conservationStatuses: conservationStatusesList,
                  ),
                ),
              ),
              RadioListTile(
                title: const Text('Todos'),
                value: null,
                groupValue: selectedConservationStatus,
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
  final int? conservationStatus;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;
  final List<ConservationStates> conservationStatuses;

  const ConservationStatusOptions({
    Key? key,
    required this.conservationStatus,
    required this.onValueChanged,
    required this.onDialogClosed,
    required this.conservationStatuses,
  }) : super(key: key);

  Widget _buildRadioListTile(ConservationStates conservationStatusItem) {
    return RadioListTile(
      title: Row(
        children: [
          if (conservationStatusItem.image != null &&
              conservationStatusItem.image!.isNotEmpty)
            CachedNetworkImage(
              imageUrl: conservationStatusItem.image!,
              width: 30,
              height: 30,
            ),
            if (conservationStatusItem.name != null &&
              conservationStatusItem.name!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(conservationStatusItem.name!),
          ),
        ],
      ),
      value: conservationStatusItem.id,
      groupValue: conservationStatus,
      onChanged: (value) {
        onValueChanged(value as int);
        onDialogClosed();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...conservationStatuses
            .map((conservationStatusItem) =>
                _buildRadioListTile(conservationStatusItem))
            .toList(),
      ],
    );
  }
}

class FilterByCategoryDialog extends StatelessWidget {
  final int? taxonomyId;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;
  final List<TaxonomyForSearchIiap> taxonomyList;

  const FilterByCategoryDialog({
    Key? key,
    required this.taxonomyId,
    required this.onValueChanged,
    required this.onDialogClosed,
    required this.taxonomyList,
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
                  child: CategoryRadioOptions(
                    taxonomyId: taxonomyId,
                    onValueChanged: onValueChanged,
                    onDialogClosed: onDialogClosed,
                    taxonomyList: taxonomyList,
                  ),
                ),
              ),
              RadioListTile(
                title: const Text('Todos'),
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

class CategoryRadioOptions extends StatelessWidget {
  final int? taxonomyId;
  final Function(int?) onValueChanged;
  final Function() onDialogClosed;
  final List<TaxonomyForSearchIiap> taxonomyList;

  const CategoryRadioOptions({
    Key? key,
    required this.taxonomyId,
    required this.onValueChanged,
    required this.onDialogClosed,
    required this.taxonomyList,
  }) : super(key: key);

  Widget _buildRadioListTile(TaxonomyForSearchIiap taxonomyItem) {
    return RadioListTile(
      title: Row(
        children: [
          if(taxonomyItem.image != null && taxonomyItem.image!.isNotEmpty)
          CachedNetworkImage(
            imageUrl: taxonomyItem.image!,
            color: taxonomyId == taxonomyItem.id
                ? CustomColors.primary
                : CustomColors.grey.withOpacity(0.5),
            
            width: 30,
            height: 30,
          ),
          if(taxonomyItem.name != null && taxonomyItem.name!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(taxonomyItem.name!),
          ),
        ],
      ),
      value: taxonomyItem.id,
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
        ...taxonomyList
            .map((taxonomyItem) => _buildRadioListTile(taxonomyItem))
            .toList(),
      ],
    );
  }
}

class FilterByClassDialog extends StatelessWidget {
  final int? selectedClass;
  final Function(int?) onClassValueChanged;
  final Function() onDialogClosed;
  final List<ClassC> classes;

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
                'Filtrar por taxonomía',
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
                title: const Text('Sin preferencia'),
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
  final List<ClassC> classes;

  const ClassOptions({
    Key? key,
    required this.selectedClass,
    required this.onClassValueChanged,
    required this.onDialogClosed,
    required this.classes,
  }) : super(key: key);

  Widget _buildRadioListTile(ClassC classItem) {
    return RadioListTile(
      title: classItem.name != null && classItem.name!.isNotEmpty ? Text(classItem.name!) : null,
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
  final List<OrderC> orders;

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
                title: const Text('Sin preferencia'),
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
  final List<OrderC> orders;

  const OrderOptions({
    Key? key,
    required this.selectedOrder,
    required this.onOrderValueChanged,
    required this.onDialogClosed,
    required this.orders,
  }) : super(key: key);

  Widget _buildRadioListTile(OrderC orderItem) {
    return RadioListTile(
      title: Text(orderItem.name ?? ''),
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
                title: const Text('Sin preferencia'),
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
      title: Text(familyItem.name ?? ''),
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
