import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PoseImagePickerWidget extends StatefulWidget {
  const PoseImagePickerWidget({super.key});

  @override
  State<PoseImagePickerWidget> createState() => _PoseImagePickerWidgetState();
}

class _PoseImagePickerWidgetState extends State<PoseImagePickerWidget> {
  XFile? _image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(height: 30, width: double.infinity),
        _buildPhotoArea(),
        const SizedBox(height: 20),
        _buildButton(),
      ]),
    );
  }

  Widget _buildPhotoArea() {
    return _image != null
        ? AspectRatio(
            aspectRatio: 512 / 896,
            child: Image.file(File(_image!.path)), //가져온 이미지를 화면에 띄워주는 코드
          )
        : AspectRatio(
            aspectRatio: 512 / 896,
            child: Container(
              color: Colors.grey,
              height: 100,
            ),
          );
  }

  Widget _buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.camera); //getImage 함수를 호출해서 카메라로 찍은 사진 가져오기
          },
          child: const Text("카메라"),
        ),
        const SizedBox(width: 30),
        ElevatedButton(
          onPressed: () {
            getImage(ImageSource.gallery); //getImage 함수를 호출해서 갤러리에서 사진 가져오기
          },
          child: const Text("갤러리"),
        ),
      ],
    );
  }
}
