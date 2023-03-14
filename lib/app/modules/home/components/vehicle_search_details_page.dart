import 'package:design_leveling/app/shared/constants/colors_const.dart';
import 'package:design_leveling/app/shared/constants/string_const.dart';
import 'package:design_leveling/app/shared/widgets/loading/dot_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/widgets/buttons/elevated_button.dart';
import '../home_store.dart';

class VehicleSearchDetailsPage extends StatefulWidget {
  final String? ownerName;
  final String? vehicleType;
  final String? model;
  final String? brand;
  final String? plate;
  final String? chassi;
  final String? renavam;
  final String? yearFab;
  final String? vehicleColor;
  final String? mercosulPlate;
  final String? numberOfAxles;
  final String? cargoCapacity;

  const VehicleSearchDetailsPage({
    super.key,
    required this.ownerName,
    required this.vehicleType,
    required this.model,
    required this.brand,
    required this.plate,
    required this.chassi,
    required this.renavam,
    required this.yearFab,
    required this.vehicleColor,
    required this.mercosulPlate,
    required this.numberOfAxles,
    required this.cargoCapacity,
  });

  @override
  State<VehicleSearchDetailsPage> createState() =>
      _VehicleSearchDetailsPageState();
}

class _VehicleSearchDetailsPageState extends State<VehicleSearchDetailsPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            StringConst.vehicleSearch,
            style: TextStyle(color: Colors.white, fontFamily: 'Lexend'),
          ),
        ),
        backgroundColor: ColorsConst.primary1,
        actions: const [
          Icon(
            Icons.share,
            color: ColorsConst.primary1,
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xffffffff),
          ),
          onPressed: () {
            store.clearInputs(context);
            Navigator.pop(context);
          },
        ),
      ),
      body: Observer(
        builder: (context) {
          if (store.actualSearchState == SearchState.loading) {
            return const Center(
              child: CirculaDotLoading(
                  numDots: 10,
                  currentDotColor: ColorsConst.primary1,
                  defaultDotColor: ColorsConst.terciary500),
            );
          } else if (store.actualSearchState == SearchState.error) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            StringConst.errorOnSearch,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          ButtonWidget(
                            onPressed: () => {Navigator.pop(context)},
                            title: StringConst.back,
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          } else if (store.actualSearchState == SearchState.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: size.width * 1,
                      height: size.height * 0.2,
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: size.width * 1,
                      height: size.height * 0.07,
                      child: Text(
                        '${widget.brand!}/${widget.model!}',
                        style: const TextStyle(
                          fontFamily: 'Lexend',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: ColorsConst.primary2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 1,
                    height: size.height * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          informationText(
                              StringConst.ownerName, widget.ownerName!),
                          informationText(
                              StringConst.vehicleType, widget.vehicleType!),
                          informationText(StringConst.plate, widget.plate!),
                          informationText(StringConst.chassi, widget.chassi!),
                          informationText(StringConst.renavam, widget.renavam!),
                          informationText(StringConst.yearFab, widget.yearFab!),
                          informationText(
                              StringConst.vehicleColor, widget.vehicleColor!),
                          informationText(
                              StringConst.mercosulPlate,
                              // ignore: unrelated_type_equality_checks
                              widget.mercosulPlate! == false ? 'Não' : 'Sim'),
                          store.numberOfAxles! != ''
                              ? informationText(StringConst.numberOfAxles,
                                  widget.numberOfAxles!)
                              : Container(),
                          store.cargoCapacity!.isNotEmpty
                              ? informationText(StringConst.cargoCapacity,
                                  widget.cargoCapacity!)
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

Widget informationText(String title, String information) {
  return Padding(
    padding: const EdgeInsets.only(top: 8),
    child: RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$title: ',
            style: const TextStyle(
              fontFamily: 'Lexend',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ColorsConst.black60,
            ),
          ),
          TextSpan(
            text: information.toUpperCase(),
            style: const TextStyle(
              color: ColorsConst.neutralColor2,
              fontSize: 16,
            ),
          )
        ],
      ),
    ),
  );
}
