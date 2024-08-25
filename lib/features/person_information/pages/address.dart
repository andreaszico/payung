import 'package:flutter/material.dart';
import 'package:payung_pribadi/components/input/input_dropdown.dart';
import 'package:payung_pribadi/components/input/input_main.dart';
import 'package:payung_pribadi/features/person_information/view_model/person_information_vm.dart';
import 'package:provider/provider.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileDataVM>(builder: (context, provider, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const IInputText(
              label: "Nik",
              notNull: true,
            ),
            const IInputText(
              label: "Alamat Sesuai KTP",
              notNull: true,
            ),
            InputDropdown(
              option: provider.provincesTemp,
              label: "Provinsi",
              notNull: true,
              selected: provider.selectedProvinces,
            ),
            InputDropdown(
              option: provider.districtsTemp,
              label: "Kabupaten",
              notNull: true,
              selected: provider.selectedDistricts,
            ),
            InputDropdown(
              option: provider.subDistrictsTemp,
              label: "Kecamatan",
              notNull: true,
              selected: provider.selectedSubDistrict,
            ),
            const IInputText(
              label: "Kode POS",
              notNull: true,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                        side: const BorderSide(color: Colors.amber),
                      ),
                      onPressed: () {
                        provider.changePages(0);
                      },
                      child: Text(
                        "Sebelumnya",
                        style: TextStyle(
                          color: Colors.amber[400],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[400],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.amber),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      onPressed: () {
                        provider.changePages(7);
                      },
                      child: const Text(
                        "Selanjutnya",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
