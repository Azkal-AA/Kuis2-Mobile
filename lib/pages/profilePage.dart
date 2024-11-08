import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: const Color.fromARGB(255, 146, 199, 207),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foto Profil
              CircleAvatar(
                radius: 70,
                backgroundImage:
                    AssetImage('korsa.jpg'), // Ganti dengan foto profil
              ),
              SizedBox(height: 20),
              Divider(),
              // Nama
              Text(
                'Nama: Azkal Azkiya Akbar',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // NIM
              Text(
                'NIM: 124220085',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              // Tempat Tanggal Lahir
              Text(
                'Tempat Tanggal Lahir: Madiun, 06 November 2003',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              // Hobi
              Text(
                'Hobi: Membaca Manga, Menggambar',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
