import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageFelid extends StatefulWidget {
  const ImageFelid({super.key, required this.onFileChange});
  final ValueChanged<File?> onFileChange;
  @override
  State<ImageFelid> createState() => _ImageFelidState();
}

class _ImageFelidState extends State<ImageFelid> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            await pickImage();
          } catch (e) {
            isLoading = false;
            setState(() {});
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(fileImage!),
                    )
                  : Icon(Icons.image_outlined, size: 180),
            ),

            Positioned(
              right: 0,
              child: Visibility(
                visible: fileImage != null,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      fileImage = null;
                      widget.onFileChange(fileImage);
                    });
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image?.path == null) {
      Icon(Icons.image_outlined, size: 180);
    } else {
      fileImage = File(image!.path);
      widget.onFileChange(fileImage!);
    }
  }
}
