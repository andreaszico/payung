import 'package:flutter/material.dart';
import 'package:payung_pribadi/components/bottom_navigation/bottom_navigation.dart';
import 'package:payung_pribadi/components/icons/icon_with_banner.dart';
import 'package:payung_pribadi/core/model/menu.dart';
import 'package:payung_pribadi/features/profile_page/profile_page.dart';

class MyHomePage extends StatefulWidget {
  static String routeName = "MyHomePage";

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Selamat Sore',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              'Zico',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: 50,
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                surfaceTintColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                shadowColor: Colors.transparent,
              ),
              onPressed: () {},
              child: const IconWithBanner(
                icon: Icon(
                  Icons.notifications_outlined,
                  color: Colors.white,
                ),
                banner: "0",
                borderRadius: 100,
                width: 16,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(
            width: 7,
          ),
          SizedBox(
            width: 45,
            height: 45,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                backgroundColor: Colors.grey[500],
              ),
              onPressed: () {
                Navigator.pushNamed(context, ProfilePage.routeName);
              },
              child: const Text(
                'Z',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Produk Keuangan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: financialProducts.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        final menu = financialProducts[index];
                        return SizedBox(
                          width: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconWithBanner(
                                icon: Icon(
                                  menu.icon,
                                  color: Colors.black,
                                ),
                                banner: menu.banner ?? "",
                                borderRadius: 100,
                                width: 16,
                                fontSize: 12,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                menu.label,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Text(
                      "Kategori Pilihan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: selectedCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        final menu = selectedCategories[index];

                        return SizedBox(
                          width: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconWithBanner(
                                icon: Icon(
                                  menu.icon,
                                  color: Colors.black,
                                ),
                                banner: menu.banner ?? "",
                                borderRadius: 5,
                                fontSize: 12,
                                paddingBanner:
                                    const EdgeInsets.symmetric(horizontal: 3),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                menu.label,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const Text(
                      "Produk Keuangan",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.95,
                      ),
                      itemBuilder: (context, index) {
                        return const SizedBox(
                          width: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.people_sharp),
                              Text("Urun"),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const BottomNavigationCustom(),
        ],
      ),
    );
  }
}
