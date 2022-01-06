import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/locator.dart';
import 'package:food_delivery_app/router.dart' as router;
import 'constants/color_constants.dart';
import 'constants/dimension_constants.dart';
import 'constants/route_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();


  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: ColorConstants.colorbackground));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [
      Locale('en', 'US'),

    ],
    path: 'langs',
    // fallbackLocale: Locale('en', 'US'),
    // saveLocale: false,
    // useOnlyLangCode: true,
    // optional assetLoader default used is RootBundleAssetLoader which uses flutter's assetloader
    // assetLoader: RootBundleAssetLoader()
    // assetLoader: NetworkAssetLoader()
    // assetLoader: TestsAssetLoader()
    // assetLoader: FileAssetLoader()
    // assetLoader: StringAssetLoader()
    // preloaderColor: Colors.red,
  ));

  setupLocator();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(DimensionConstants.screenwidth,DimensionConstants.screenheight),
      builder: () {
        return MaterialApp(

          title: "app_name".tr(),
          debugShowCheckedModeBanner: false,

          localizationsDelegates: [

            EasyLocalization.of(context).delegate,
          ],
          supportedLocales: EasyLocalization.of(context).supportedLocales,
          locale: EasyLocalization.of(context).locale,
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: router.Router.generateRoute,
          initialRoute:

          RoutesConstants.login,

        );
      },

    );
  }
}

