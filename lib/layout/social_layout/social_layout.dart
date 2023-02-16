import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_app/layout/social_layout/cubit/social_cubit.dart';
import 'package:news_app/main.dart';
import 'package:news_app/modules/locale/locale_controller.dart';
import 'package:news_app/modules/social%20app/Register/cubit/social_register_cubit.dart';
import 'package:news_app/modules/social%20app/Register/cubit/social_register_state.dart';
import 'package:news_app/modules/social%20app/new_post/new_post_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/styles/icon_broken.dart';
import '../../shared/components/constants.dart';

class SocialLayout extends StatelessWidget {
  SocialLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {
        if (state is SocialNewPost) {
          navigateTo(context, NewPostLayout());
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        MyLocaleController localControl = Get.find();
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () async {
                  if (state is SignInGoogleSuccess) {
                    await SocialRegisterCubit().signOutGoogle(context);
                  } else {
                    signOut(context);
                  }
                },
                icon: const Icon(IconBroken.Logout),
              ),
              IconButton(
                onPressed: () {
                  bool isActive = state is NotificationActiveState;
                  SocialCubit.get(context).toggleNotificationIcon(isActive);
                },
                icon: state is NotificationActiveState
                    ? Icon(
                        Icons.notifications_active_outlined,
                      )
                    : Icon(
                        Icons.notifications_none_outlined,
                      ),
              ),
              IconButton(
                onPressed: () {
                  if (Get.locale!.languageCode == 'en') {
                    localControl.changeLang('ar');
                  } else {
                    localControl.changeLang('en');
                  }
                },
                icon: const Icon(Icons.translate_outlined),
              ),
              IconButton(
                onPressed: () {
                  SocialCubit.get(context).changeThemeMode();
                },
                icon: const Icon(Icons.mode_night_outlined),
              ),
            ],
            title: Text(
              cubit.titles[cubit.currentIndex].tr,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 25),
            ),
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) => cubit.changeScreenIndex(index),
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Home), label: 'Home'.tr),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Chat), label: 'Chat'.tr),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Paper_Upload), label: 'Post'.tr),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Setting), label: 'Setting'.tr),
              ]),
        );
      },
    );
  }
}
