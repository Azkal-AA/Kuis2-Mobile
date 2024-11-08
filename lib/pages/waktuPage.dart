import 'package:flutter/material.dart';

class WaktuPage extends StatefulWidget {
  @override
  _WaktuPageState createState() => _WaktuPageState();
}

class _WaktuPageState extends State<WaktuPage> {
  final TextEditingController _waktuController = TextEditingController();

  String _selectedTimeZone = 'WIB';
  final List<String> _timeZones = ['WIB', 'WITA', 'WIT'];

  void _konversiWaktu() {
    String waktuInput = _waktuController.text;
    List<String> waktuParts = waktuInput.split(':');
    if (waktuParts.length != 2) {
      _tampilkanPopup('Format waktu tidak valid. Gunakan format HH:MM');
      return;
    }

    int jam = int.tryParse(waktuParts[0]) ?? -1;
    int menit = int.tryParse(waktuParts[1]) ?? -1;

    if (jam < 0 || jam > 23 || menit < 0 || menit > 59) {
      _tampilkanPopup('Jam atau menit tidak valid. Masukkan waktu yang benar.');
      return;
    }

    int convertedWIBJam = jam;
    int convertedWITAJam = jam;
    int convertedWITJam = jam;

    switch (_selectedTimeZone) {
      case 'WIB':
        convertedWITAJam = jam + 1;
        convertedWITJam = jam + 2;
        break;
      case 'WITA':
        convertedWIBJam = jam - 1;
        convertedWITJam = jam + 1;
        break;
      case 'WIT':
        convertedWIBJam = jam - 2;
        convertedWITAJam = jam - 1;
        break;
    }

    convertedWIBJam = _adjustTime(convertedWIBJam);
    convertedWITAJam = _adjustTime(convertedWITAJam);
    convertedWITJam = _adjustTime(convertedWITJam);

    String hasil =
        'WIB: ${_formatTime(convertedWIBJam)}:${_formatTime(menit)}\n' +
            'WITA: ${_formatTime(convertedWITAJam)}:${_formatTime(menit)}\n' +
            'WIT: ${_formatTime(convertedWITJam)}:${_formatTime(menit)}';
    _tampilkanPopup(hasil);
  }

  int _adjustTime(int jam) {
    if (jam < 0) {
      return jam + 24;
    } else if (jam > 23) {
      return jam - 24;
    }
    return jam;
  }

  void _tampilkanPopup(String hasil) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hasil Konversi Waktu'),
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

  String _formatTime(int time) {
    return time.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konversi Waktu'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 146, 199, 207),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                'Masukkan Waktu dalam Format HH:MM',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _waktuController,
                decoration: InputDecoration(
                  labelText: 'Waktu (HH:MM)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              DropdownButton<String>(
                value: _selectedTimeZone,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTimeZone = newValue!;
                  });
                },
                items: _timeZones.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _konversiWaktu,
                child: Text('Konversi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
