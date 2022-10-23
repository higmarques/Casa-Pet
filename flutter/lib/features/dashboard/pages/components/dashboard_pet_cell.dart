part of '../dashboard_page.dart';

class DashboardPetCell extends StatelessWidget {
  const DashboardPetCell(this.pet, {super.key});

  final DashboardPet pet;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToDetails(context),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: SizedBox(
          height: 225,
          child: Stack(children: [
            SizedBox(
              height: 225,
              child: FadeInImage.assetNetwork(
                  placeholder: BaseImages.gifLoading,
                  image: pet.image,
                  fit: BoxFit.fitHeight),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
          ]),
        ),
      ),
    );
  }

  void _goToDetails(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.dashboard, arguments: pet);
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
