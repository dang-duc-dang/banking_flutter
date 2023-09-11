import 'package:food_flutter/data/database_local/app_prefs.dart';
import 'package:food_flutter/lang/translation_service.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPrefs().initialize();

  runApp(const MyApp());

  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.wave
    ..loadingStyle = EasyLoadingStyle.custom
    ..textColor = Style.white
    ..userInteractions = false
    ..backgroundColor = Style.primary100
    ..radius = 10.0
    ..indicatorColor = Style.white
    ..dismissOnTap = true;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.fade,
      builder: EasyLoading.init(),
      smartManagement: SmartManagement.keepFactory,
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'AI Chat',
    );
  }
}
