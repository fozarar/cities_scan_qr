import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Get.back(), icon: Icon(Icons.abc)),
      ),
      body: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Ahmet Aydın',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: clRed),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'Ara',
                          hintStyle: TextStyle(fontSize: 13),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
            const ListTile(
              iconColor: clRed,
              textColor: clRed,
              leading: Icon(Icons.newspaper),
              title: Text('Ana Ekran'),
            ),
            ListTile(
              onTap: () {},
              selected: true,
              selectedTileColor: bgColor,
              iconColor: clRed,
              textColor: clRed,
              leading: const Icon(Icons.newspaper),
              title: const Text('Profilim'),
            ),
            const ListTile(
              iconColor: clRed,
              textColor: clRed,
              leading: Icon(Icons.newspaper),
              title: Text('Davet et'),
            ),
            const ListTile(
              iconColor: clRed,
              textColor: clRed,
              leading: Icon(Icons.newspaper),
              title: Text('Şehir Listesi'),
            ),
            const ListTile(
              iconColor: clRed,
              textColor: clRed,
              leading: Icon(Icons.newspaper),
              title: Text('Ülkeler'),
            ),
            const ListTile(
              iconColor: clRed,
              textColor: clRed,
              leading: Icon(Icons.newspaper),
              title: Text('Ayarlar'),
            ),
            const ListTile(
              iconColor: clRed,
              textColor: clRed,
              leading: Icon(Icons.newspaper),
              title: Text('Çıkış'),
            ),
          ],
        ),
      ),
    );
  }
}
