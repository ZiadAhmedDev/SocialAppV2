import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/styles/colors.dart';
import 'package:news_app/shared/styles/icon_broken.dart';
import '../../../layout/social_layout/cubit/social_cubit.dart';
import '../../../shared/components/constants.dart';

class NewPostLayout extends StatelessWidget {
  NewPostLayout({super.key});
  var textControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = SocialCubit.get(context).socialModel;
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: zAppBar(context,
              action: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: defaultTextButton(
                      function: () {
                        // FirebaseFirestore.instance.
                        now = DateTime.now().millisecondsSinceEpoch;
                        if (SocialCubit.get(context).postImage == null) {
                          SocialCubit.get(context).createNewPost(
                              date: now.toString(), text: textControl.text);
                        } else {
                          SocialCubit.get(context).uploadPostImage(
                            date: now.toString(),
                            text: textControl.text,
                          );
                        }
                      },
                      text: 'Post'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: defaultColor)),
                )
              ],
              title: Text('New Post'.tr)),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .88,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (state is SocialCreateNewPostLoadingState)
                    const LinearProgressIndicator(),
                  if (state is SocialCreateNewPostLoadingState)
                    const SizedBox(
                      height: 20,
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            '${SocialCubit.get(context).socialModel!.image}',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          '${model!.name}   ',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: defaultFormField(
                            controller: textControl,
                            type: TextInputType.multiline,
                            hasBorder: false,
                            maxLine: 10,
                            isTextAlign: TextAlign.center,
                            typeAction: TextInputAction.newline,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width * .06,
                                fontFamily: 'Jannah',
                                height: 1.5,
                                letterSpacing: 1.3),
                            hint: 'What is going into your mind.....'.tr),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (state is SocialUploadPostImageSuccessState)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Card(
                            elevation: 5.0,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Image.file(
                              File(SocialCubit.get(context).postImage!.path),
                              fit: BoxFit.cover,
                              height: 160,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: defaultColor,
                              child: IconButton(
                                onPressed: () {
                                  SocialCubit.get(context).removePostImage();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  size: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(
                                IconBroken.Camera,
                                color: defaultColor,
                              ),
                              TextButton(
                                onPressed: () {
                                  SocialCubit.get(context).getPostImage();
                                },
                                child: Text(
                                  'Add Photo'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: defaultColor),
                                ),
                              ),
                              const Spacer(),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    '#tags'.tr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(color: defaultColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
