import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices {
  final _storage = FirebaseStorage.instance;

  Future<String> uploadFile(String fileName, File file) async {
    final imageReferance = _storage.ref().child('cars/images/$fileName.jpg');
    final uploadTask = imageReferance.putFile(file);
    uploadTask.snapshotEvents.listen((event) {
      print(event.state);
      int percentage =
      (event.bytesTransferred * 100 / file.lengthSync()).round();
      print("yuklandi $percentage");
    });
    String imageUrl = '';
    await uploadTask.whenComplete(() async {
      imageUrl = await imageReferance.getDownloadURL();
    });
    print(imageUrl);

    return imageUrl;
  }
}
