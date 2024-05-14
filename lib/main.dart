import 'package:impossible_flutter/app/core/core.dart';
import 'package:impossible_flutter/app/features/landing/landing_view.dart';
import 'package:impossible_flutter/app/routes/app_pages.dart';

void main() {
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
      home: const LandingPage(),
      getPages: AppPages.pages,
    );
  }
}
