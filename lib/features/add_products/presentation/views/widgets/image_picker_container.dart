import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_hub_dash_bord/core/helper_functions/show_snack_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImagePickerContainer extends StatefulWidget {
  const ImagePickerContainer({super.key, required this.onImageSelected});
  final ValueChanged<File?> onImageSelected;
  @override
  State<ImagePickerContainer> createState() => _ImagePickerContainerState();
}

class _ImagePickerContainerState extends State<ImagePickerContainer> {
  File? imageFile;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          await imgaePickerMethod();
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xffDDDFDF), width: 1),
              ),
              width: double.infinity,
              child: imageFile != null
                  ? Image.file(imageFile!)
                  : const Icon(Icons.image_outlined, size: 180),
            ),
            Visibility(
              visible: imageFile != null,
              child: IconButton(
                onPressed: () {
                  imageFile = null;
                  setState(() {});
                },
                icon: Icon(
                  Icons.cancel_outlined,
                  size: 35,
                  color: Colors.red.shade400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> imgaePickerMethod() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        customSnackBar(context, message: 'No image selected');
      } else {
        imageFile = File(image.path);
      }

      widget.onImageSelected(imageFile);
    } on Exception catch (e) {
      SnackBar(content: Text(e.toString()));
    }
  }
}
