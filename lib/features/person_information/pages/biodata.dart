import 'package:flutter/material.dart';
import 'package:payung_pribadi/components/input/input_dropdown.dart';
import 'package:payung_pribadi/components/input/input_main.dart';
import 'package:payung_pribadi/features/person_information/view_model/person_information_vm.dart';
import 'package:provider/provider.dart';

class BiodataView extends StatefulWidget {
  const BiodataView({super.key});

  @override
  State<BiodataView> createState() => _BiodataViewState();
}

class _BiodataViewState extends State<BiodataView> {
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }

  Widget _body(BuildContext context) {
    return Consumer<ProfileDataVM>(builder: (context, provider, child) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            IInputText(
              label: "Nama Lengkap",
              notNull: true,
              controller: provider.nameController,
            ),
            InputDropdown(
              option: provider.genderListTemp,
              label: "Jenis Kelamin",
              notNull: true,
              selected: provider.selectedGender,
              onChange: (val) {
                provider.onChangeDropdown("GENDER", val);
              },
            ),
            IInputText(
              label: "Alamat Email",
              notNull: true,
              controller: provider.emailController,
            ),
            IInputText(
              label: "No. HP",
              notNull: true,
              controller: provider.phoneController,
            ),
            InputDropdown(
                option: provider.educationListTemp,
                label: "Pendidikan",
                notNull: true,
                selected: provider.selectedEducation,
                onChange: (val) {
                  provider.onChangeDropdown("EDUCATION", val);
                }),
            InputDropdown(
                option: provider.marriageListTemp,
                label: "Status Pernikahan",
                notNull: true,
                selected: provider.selectedMarriage,
                onChange: (val) {
                  provider.onChangeDropdown("MARRIAGE", val);
                }),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber[400],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7))),
                onPressed: () {
                  provider.onNextStage(
                    context,
                    name: provider.nameController.text,
                    email: provider.emailController.text,
                    phone: provider.phoneController.text,
                    gender: provider.selectedGender,
                    education: provider.selectedEducation,
                    marriage: provider.selectedMarriage,
                  );
                },
                child: const Text(
                  "Selanjutnya",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            )
          ],
        ),
      );
    });
  }
}
