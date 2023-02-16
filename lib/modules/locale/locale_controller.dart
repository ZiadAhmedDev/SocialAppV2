import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class MyLocaleController extends GetxController {
  Locale initialLang = CacheHelper.getData(key: 'lang') == null
      ? Get.deviceLocale!
      : Locale(CacheHelper.getData(key: 'lang'));
  Future<void> changeLang(String codeLang) async {
    Locale locale = Locale(codeLang);
    await CacheHelper.saveData(key: 'lang', value: codeLang);
    Get.updateLocale(locale);
  }
}
