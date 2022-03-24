import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intesasoft_case_study/widgets/drawer.dart';

import '../controllers/controller.dart';
import '../utils/colors.dart';
import '../widgets/custom_appbar.dart';

class CityDetailsScreen extends StatefulWidget {
  const CityDetailsScreen({Key? key}) : super(key: key);

  @override
  State<CityDetailsScreen> createState() => _CityDetailsScreenState();
}

class _CityDetailsScreenState extends State<CityDetailsScreen> {
  CitiesController c = Get.find();
  int index = int.parse(Get.arguments) - 7;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        child: CustomAppbar(
          onPressed: () => openDrawer(),
        ),
        preferredSize: const Size.fromHeight(70),
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            c.cities[index].name!,
            style: const TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          const SizedBox(height: 10),
          Text(
            'Güncel Nüfus: ' '${c.cities[index].populations![0].population}',
            style: const TextStyle(color: Colors.black54),
          ),
          Container(
            padding: const EdgeInsets.all(32),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          c.cities[index].image == null
                              ? imageUrl
                              : c.cities[index].image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                      height: Get.height * 0.18,
                      width: Get.height * 0.2,
                    ),
                    SizedBox(height: 10),
                    Text(
                      c.cities[index].description == null
                          ? defaultText
                          : c.cities[index].description!,
                      style: const TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Haritada Görüntüle'),
                      style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          fixedSize:
                              Size(Get.height * 0.35, Get.height * 0.05)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
