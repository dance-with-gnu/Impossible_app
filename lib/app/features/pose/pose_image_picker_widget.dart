import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

class PoseImagePickerWidget extends StatefulWidget {
  const PoseImagePickerWidget({super.key});

  @override
  State<PoseImagePickerWidget> createState() => _PoseImagePickerWidgetState();
}

class _PoseImagePickerWidgetState extends State<PoseImagePickerWidget> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      // 이미지 자르기 기능 호출
      File? croppedFile = await cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        setState(() {
          _image = XFile(croppedFile.path); // 자른 이미지를 _image에 저장
        });
      }
    }
  }

  Future<File?> cropImage(File imageFile) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 512, ratioY: 896),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '이미지 자르기',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: '이미지 자르기',
          minimumAspectRatio: 1.0,
          aspectRatioLockEnabled: true,
          rotateClockwiseButtonHidden: true,
          aspectRatioPickerButtonHidden: true,
          aspectRatioLockDimensionSwapEnabled: true,
        ),
      ],
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30, width: double.infinity),
          _buildPhotoArea(),
          const SizedBox(height: 20),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildPhotoArea() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: AspectRatio(
        aspectRatio: 512 / 896,
        child: _image != null
            ? Image.file(File(_image!.path))
            : Container(
                color: Colors.grey,
              ),
      ),
    );
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.camera);
          },
          child: const Text("카메라"),
        ),
        const SizedBox(width: 30),
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.gallery);
          },
          child: const Text("갤러리"),
        ),
      ],
    );
  }
}
