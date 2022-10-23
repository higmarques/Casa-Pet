import 'package:event_tracker/features/pet_details/pet_details.dart';
import 'package:event_tracker/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PetDetailsPage extends StatelessWidget {
  final Object? arguments;

  const PetDetailsPage({
    super.key,
    required this.arguments,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PetDetailsBloc(arguments),
      child: _scaffold(context),
    );
  }

  Widget _scaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: BaseColors.primaryBeige,
      appBar: AppBar(
        title: const Text(BaseStrings.dashboardAppBarTitle),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: const PetDetailsView(),
    );
  }
}

class PetDetailsView extends StatelessWidget {
  const PetDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var pet = context.read<PetDetailsBloc>().pet;

    return Scrollbar(
      thumbVisibility: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  height: 225,
                  child: FadeInImage.assetNetwork(
                      placeholder: BaseImages.gifLoading,
                      image: pet.image,
                      placeholderScale: 5.0,
                      placeholderFit: BoxFit.contain,
                      imageScale: 0.5,
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(height: 15),
              PetDetailsContainer(pet: pet),
            ],
          ),
        ),
      ),
    );
  }

  void _didTapAdopt() {}
}

class PetDetailsContainer extends StatelessWidget {
  final PetDetailsModel pet;

  const PetDetailsContainer({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: BaseColors.beigeGray,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              pet.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: BaseColors.secondaryGreen,
                ),
                const SizedBox(width: 10),
                Text(
                  pet.location,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PetDetailElement(
                  title: BaseStrings.petDetailsType,
                  property: pet.type,
                  flex: 1,
                ),
                const SizedBox(width: 5),
                PetDetailElement(
                  title: BaseStrings.petDetailsSize,
                  property: pet.size,
                  flex: 1,
                ),
                const SizedBox(width: 5),
                PetDetailElement(
                  title: BaseStrings.petDetailsSex,
                  property: pet.sex,
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PetDetailElement(
                  title: BaseStrings.petDetailsRace,
                  property: pet.race,
                  flex: 2,
                ),
                const SizedBox(width: 5),
                PetDetailElement(
                  title: BaseStrings.petDetailsIsNeutered,
                  property: pet.isNeutered
                      ? BaseStrings.newPetIsNeuteredYes
                      : BaseStrings.newPetIsNeuteredNo,
                  flex: 1,
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              BaseStrings.petDetailsDescription,
              style: TextStyle(
                color: BaseColors.secondaryGreen,
                fontSize: 16,
              ),
            ),
            Text(pet.description),
            const SizedBox(height: 12),
            const Text(
              BaseStrings.petDetailsContactEmail,
              style: TextStyle(
                color: BaseColors.secondaryGreen,
                fontSize: 16,
              ),
            ),
            Text(pet.donatorEmail),
          ],
        ),
      ),
    );
  }
}

class PetDetailElement extends StatelessWidget {
  const PetDetailElement({
    super.key,
    required this.title,
    required this.property,
    required this.flex,
  });

  final String title;
  final String property;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: const TextStyle(color: BaseColors.secondaryGreen),
          ),
          Container(
            decoration: const BoxDecoration(
              color: BaseColors.semiTransparentBeige,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(property),
            ),
          ),
        ],
      ),
    );
  }
}
