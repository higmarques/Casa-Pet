// ignore_for_file: must_be_immutable

part of '../dashboard_page.dart';

class DashboardPetCell extends StatelessWidget {
  DashboardPetCell(this.pet, {super.key}) {
    isLocalImage = false;
  }

  DashboardPetCell.fromImage(Uint8List image, {super.key}) {
    pet = DashboardPet(
        id: 0,
        name: "Exemplo",
        type: "Tipo",
        size: "Tamanho",
        location: "Endereço",
        race: "Raça",
        sex: "Sexo",
        isNeutered: true,
        description: "Descrição",
        image: "imageURL",
        donatorEmail: "email@exemplo.com");
    isLocalImage = true;
    localImage = image;
  }

  late DashboardPet pet;
  late bool isLocalImage;
  late Uint8List localImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetails(context),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: BaseColors.lightGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: SizedBox(
          height: 225,
          child: Stack(
            fit: StackFit.expand,
            children: [
              SizedBox(
                height: 255,
                child: isLocalImage
                    ? Image.memory(
                        localImage,
                        scale: 2.0,
                        fit: BoxFit.fitWidth,
                      )
                    : FadeInImage.assetNetwork(
                        imageErrorBuilder: (context, error, stackTrace) =>
                            Image.asset(BaseImages.loginCenterImage),
                        placeholder: BaseImages.gifLoading,
                        image: pet.image,
                        imageScale: 2.0,
                        fit: BoxFit.fitWidth,
                      ),
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.1, 0.3, 0.4],
                    colors: [
                      BaseColors.white,
                      BaseColors.semiTransparentWhite,
                      BaseColors.transparentWhite
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            "${BaseStrings.dashboardCellName}${pet.name}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PetParameter(
                          title: BaseStrings.dashboardCellSex,
                          parameter: pet.sex,
                        ),
                        PetParameter(
                          title: BaseStrings.dashboardCellType,
                          parameter: pet.type,
                        ),
                        PetParameter(
                          title: BaseStrings.dashboardCellSize,
                          parameter: pet.size,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _goToDetails(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.petDetails, arguments: pet.toJson());
  }
}

class PetParameter extends StatelessWidget {
  const PetParameter({
    super.key,
    required this.title,
    required this.parameter,
  });

  final String title;
  final String parameter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          parameter,
        )
      ],
    );
  }
}
