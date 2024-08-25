import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:payung_pribadi/core/model/biodata.dart';
import 'package:payung_pribadi/core/storage/storage.dart';
import 'package:payung_pribadi/features/person_information/model/data.dart';
import 'package:payung_pribadi/features/person_information/pages/address.dart';
import 'package:payung_pribadi/features/person_information/pages/biodata.dart';
import 'package:payung_pribadi/features/person_information/pages/company.dart';

class StepModel {
  String title;
  IconData icon;

  StepModel({required this.title, required this.icon});
}

class ProfileDataVM extends ChangeNotifier {
  ProfileDataVM(BuildContext context, {init = true}) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (init) {
        initPage(context);
      }
    });
  }

  int stepCount = 3;
  int currentStep = 1;
  int currentPage = 0;

  late Box<Biodata> biodataBox;

  final List<StepModel> steps = [
    StepModel(title: "Biodata", icon: Icons.person),
    StepModel(title: "Alamat Pribadi", icon: Icons.home),
    StepModel(title: "Informasi Perusahaan", icon: Icons.work),
  ];

  final List<Widget> pages = [
    const BiodataView(),
    const AddressView(),
    const CompanyView()
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  List<String> genderListTemp = [];
  List<String> educationListTemp = [];
  List<String> marriageListTemp = [];
  List<String> provincesTemp = [];
  List<String> districtsTemp = [];
  List<String> subDistrictsTemp = [];

  String selectedGender = "";
  String selectedEducation = "";
  String selectedMarriage = "";
  String selectedProvinces = "";
  String selectedDistricts = "";
  String selectedSubDistrict = "";

  void initBiodata() {
    biodataBox = Hive.box(profileBiodata);
    Biodata biodata = biodataBox.get("biodata")!;

    selectedGender = biodata.gender ?? genderList.first;
    selectedEducation = biodata.education ?? educationList.first;
    selectedMarriage = biodata.marriage ?? marriageList.first;
    nameController.text = biodata.name ?? "";
    emailController.text = biodata.email ?? "";
    phoneController.text = biodata.phone ?? "";
  }

  void initPage(BuildContext context) async {
    await Hive.openBox<Biodata>(profileBiodata);
    initValues();
    initBiodata();
    notifyListeners();
  }

  void initValues() {
    // BIODATA
    genderListTemp = genderList;
    educationListTemp = educationList;
    marriageListTemp = marriageList;
    selectedGender = genderList.first;
    selectedEducation = educationList.first;
    selectedMarriage = marriageList.first;
    // ADDRESS
    provincesTemp = provinces;
    districtsTemp = districts;
    subDistrictsTemp = subDistricts;
    selectedProvinces = provinces.first;
    selectedDistricts = districts.first;
    selectedSubDistrict = subDistricts.first;

    // COMPANY
  }

  void changePages(int index) {
    currentStep = index + 1;
    currentPage = index ~/ 3;
    notifyListeners();
  }

  void onChangeDropdown(String key, String value) {
    switch (key) {
      case "GENDER":
        selectedGender = value;
        break;
      case "EDUCATION":
        selectedEducation = value;
        break;
      case "MARRIAGE":
        selectedMarriage = value;
        break;
      default:
        break;
    }

    notifyListeners();
  }

  void onNextStage(BuildContext context,
      {required String name,
      required String email,
      required String phone,
      required String gender,
      required String education,
      required String marriage}) {
    try {
      biodataBox.put(
        "biodata",
        Biodata(
          name: name,
          email: email,
          phone: phone,
          gender: gender,
          education: education,
          marriage: marriage,
        ),
      );
      changePages(3);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Success'),
      ));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('ERROR'),
      ));
    }
  }
}
