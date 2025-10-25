import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practick_project/Theme/colors.dart';
import 'package:dotted_border/dotted_border.dart';

class AddRecipeFoto extends StatefulWidget {
  const AddRecipeFoto({super.key, required this.onSelectedImage});
  final Function(String path) onSelectedImage;

  @override
  State<AddRecipeFoto> createState() => _AddRecipeFotoState();
}

class _AddRecipeFotoState extends State<AddRecipeFoto> {
  File? _selectedImage;

  final borderOPtions = RectDottedBorderOptions(
    color: AppColors().grey3,
    strokeWidth: 2,
    dashPattern: [6, 4],
  );

  void _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final directory = await getApplicationDocumentsDirectory();
    final name = '${DateTime.now().millisecondsSinceEpoch}.jpg';
    final savedImage = await File(image.path).copy('${directory.path}/$name');

    setState(() {
      _selectedImage = savedImage;
    });

    widget.onSelectedImage(savedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => _pickImageFromGallery(),
        child: _selectedImage != null
            ? Image.file(_selectedImage!, fit: BoxFit.cover, height: 120)
            : DottedBorder(
                options: borderOPtions,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_a_photo_outlined,
                          size: 50,
                          color: AppColors().grey3,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Add Foto",
                          style: TextStyle(
                            color: AppColors().grey3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
