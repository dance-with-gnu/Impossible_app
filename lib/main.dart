import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/landing/landing_view.dart';
import 'package:impossible_flutter/app/routes/app_pages.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
    debug: true, // optional: set to false to disable printing logs to console
  );

  final directory = await getApplicationDocumentsDirectory();
  print('Documents directory: ${directory.path}'); // Documents 디렉터리 경로 출력
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Let\'s Dance',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: IMColors.beige200),
        useMaterial3: true,
      ),
      // home: const LandingPage(),
      home: const LandingPage(),
      initialRoute: Routes.home,
      getPages: AppPages.pages,
    );
  }
}
