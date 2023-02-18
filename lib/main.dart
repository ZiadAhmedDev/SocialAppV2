import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/locale/locale_controller.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';
import 'layout/social_layout/cubit/social_cubit.dart';
import 'layout/social_layout/social_layout.dart';
import 'modules/locale/locale.dart';
import 'modules/social app/login/cubit/social_login_cubit.dart';
import 'modules/social app/login/login_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark = CacheHelper.getData(key: 'isDark') ?? false;
  Widget? widget;
  uId = CacheHelper.getData(key: 'uId');
  timeago.setLocaleMessages('ar', timeago.ArMessages());
  await FirebaseMessaging.instance.subscribeToTopic('allDevices');

  FirebaseMessaging.onMessage.listen((event) {
    print(event.data);
    print('from out side');
  });
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data);
    print('open notification');
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  if (uId != null) {
    widget = SocialLayout();
  } else {
    widget = LoginScreen();
  }

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => SocialApp(
        startWidget: widget!,
        isDark: isDark,
      ), // Wrap your app
    ),
    // Wrap your app
  );
}

class SocialApp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;
  const SocialApp({super.key, required this.startWidget, required this.isDark});
  @override
  Widget build(BuildContext context) {
    MyLocaleController control = Get.put(MyLocaleController());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SocialCubit()..changeThemeMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => SocialLoginCubit(),
        ),
      ],
      child: BlocConsumer<SocialCubit, SocialState>(
        listener: (context, state) {
          if (state is ThemeChange) {
            showLoading();
            Future.delayed(Duration(milliseconds: 200)).then((value) {
              Get.offAll(() => startWidget);
            });
          }
        },
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getLightTheme,
            darkTheme: getDarkTheme,
            useInheritedMediaQuery: true,
            builder: ((context, child) {
              return responsiveFrameWork(child);
            }),
            themeMode: SocialCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            locale: control.initialLang,
            scrollBehavior: const ScrollBehaviorModified(),
            translations: MyLocale(),
            home: startWidget,
          );
        },
      ),
    );
  }
}
