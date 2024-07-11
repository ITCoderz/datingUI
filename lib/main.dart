import 'package:dating/screens/onboarding/views/onboarding_screen.dart';
import 'package:dating/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'bindings/initializing_dependency.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: ScrollConfiguration.of(context).copyWith(
        overscroll: false,
      ),
      initialBinding: InitializingDependency(),
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: ThemeData(useMaterial3: false),
      home:   OnboardingTesting(),
    );
  }
}
