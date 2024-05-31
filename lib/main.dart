import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Olah Gambar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? _gambar;
  final _pilihGambar = ImagePicker();
  TextEditingController lokasiGambar = new TextEditingController();

  Future<void> _bukaPilihGambar() async {
    final XFile? gambarTerpilih = await _pilihGambar.pickImage(source: ImageSource.gallery);
    if(gambarTerpilih != null) {
      setState(() {
        _gambar = File(gambarTerpilih.path);
        lokasiGambar.text = gambarTerpilih.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: [
                Text("Pilih Gambar"),
                ElevatedButton(
                  onPressed: _bukaPilihGambar,
                   child: Text("Pilih Gambar")
                  )
              ],
            ),
            TextField(
              controller: lokasiGambar,
            ),
            SizedBox(height: 35),
            Container(
              width: 150,
              child: _gambar != null
                      ? Image.file(_gambar!, fit: BoxFit.cover,)
                      : const Text("Pilih sebuah gambar"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}






// https://www.kindacode.com/article/flutter-firebase-storage/
