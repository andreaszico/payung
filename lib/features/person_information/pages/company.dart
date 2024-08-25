import 'package:flutter/material.dart';
import 'package:payung_pribadi/components/input/input_main.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({super.key});

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        const IInputText(
          label: "Nama Usaha / Perusahaan",
        ),
        const IInputText(
          label: "Alamat Usaha / Perusahaan",
        ),
        const IInputText(
          label: "Cabang Bank",
        ),
        const IInputText(
          label: "Nomor Rekening",
        ),
        const IInputText(
          label: "Nama Pemilik Rekening",
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
                  onPressed: () {},
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
                  onPressed: () {},
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
