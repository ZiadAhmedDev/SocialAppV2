import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:news_app/shared/styles/icon_broken.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import '../../modules/locale/locale_controller.dart';
import '../network/local/cache_helper.dart';

MyLocaleController localControl = Get.find();
// Widget buildArticleItems(article, context) => InkWell(
//       onTap: () {
//         navigateTo(context, WebViewScreen(article['url']));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(15),
//         child: Row(
//           children: [
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     article['urlToImage'] ??
//                         "https://ichef.bbci.co.uk/news/1024/branded_arabic/9F2B/production/_125674704_285f1150-b927-4cf3-8411-12d4bf11e147.jpg",
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: SizedBox(
//                 height: 100,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//                         style: ShopCubit.get(context).isDark
//                             ? const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w600,
//                               )
//                             : const TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                         overflow: TextOverflow.ellipsis,
//                         maxLines: 3,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: const TextStyle(fontSize: 18, color: Colors.grey),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );

Widget listDivider() => const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Divider(
        thickness: 1,
      ),
    );

PreferredSizeWidget? zAppBar(context, {action, required Widget title}) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          print(CacheHelper.getData(key: 'lang'));
        },
        icon: CacheHelper.getData(key: 'lang') == 'ar'
            ? Icon(IconBroken.Arrow___Right_2)
            : Icon(IconBroken.Arrow___Left_2)),
    actions: action,
    titleSpacing: 0,
    title: title,
  );
}

void showLoading({Color? loadingColor}) {
  showDialog<String>(
      barrierDismissible: false,
      context: Get.context!,
      barrierColor: Colors.black38,
      builder: (BuildContext context) => WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: Center(
                child: CircularProgressIndicator(
                  color: Get.theme.colorScheme.primary,
                ),
              ),
            ),
          ));
}

void hideLoading() => Navigator.pop(Get.context!);

// Widget articleBuilder({required list, context, isSearch = false}) =>
//     ConditionalBuilder(
//       condition: list.isNotEmpty,
//       builder: (context) {
//         return
//         ListView.separated(
//             physics: const BouncingScrollPhysics(),
//             itemBuilder: ((context, index) => buildArticleItems(
//                   list[index],
//                   context,
//                 )),
//             separatorBuilder: ((context, index) => listDivider()),
//             itemCount: 10);
//       },
//       fallback: (context) => isSearch
//           ? Container()
//           : SizedBox(
//               height: MediaQuery.of(context).size.height * .7,
//               child: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//     );
Widget defaultTextButton({
  required void Function()? function,
  required String text,
  TextStyle? style,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
        style: style,
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required void Function()? function,
  required String text,
  TextStyle? style,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: style,
        ),
      ),
    );

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        void Function(String)? onSubmit,
        void Function(String)? onChange,
        void Function()? onTap,
        bool isPassword = false,
        String? Function(String?)? validate,
        String? label,
        TextStyle? style,
        Widget? IconDataPrefix,
        bool readable = false,
        IconData? suffix,
        TextStyle? labelStyle,
        void Function()? suffixPressed,
        bool isClickable = true,
        bool isEditable = true,
        TextAlign isTextAlign = TextAlign.start,
        bool hasBorder = true,
        TextInputAction? typeAction,
        int? maxLine = 1,
        TextStyle? hintStyle,
        String? hint}) =>
    TextFormField(
      style: style,
      controller: controller,
      textInputAction: typeAction,
      textAlign: isTextAlign,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable && isEditable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      maxLines: maxLine,
      readOnly: readable,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        hintStyle: hintStyle,
        hintText: hint,
        labelText: label,
        labelStyle: labelStyle,
        prefixIcon: IconDataPrefix,
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        enabledBorder: hasBorder && isEditable
            ? const OutlineInputBorder()
            : InputBorder.none,
        focusedBorder: hasBorder && isEditable
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              )
            : InputBorder.none,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndReplacement(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    ((route) => false));

