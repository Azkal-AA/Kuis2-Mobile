import 'package:flutter/material.dart';

class HariPage extends StatefulWidget {
  @override
  _HariPageState createState() => _HariPageState();
}

class _HariPageState extends State<HariPage> {
  final TextEditingController _nomorHariController = TextEditingController();
  String _hasilHari = '';

  void _cekHari() {
    int nomor = int.tryParse(_nomorHariController.text) ?? -1;

    List<String> hari = [
      'Senin',
      'Selasa',
      'Rabu',
      'Kamis',
      'Jumat',
      'Sabtu',
      'Minggu'
    ];

    if (nomor < 1 || nomor > 7) {
      _tampilkanPopup('Masukkan nomor antara 1 dan 7.');
      return;
    }

    String hasil = 'Hari ke- $nomor adalah ${hari[nomor - 1]}';
    _tampilkanPopup(hasil);
  }

  void _tampilkanPopup(String hasil) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil Cek Hari'),
          content: Text(hasil),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Hari'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 146, 199, 207),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Masukkan Nomor Hari (1-7)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nomorHariController,
                decoration: InputDecoration(
                  labelText: 'Nomor Hari',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cekHari,
                child: Text('Cek Hari'),
              ),
              SizedBox(height: 20),
              if (_hasilHari.isNotEmpty)
                Text(
                  _hasilHari,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
