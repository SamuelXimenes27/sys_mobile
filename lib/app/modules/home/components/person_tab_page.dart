import 'dart:developer';

import 'package:design_leveling/app/shared/constants/string_const.dart';
import 'package:design_leveling/app/shared/widgets/buttons/button.dart';
import 'package:design_leveling/app/shared/widgets/inputs/datepicker.dart';
import 'package:design_leveling/app/shared/widgets/inputs/dropdown.dart';
import 'package:design_leveling/app/shared/widgets/inputs/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home_store.dart';

class PersonTabPage extends StatefulWidget {
  const PersonTabPage({super.key});

  @override
  State<PersonTabPage> createState() => _PersonTabPageState();
}

class _PersonTabPageState extends State<PersonTabPage> {
  final HomeStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Form(
        key: store.personFormKey,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
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
                      dropdownValue: store.typeDoc,
                      valueSelected: store.selectedDocType,
                      onChanged: (value) {
                        store.selectedDocType = (value as String?)!;
                      },
                      onSaved: (value) {
                        store.selectedDocType = (value as String?)!;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CustomTextField(
                    width: size.width * 0.63,
                    hintText: StringConst.docNumber,
                    hasValidation: false,
                    controller: store.docNumberController,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                width: size.width * 0.9,
                hintText: StringConst.personName,
                controller: store.personNameController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                width: size.width * 0.9,
                hintText: StringConst.personMotherName,
                controller: store.personMothersNameController,
                hasValidation: false,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: size.width * 0.9,
                child: const Text(
                  StringConst.birthday,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: CustomDatePicker(
                  controller: store.datePickerController,
                  labelText: StringConst.datePicker,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              CustomButtom(
                title: StringConst.consult,
                subtitle: StringConst.physicalPerson.toUpperCase(),
                icone: Icons.person,
                onTap: () {
                  if (store.personFormKey.currentState!.validate()) {
                    log(store.selectedDocType.toString());
                    log(store.docNumberController.text);
                    log(store.personNameController.text);
                    log(store.personMothersNameController.text);
                    log(store.datePickerController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
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
