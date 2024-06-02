import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/home/home_view.ctrl.dart';
import 'package:impossible_flutter/app/features/pose/pose_image_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

TextStyle _posetitle = const TextStyle(
  color: IMColors.blue1100,
  fontSize: 20,
  fontFamily: 'PretendardBold',
);

TextStyle _title = const TextStyle(
  color: IMColors.blue1100,
  fontSize: 17,
  fontFamily: 'PretendardBold',
);

TextStyle _button = const TextStyle(
  color: IMColors.beige200,
  fontSize: 13,
  fontFamily: 'PretendardMedium',
);

TextStyle _selectButton = const TextStyle(
  color: IMColors.blue1100,
  fontSize: 13,
  fontFamily: 'PretendardMedium',
);

const _selectedColor = IMColors.blue1000;
const _unselectedColor = IMColors.blue600;

class PoseImagePickerWidget extends StatefulWidget {
  final int poseCategory;
  final int poseId;

  const PoseImagePickerWidget(
      {super.key, required this.poseCategory, required this.poseId});

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
          resetAspectRatioEnabled: false,
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
    String title = widget.poseCategory == 0 ? "전신" : "반신";
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30.0),
        child: AppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // const SizedBox(height: 20, width: double.infinity),
          Text(
            "$title 이미지를 선택해주세요",
            style: _title,
          ),
          const SizedBox(height: 20, width: double.infinity),
          _buildPhotoArea(),
          const SizedBox(height: 20),
          _buildButton(),
          const SizedBox(height: 40, width: double.infinity),
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
            ? Stack(children: [
                Image.file(File(_image!.path)),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: IMColors.beige200,
                        maximumSize: const Size(95, 90),
                      ),
                      onPressed: () {
                        // 생성 api호출
                        _showBottomSheet(
                            context, widget.poseCategory, widget.poseId);
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: IMColors.blue1100, size: 17),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("선택", style: _selectButton),
                        ],
                      ),
                    ),
                  ),
                ),
              ])
            : Container(
                color: Colors.grey,
              ),
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: IMColors.blue1100,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              getImage(ImageSource.camera);
            },
            child: Row(
              children: [
                const Icon(Icons.camera_alt, color: IMColors.beige200),
                const SizedBox(
                  width: 7,
                ),
                Text("카메라", style: _button),
              ],
            ),
          ),
          const SizedBox(width: 30),
          GestureDetector(
            onTap: () {
              getImage(ImageSource.gallery);
            },
            child: Row(
              children: [
                const Icon(Icons.photo, color: IMColors.beige200),
                const SizedBox(
                  width: 7,
                ),
                Text("갤러리", style: _button),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showBottomSheet(BuildContext context, int poseCategory, int poseId) {
  final PoseImageController poseController = Get.put(PoseImageController());

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "영상 품질을 선택해주세요",
              style: _title,
            ),
            ToggleSwitch(
              minWidth: 90.0,
              initialLabelIndex: poseController.poseIndex.value,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 3,
              labels: const ['하', '중', '상'],
              activeBgColors: const [
                [IMColors.blue600],
                [IMColors.blue600],
                [IMColors.blue600],
              ],
              onToggle: (index) {
                poseController.updateIndex(index!);
                poseController.updateWaitTime([5, 15, 45][index]);
              },
            ),
            Obx(() => Text(
                  "예상 생성시간: ${poseController.waitTime.value}분",
                  style: _title,
                )),
            ElevatedButton(
              onPressed: () {
                // 특정 경로 이름을 가진 페이지까지 팝
                Navigator.of(context).popUntil(ModalRoute.withName('/home'));
                Get.find<HomeViewController>().changeTabIndex(2);
              },
              child: Text("생성하기", style: _selectButton),
            ),
          ],
        ),
      );
    },
  );
}
