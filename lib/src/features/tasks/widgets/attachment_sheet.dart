import 'package:flutter/material.dart';
import 'package:to_do_zen/src/constants/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AttachmentSheet extends StatelessWidget {
  final Function(bool) onImageSelected;
  final Function(File) onImageFile;

  const AttachmentSheet({
    super.key,
    required this.onImageSelected,
    required this.onImageFile,
  });

  void getAttachment(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      print('Image selected.');
      onImageSelected(true);
      onImageFile(File(pickedFile.path));
    } else {
      print('No image selected.');
      onImageSelected(false);
    }
  }

  void _closeAttachmentSheet(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_LIGHTGRAY,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Camera'),
            onTap: () {
              getAttachment(ImageSource.camera);
              _closeAttachmentSheet(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text('Gallery'),
            onTap: () {
              getAttachment(ImageSource.gallery);
              _closeAttachmentSheet(context);
            },
          ),
        ],
      ),
    );
  }
}
