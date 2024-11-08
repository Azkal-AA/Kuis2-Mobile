import 'package:flutter/material.dart';

class PiramidaPage extends StatefulWidget {
  @override
  _PiramidaPageState createState() => _PiramidaPageState();
}

class _PiramidaPageState extends State<PiramidaPage> {
  final TextEditingController _panjangController = TextEditingController();
  final TextEditingController _lebarController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();

  double _volume = 0.0;
  double _keliling = 0.0;

  void _hitungPiramida() {
    double panjang = double.tryParse(_panjangController.text) ?? 0;
    double lebar = double.tryParse(_lebarController.text) ?? 0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0;

    if (panjang <= 0 || lebar <= 0 || tinggi <= 0) {
      _tampilkanPopup(
          'Masukkan nilai yang valid untuk panjang, lebar, dan tinggi.');
      return;
    }

    double volume = (1 / 3) * panjang * lebar * tinggi;
    double keliling = 4 * panjang;

    String hasil =
        'Volume Piramida: ${volume.toStringAsFixed(2)}\nKeliling Piramida: ${keliling.toStringAsFixed(2)}';
    _tampilkanPopup(hasil);
  }

  void _tampilkanPopup(String hasil) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil Perhitungan Piramida'),
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
        title: Text('Piramida'),
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
                'Hitung Volume dan Keliling Piramida',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _panjangController,
                decoration: InputDecoration(
                  labelText: 'Panjang Alas (m)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _lebarController,
                decoration: InputDecoration(
                  labelText: 'Lebar Alas (m)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _tinggiController,
                decoration: InputDecoration(
                  labelText: 'Tinggi Piramida (m)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _hitungPiramida,
                child: Text('Hitung'),
              ),
              SizedBox(height: 20),
              if (_volume > 0 && _keliling > 0)
                Column(
                  children: [
                    Text(
                      'Volume Piramida: ${_volume.toStringAsFixed(2)} m³',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Keliling Piramida: ${_keliling.toStringAsFixed(2)} m',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
