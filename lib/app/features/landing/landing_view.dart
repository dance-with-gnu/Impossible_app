import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/landing/landing_controller.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static String get to => '/landing';
  _getImgPath(String name) => 'assets/images/$name';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LandingController>(
        init: LandingController(),
        builder: (_) {
          return Scaffold(
            backgroundColor: IMColors.beige200,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  _getImgPath("logo_only.png"),
                  height: 250,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "LET'S DANCE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: IMColors.blue600,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // 버튼 배경 색상
                      minimumSize: const Size(double.infinity, 50), // 버튼의 크기
                    ),
                    onPressed: () {}, // 버튼 기능 구현
                    child: const Text(
                      'Continue with Apple',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700], // 버튼 배경 색상
                      minimumSize: const Size(double.infinity, 50), // 버튼의 크기
                    ),
                    onPressed: () {}, // 버튼 기능 구현
                    child: const Text(
                      '카카오로 로그인',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
