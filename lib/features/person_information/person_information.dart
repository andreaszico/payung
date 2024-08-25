import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payung_pribadi/features/person_information/view_model/person_information_vm.dart';
import 'package:provider/provider.dart';

class PersonInformation extends StatefulWidget {
  static String routeName = "PersonInformation";

  const PersonInformation({super.key});

  @override
  State<PersonInformation> createState() => _PersonInformationState();
}

class _PersonInformationState extends State<PersonInformation> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ProfileDataVM(context),
      builder: (context, child) => _body(context),
    );
  }

  Scaffold _body(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Informasi Pribadi",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.black,
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: SafeArea(
        child: Consumer<ProfileDataVM>(builder: (context, provider, child) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(provider.stepCount * 3 - 2, (index) {
                    if (index % 3 == 0) {
                      return GestureDetector(
                        onTap: () {
                          provider.changePages(index);
                        },
                        child: _buildStepCircle(
                            isActive: index <= provider.currentStep,
                            data: provider.steps[index ~/ 3]),
                      );
                    } else {
                      return _buildLine(
                          isActive: index <= provider.currentStep);
                    }
                  }),
                ),
                Expanded(
                  child: Container(
                    child: provider.pages[provider.currentPage],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStepCircle({required bool isActive, required StepModel data}) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isActive ? Colors.yellow[800] : Colors.yellow[400],
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            data.icon,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: 75,
          child: Text(
            data.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLine({required bool isActive}) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            color: isActive ? Colors.yellow[800] : Colors.yellow[400],
            height: 1.5,
          ),
        ],
      ),
    );
  }
}
