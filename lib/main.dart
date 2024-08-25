import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:payung_pribadi/core/provider/general_provider.dart';
import 'package:payung_pribadi/core/storage/storage.dart';
import 'package:payung_pribadi/features/home_page/home_page.dart';
import 'package:payung_pribadi/features/person_information/person_information.dart';
import 'package:payung_pribadi/features/profile_page/profile_page.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Storage.initStorage();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IGeneralProvider(context),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        MyHomePage.routeName: (context) => const MyHomePage(),
        ProfilePage.routeName: (context) => const ProfilePage(),
        PersonInformation.routeName: (context) => const PersonInformation(),
      },
      home: const MyHomePage(),
    );
  }
}
