import 'dart:async';
import 'dart:ui';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:eliyah_express/features/auth/controllers/auth_controller.dart';
import 'package:eliyah_express/features/cart/controllers/cart_controller.dart';
import 'package:eliyah_express/features/language/controllers/language_controller.dart';
import 'package:eliyah_express/features/splash/controllers/splash_controller.dart';
import 'package:eliyah_express/common/controllers/theme_controller.dart';
import 'package:eliyah_express/features/notification/domain/models/notification_body_model.dart';
import 'package:eliyah_express/helper/address_helper.dart';
import 'package:eliyah_express/helper/auth_helper.dart';
import 'package:eliyah_express/helper/notification_helper.dart';
import 'package:eliyah_express/helper/responsive_helper.dart';
import 'package:eliyah_express/helper/route_helper.dart';
import 'package:eliyah_express/theme/dark_theme.dart';
import 'package:eliyah_express/theme/light_theme.dart';
import 'package:eliyah_express/util/app_constants.dart';
import 'package:eliyah_express/util/messages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:eliyah_express/features/home/widgets/cookies_view.dart';
import 'helper/get_di.dart' as di;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_web_plugins/url_strategy.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    usePathUrlStrategy();
  }
  /*///Pass all uncaught "fatal" errors from the framework to Crashlytics
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };


  ///Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };*/

  if(GetPlatform.isWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyAdf-U53fP8NL8HIGGTFlnQSLAydbIODpQ",
        authDomain: "eliyah-express.firebaseapp.com",
        projectId: "eliyah-express",
        storageBucket: "eliyah-express.firebasestorage.app",
        messagingSenderId: "345708509965",
        appId: "1:345708509965:web:2b17a9b781632456d20e44",
        measurementId: "G-1V2NR8B1VH"
    ));
  } else if(GetPlatform.isAndroid) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBInIU5dzO0qlYG-ogbM3Q-wzNqWddItaU",
        appId: "1:345708509965:android:89fcc07099f84332d20e44",
        messagingSenderId: "345708509965",
        projectId: "eliyah-express",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  Map<String, Map<String, String>> languages = await di.init();

  NotificationBodyModel? body;
  try {
    if (GetPlatform.isMobile) {
      final RemoteMessage? remoteMessage = await FirebaseMessaging.instance.getInitialMessage();
      if (remoteMessage != null) {
        body = NotificationHelper.convertNotification(remoteMessage.data);
      }
      await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
      FirebaseMessaging.onBackgroundMessage(myBackgroundMessageHandler);
    }
  }catch(_) {}

  if (ResponsiveHelper.isWeb()) {
    await FacebookAuth.instance.webAndDesktopInitialize(
      appId: "380903914182154",
      cookie: true,
      xfbml: true,
      version: "v15.0",
    );
  }

  runApp(MyApp(languages: languages, body: body));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  final NotificationBodyModel? body;
  const MyApp({super.key, required this.languages, required this.body});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    _route();
  }

  void _route() async {
    if(GetPlatform.isWeb) {
       Get.find<SplashController>().initSharedData();
      if(AddressHelper.getUserAddressFromSharedPref() != null && AddressHelper.getUserAddressFromSharedPref()!.zoneIds == null) {
        Get.find<AuthController>().clearSharedAddress();
      }

      if(!AuthHelper.isLoggedIn() && !AuthHelper.isGuestLoggedIn()) {
        await Get.find<AuthController>().guestLogin();
      }

      if((AuthHelper.isLoggedIn() || AuthHelper.isGuestLoggedIn()) && Get.find<SplashController>().cacheModule != null) {
        Get.find<CartController>().getCartDataOnline();
      }

      Get.find<SplashController>().getConfigData(loadLandingData: (GetPlatform.isWeb && AddressHelper.getUserAddressFromSharedPref() == null), fromMainFunction: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return GetBuilder<SplashController>(builder: (splashController) {
          return (GetPlatform.isWeb && splashController.configModel == null) ? const SizedBox() : GetMaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            navigatorKey: Get.key,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
            ),
            theme: themeController.darkTheme ? dark() : light(),
            locale: localizeController.locale,
            translations: Messages(languages: widget.languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode),
            initialRoute: GetPlatform.isWeb ? RouteHelper.getInitialRoute() : RouteHelper.getSplashRoute(widget.body),
            getPages: RouteHelper.routes,
            defaultTransition: Transition.topLevel,
            transitionDuration: const Duration(milliseconds: 500),
            builder: (BuildContext context, widget) {
              return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)), child: Material(
                child: SafeArea(
                  top: false, bottom: GetPlatform.isAndroid,
                  child: Stack(children: [
                    widget!,

                    GetBuilder<SplashController>(builder: (splashController){
                      if(!splashController.savedCookiesData && !splashController.getAcceptCookiesStatus(splashController.configModel != null ? splashController.configModel!.cookiesText! : '')){
                        return ResponsiveHelper.isWeb() ? const Align(alignment: Alignment.bottomCenter, child: CookiesView()) : const SizedBox();
                      }else{
                        return const SizedBox();
                      }
                    })
                  ]),
                ),
              ));
            },
          );
        });
      });
    });
  }
}