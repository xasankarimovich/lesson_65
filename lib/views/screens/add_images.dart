import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../data/controller/product_controller.dart';
import '../../data/model/product_model.dart';
import '../../data/services/Firebase_storage_services.dart';

class ImagesStorage extends StatefulWidget {
  const ImagesStorage({super.key});

  @override
  State<ImagesStorage> createState() => _ImagesStorageState();
}

class _ImagesStorageState extends State<ImagesStorage> {
  File? _selectedImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final _firebaseStorageService = FirebaseStorageServices();

  Future _pickImage(ImageSource imageSource) async {
    final returnedImage = await ImagePicker().pickImage(source: imageSource);
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future<void> _uploadAndAddProduct() async {
    if (_selectedImage != null &&
        _nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty) {
      String imageUrl = await _firebaseStorageService.uploadFile(
          _nameController.text, _selectedImage!);

      final newProduct = ProductModel(
        image: imageUrl,
        name: _nameController.text,
        subTitle: 'New Item',
        icon: Icons.favorite,
        price: "\$${_priceController.text}",
        star: '⭐️(0)',
      );

      Provider.of<ProductController>(context, listen: false)
          .addProduct(newProduct);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Center(

              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 400,
                      child: _selectedImage != null
                          ? Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                      )
                          : const Text("No image selected"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(labelText: 'Product Name'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _priceController,
                        decoration: const InputDecoration(labelText: 'Product Price'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FilledButton(
                            onPressed: () => _pickImage(ImageSource.gallery),
                            child: const Text("Gallery"),
                          ),
                          FilledButton(
                            onPressed: () => _pickImage(ImageSource.camera),
                            child: const Text("Camera"),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    FilledButton(
                      onPressed: _uploadAndAddProduct,
                      child: const Text("Upload & Add Product"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
