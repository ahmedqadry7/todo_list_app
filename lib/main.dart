import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_10_flutter6_todo/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:session_10_flutter6_todo/my_theme_data.dart';
import 'package:session_10_flutter6_todo/providers/my_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) => MyProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      theme: MyTheme.lightTheme,
      locale: Locale(provider.languageCode),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FlutterSplashScreen.fadeIn(
        backgroundImage: Image(
          image: AssetImage("assets/images/splash.png"),
          alignment: Alignment.center,
        ),
        duration: Duration(seconds: 1),
        onInit: () {
          debugPrint("On Init");
        },
        onEnd: () {
          debugPrint("On End");
        },
        childWidget: SizedBox(),
        nextScreen: HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
