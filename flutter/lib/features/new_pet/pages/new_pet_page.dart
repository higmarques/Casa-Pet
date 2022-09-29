// ignore_for_file: prefer_const_constructors

import 'package:event_tracker/features/new_pet/new_pet.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPetPage extends StatelessWidget {
  const NewPetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPetBloc(),
      child: _scaffold(context),
    );
  }

  GestureDetector _scaffold(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: BaseColors.primaryBeige,
        appBar: AppBar(
          title: const Text(BaseStrings.newPetAppBarTitle),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
          ),
        ),
        body: NewPetView(),
      ),
    );
  }
}

class NewPetView extends StatelessWidget {
  const NewPetView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        thumbVisibility: true,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 24),
                    Expanded(child: NewPetForm()),
                    BlocBuilder<NewPetBloc, NewPetState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: state.formState
                              ? () => _onTapCreatePet(context)
                              : null,
                          child: Text(BaseStrings.newPetButtonAddPet),
                        );
                      },
                    ),
                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapCreatePet(BuildContext context) {
    context.read<NewPetBloc>().add(NewPetCreatePet());
  }
}

class NewPetForm extends StatelessWidget {
  const NewPetForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BaseTextField(
          hintText: BaseStrings.newPetFieldName,
          onChanged: (value) => _onNameChanged(context, value),
        ),
        SizedBox(height: 16),
        PetTypeDropdown(),
        SizedBox(height: 16),
        PetSizeDropdown(),
        SizedBox(height: 16),
        BaseTextField(
          hintText: BaseStrings.newPetFieldLocation,
          maxLines: null,
          height: null,
          onChanged: (value) => _onLocationChanged(context, value),
        ),
        SizedBox(height: 16),
        BaseTextField(
          hintText: BaseStrings.newPetFieldRace,
          onChanged: (value) => _onRaceChanged(context, value),
        ),
        SizedBox(height: 16),
        PetSexDropdown(),
        SizedBox(height: 16),
        PetIsNeuteredDropdown(),
        SizedBox(height: 16),
        BaseTextField(
          hintText: BaseStrings.newPetFieldDescription,
          maxLines: null,
          height: null,
          onChanged: (value) => _onDescriptionChanged(context, value),
        ),
        SizedBox(height: 16),
        // UploadButton(_onTapUpload), Adicionar depois
        SizedBox(height: 16),
        // BaseTooltip(
        //   BaseStrings.newPetFormNotValidText,
        //   foregroundColor: BaseColors.red,
        // ),
        SizedBox(height: 24),
      ],
    );
  }

  void _onNameChanged(BuildContext context, String value) {
    context.read<NewPetBloc>().add(NewPetNameChanged(value));
  }

  void _onLocationChanged(BuildContext context, String value) {
    context.read<NewPetBloc>().add(NewPetLocationChanged(value));
  }

  void _onRaceChanged(BuildContext context, String value) {
    context.read<NewPetBloc>().add(NewPetRaceChanged(value));
  }

  void _onDescriptionChanged(BuildContext context, String value) {
    context.read<NewPetBloc>().add(NewPetDescriptionChanged(value));
  }

  void _onTapUpload(BuildContext context) {}
}

class PetTypeDropdown extends StatelessWidget {
  const PetTypeDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var typeList = [
      BaseStrings.newPetTypeDog,
      BaseStrings.newPetTypeCat,
      BaseStrings.newPetTypeBird,
      BaseStrings.newPetTypeFish,
      BaseStrings.newPetTypeRodent,
      BaseStrings.newPetTypeReptile,
      BaseStrings.newPetTypeOther
    ];
    var typeListItem = typeList
        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
        .toList();

    return BaseDropdown(
      typeListItem,
      hintText: BaseStrings.newPetFieldType,
      onChanged: (value) => _onChangeDropdown(context, value),
    );
  }

  void _onChangeDropdown(BuildContext context, String? value) {
    if (value != null) {
      context.read<NewPetBloc>().add(NewPetTypeChanged(value));
    }
  }
}

class PetSizeDropdown extends StatelessWidget {
  const PetSizeDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var typeList = [
      BaseStrings.newPetSizeSmall,
      BaseStrings.newPetSizeMedium,
      BaseStrings.newPetSizeBig
    ];
    var typeListItem = typeList
        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
        .toList();

    return BaseDropdown(
      typeListItem,
      hintText: BaseStrings.newPetFieldSize,
      onChanged: (value) => _onChangeDropdown(context, value),
    );
  }

  void _onChangeDropdown(BuildContext context, String? value) {
    if (value != null) {
      context.read<NewPetBloc>().add(NewPetSizeChanged(value));
    }
  }
}

class PetSexDropdown extends StatelessWidget {
  const PetSexDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var typeList = [
      BaseStrings.newPetSexMale,
      BaseStrings.newPetSexFemale,
      BaseStrings.newPetSexDontApply,
    ];
    var typeListItem = typeList
        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
        .toList();

    return BaseDropdown(
      typeListItem,
      hintText: BaseStrings.newPetFieldSex,
      onChanged: (value) => _onChangeDropdown(context, value),
    );
  }

  void _onChangeDropdown(BuildContext context, String? value) {
    if (value != null) {
      context.read<NewPetBloc>().add(NewPetSexChanged(value));
    }
  }
}

class PetIsNeuteredDropdown extends StatelessWidget {
  const PetIsNeuteredDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var typeList = [
      BaseStrings.newPetIsNeuteredYes,
      BaseStrings.newPetIsNeuteredNo,
    ];
    var typeListItem = typeList
        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
        .toList();

    return BaseDropdown(
      typeListItem,
      value: BaseStrings.newPetIsNeuteredNo,
      hintText: BaseStrings.newPetFieldIsNeutered,
      onChanged: (value) => _onChangeDropdown(context, value),
    );
  }

  void _onChangeDropdown(BuildContext context, String? value) {
    if (value != null) {
      context.read<NewPetBloc>().add(
            NewPetIsNeuteredChanged(value == BaseStrings.newPetIsNeuteredYes),
          );
    }
  }
}

class UploadButton extends StatelessWidget {
  const UploadButton(
    this.onTap, {
    super.key,
  });

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
          decoration: BoxDecoration(
            border: Border.all(color: BaseColors.secondaryGreen),
            borderRadius: BorderRadius.circular(10),
            color: BaseColors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(BaseStrings.newPetFieldPhoto),
              Icon(
                Icons.cloud_upload_rounded,
                size: 44,
                color: BaseColors.secondaryGreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
