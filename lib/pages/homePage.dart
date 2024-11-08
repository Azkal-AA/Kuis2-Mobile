import 'package:flutter/material.dart';
import 'package:kuis2/pages/hariPage.dart';
import 'package:kuis2/pages/piramidaPage.dart';
import 'package:kuis2/pages/waktuPage.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: const Color.fromARGB(255, 146, 199, 207),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text('Piramida',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(
                'Menghitung volume dan keliling piramida',
                textAlign: TextAlign.center,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PiramidaPage()),
              ),
              hoverColor: const Color.fromARGB(255, 229, 225, 218),
            ),
            Divider(),
            ListTile(
              title: Text('Konversi Waktu',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(
                'Konversi waktu ke WIB, WITA, WIT',
                textAlign: TextAlign.center,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WaktuPage()),
              ),
              hoverColor: const Color.fromARGB(255, 229, 225, 218),
            ),
            Divider(),
            ListTile(
              title: Text('Cek Hari',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(
                'Cek hari berdasarkan nomor',
                textAlign: TextAlign.center,
              ),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HariPage()),
              ),
              hoverColor: const Color.fromARGB(255, 229, 225, 218),
            ),
          ],
        ),
      ),
    );
  }
}