void showToaster({required String message, required ToasterState state}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: chooseToasterColor(state),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToasterState { success, warring, error }

Color? chooseToasterColor(ToasterState state) {
  Color color;
  switch (state) {
    case ToasterState.success:
      color = Colors.green;
      break;
    case ToasterState.warring:
      color = Colors.amber;
      break;
    case ToasterState.error:
      color = Colors.red;
      break;
  }
  return color;
}

Widget responsiveFrameWork(widget) => ScrollConfiguration(
      behavior: const ScrollBehaviorModified(),
      child: ResponsiveWrapper.builder(ClampingScrollWrapper(child: widget!),
          minWidth: 380,
          defaultScale: true,
          breakpoints: const [
            ResponsiveBreakpoint.autoScale(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET, scaleFactor: 1.5),
            ResponsiveBreakpoint.autoScale(1000,
                name: 'L TABLET', scaleFactor: 1.6),
            ResponsiveBreakpoint.autoScale(1500,
                name: DESKTOP, scaleFactor: 1.7),
          ],
          breakpointsLandscape: const [
            ResponsiveBreakpoint.autoScaleDown(480, name: MOBILE),
            ResponsiveBreakpoint.autoScaleDown(800,
                name: TABLET, scaleFactor: 1.5),
            ResponsiveBreakpoint.autoScaleDown(1000,
                name: 'L TABLET', scaleFactor: 1.2),
            ResponsiveBreakpoint.autoScaleDown(1500,
                name: DESKTOP, scaleFactor: 1.3),
          ]),
    );

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const ClampingScrollPhysics();
  }
}
// Widget listProductsBuilder(model, context, {bool isOldPrice = true}) {
//   return Padding(
//     padding: const EdgeInsets.all(10),
//     child: SizedBox(
//       height: 120,
//       child: Row(
//         children: [
//           Stack(alignment: Alignment.bottomLeft, children: [
//             Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: Image(
//                 image: NetworkImage(model!.image),
//                 height: 120,
//                 width: 120,
//               ),
//             ),
//             if (model!.discount != null && model!.discount != 0 && isOldPrice)
//               Container(
//                 color: Colors.red,
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Text(
//                     'Discount',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               )
//           ]),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: 30,
//                   child: Text(
//                     model!.name ?? model.description,
//                     style: const TextStyle(fontSize: 14, height: 1.9),
//                     maxLines: 2,
//                     overflow: TextOverflow.visible,
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: [
//                     Text(
//                       '${model!.price} \$',
//                       style: const TextStyle(
//                           fontSize: 17, height: 1.2, color: defaultColor),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     if (model!.discount != null &&
//                         model!.discount != 0 &&
//                         isOldPrice)
//                       Text(
//                         '${model!.oldPrice} \$',
//                         style: const TextStyle(
//                             fontSize: 15,
//                             height: 1.2,
//                             color: Color.fromARGB(255, 121, 120, 120),
//                             decoration: TextDecoration.lineThrough),
//                       ),
//                     const Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.all(3.0),
//                       child: IconButton(
//                         onPressed: () {
//                           ShopCubit.get(context)
//                               .addDeleteFavoriteData(model.id);
//                         },
//                         icon: CircleAvatar(
//                           radius: 15.0,
//                           backgroundColor:
//                               ShopCubit.get(context).favorite[model.id] ?? false
//                                   ? defaultColor
//                                   : Colors.grey,
//                           child: const Icon(
//                             Icons.favorite_border,
//                             size: 14.0,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

// Widget verifyMessage() {
//   return Column(
//     children: [
//       const SizedBox(
//         height: 20,
//       ),
//       if (!FirebaseAuth.instance.currentUser!.emailVerified)
//         Container(
//           color: Colors.yellow[400],
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.info_outline_rounded,
//                   color: Colors.red,
//                 ),
//                 const Text(
//                   '    Please Verify your fkin email, Thx',
//                   style: TextStyle(fontSize: 15),
//                 ),
//                 TextButton(
//                     onPressed: () {
//                       FirebaseAuth.instance.currentUser!
//                           .sendEmailVerification()
//                           .then((value) {
//                         showToaster(
//                             message: 'Check your fkin email',
//                             state: ToasterState.success);
//                       }).catchError((onError) {
//                         showToaster(
//                             message: 'There is a fkin Error',
//                             state: ToasterState.error);
//                       });
//                     },
//                     child: const Text(
//                       '        Verify',
//                       style: TextStyle(fontSize: 17),
//                     ))
//               ],
//             ),
//           ),
//         ),
//     ],
//   );
// }
