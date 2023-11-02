import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<ListResult> files;
  @override
  void initState() {
    super.initState();
    files = FirebaseStorage.instance.ref('/files').listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<ListResult>(
        future: files,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final file = snapshot.data?.items;
            return ListView.builder(
              itemCount: file!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(file[index].name),
                  trailing: IconButton(
                      onPressed: () {
                        downloadPDFFile('pragmatic flutter.pdf');
                      },
                      icon: const Icon(Icons.download)),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('error');
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

Future<void> downloadPDFFile(String fileName) async {
  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  try {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');

    await ref.writeToFile(file);

    print('PDF File downloaded to ${file.path}');
  } catch (e) {
    print('Error downloading PDF: $e');
  }
}
