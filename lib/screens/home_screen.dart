import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intesasoft_case_study/models/response_model.dart';
import 'package:intesasoft_case_study/screens/city_details_screen.dart';
import 'package:intesasoft_case_study/utils/colors.dart';
import 'package:intesasoft_case_study/widgets/custom_appbar.dart';
import 'package:intesasoft_case_study/widgets/drawer.dart';
import 'package:intesasoft_case_study/widgets/scanner.dart';

import '../controllers/controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textController = TextEditingController();
  List<ResponseModel> _foundedCityList = [];
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  CitiesController c = Get.find();

  @override
  void initState() {
    c.getCitiesData();
    _foundedCityList = c.cities;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<ResponseModel> results = [];
    if (enteredKeyword.isEmpty) {
      results = c.cities;
    } else {
      results = c.cities
          .where((data) =>
              data.name!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundedCityList = results;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
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
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          child: Obx(
            () => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: textController,
                          onChanged: (value) {
                            _runFilter(value);
                          },
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: borderColor,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              hintText: c.qrVal.value.isEmpty
                                  ? 'Şehir Giriniz...'
                                  : c.qrVal.value,
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          textController.text == '';
                          Get.to(() => const ScannerWidget());
                        },
                        icon: const Icon(Icons.camera_alt_rounded),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.only(left: 16, top: 8),
                  color: Colors.red,
                  width: double.infinity,
                  height: 40,
                  child: const Text(
                    'Şehirler',
                    textAlign: TextAlign.start,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _foundedCityList.length,
                    itemBuilder: (ctx, i) {
                      return Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.white,
                              child: Image.network(
                                _foundedCityList[i].image == null
                                    ? imageUrl
                                    : _foundedCityList[i].image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(_foundedCityList[i].name!),
                            subtitle: Text('Nüfus: ' +
                                _foundedCityList[i]
                                    .populations![0]
                                    .population!),
                            trailing: IconButton(
                                onPressed: () {
                                  Get.to(() => CityDetailsScreen(),
                                      arguments: _foundedCityList[i].id);
                                  print(_foundedCityList[i].id);
                                },
                                icon: const Icon(Icons.remove_red_eye)),
                          ),
                          const Divider(
                            color: Colors.red,
                            thickness: 1,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
