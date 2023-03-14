import 'dart:developer';

import 'package:design_leveling/app/modules/home/components/vehicle_search_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../shared/constants/string_const.dart';
import '../../../shared/widgets/buttons/button.dart';
import '../../../shared/widgets/inputs/dropdown.dart';
import '../../../shared/widgets/inputs/textfield.dart';
import '../home_store.dart';

class VehicleTabPage extends StatefulWidget {
  const VehicleTabPage({super.key});

  @override
  State<VehicleTabPage> createState() => _VehicleTabPageState();
}

class _VehicleTabPageState extends State<VehicleTabPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: store.vehicleFormKey,
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.37),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.01),
                    child: CustomDropdown(
                      width: size.width * 0.24,
                      dropdownValue: store.typeDocVehicle,
                      valueSelected: store.selectedDocTypeVehicle,
                      onChanged: (value) {
                        store.selectedDocTypeVehicle = (value as String?)!;
                      },
                      onSaved: (value) {
                        store.selectedDocTypeVehicle = (value as String?)!;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomTextField(
                    width: size.width * 0.63,
                    hintText: StringConst.docNumber,
                    controller: store.docVehicleNumberController,
                  ),
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButtom(
                title: StringConst.consult,
                subtitle: StringConst.physicalPerson.toUpperCase(),
                icone: Icons.person,
                onTap: () {
                  if (store.vehicleFormKey.currentState!.validate()) {
                    store.searchByDocNumberVehicle(
                        store.docVehicleNumberController.text,
                        store.selectedDocTypeVehicle!);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => VehicleSearchDetailsPage(
                          ownerName: store.ownerName,
                          vehicleType: store.vehicleType,
                          model: store.model,
                          brand: store.brand,
                          plate: store.plate,
                          chassi: store.chassi,
                          renavam: store.renavam,
                          yearFab: store.yearFab,
                          vehicleColor: store.vehicleColor,
                          mercosulPlate: store.mercosulPlate,
                          numberOfAxles: store.numberOfAxles,
                          cargoCapacity: store.cargoCapacity,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
