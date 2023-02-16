import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:news_app/models/new_post.dart';
import 'package:news_app/shared/components/constants.dart';
import 'package:news_app/shared/styles/colors.dart';
import 'package:news_app/shared/styles/icon_broken.dart';
import '../../../layout/social_layout/cubit/social_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../locale/locale_controller.dart';

class FeedsLayout extends StatelessWidget {
  FeedsLayout({super.key});

  bool first = true;
  @override
  Widget build(BuildContext context) {
    SocialCubit blocController = SocialCubit.get(context);
    return BlocBuilder(
      bloc: blocController,
      buildWhen: (previous, current) => (current is SocialSuccessGetNewPosts),
      builder: (context, state) {
        if (first) {
          blocController.getNewPosts();
          blocController.getUserData();
          first = false;
        }
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Card(
              //   elevation: 5.0,
              //   clipBehavior: Clip.antiAliasWithSaveLayer,
              //   child: Stack(alignment: Alignment.centerLeft, children: [
              //     Image.network(
              //       'https://img.freepik.com/free-photo/handsome-enthusiastic-smiling-man-with-bristle-grey-sweater-holding-smartphone-screen-facing-camera-pointing-mobile-display-grinning-recommend-application-carsharing-shopping-site_176420-51790.jpg?w=1380&t=st=1674640890~exp=1674641490~hmac=87c0fbdfb8e1e7935ba000fd0e7f965d2fd52e126014db1b5127dee1e138e05e',
              //       fit: BoxFit.cover,
              //       height: 190,
              //       width: double.infinity,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(10.0),
              //       child: SizedBox(
              //         width: 120,
              //         height: 180,
              //         child: Text('''Communicate
              //            with
              //            friends''',
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .bodyLarge!
              //                 .copyWith(color: Colors.black, fontSize: 17),
              //             textAlign: TextAlign.center),
              //       ),
              //     ),
              //   ]),
              // ),
              ConditionalBuilder(
                condition: SocialCubit.get(context).postList.isNotEmpty &&
                    SocialCubit.get(context).postId.isNotEmpty &&
                    SocialCubit.get(context).socialModel != null &&
                    SocialCubit.get(context).likes.isNotEmpty,
                builder: (context) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => newPost(context,
                        SocialCubit.get(context).postList[index], index),
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 20,
                        ),
                    itemCount: SocialCubit.get(context).postList.length),
                fallback: (context) => Center(
                  child: const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

Widget newPost(context, NewPostModel model, index) {
  // final currentTime = new DateTime.now();
  String Date = timeago
      .format(DateTime.fromMillisecondsSinceEpoch(int.parse(model.date!)));
  return Card(
    margin: const EdgeInsets.all(10),
    elevation: 5,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                '${model.image}',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${model.name}  ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(height: 1.2),
                    ),
                    const Icon(
                      Icons.check_circle,
                      size: 20,
                      color: Colors.blue,
                    )
                  ],
                ),
                Text(
                  '${Date}',
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
          ),
          const Spacer(),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Container(
                    height: 120,
                    child: Column(
                      children: [
                        Text('Delete'),
                      ],
                    ),
                  ),
                ),
              ];
            },
            onSelected: (value) {
              // Handle the selected value here
              if (value == 'delete') {
                // Delete the post
              }
            },
            child: IconButton(
                onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 7,
        ),
        child: Divider(
          thickness: .9,
          color: Colors.grey[400],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          '${model.text}',
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                height: 1.3,
              ),
        ),
      ),
      if (model.postImage != '')
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 160,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: NetworkImage(
                    '${model.postImage}',
                  ),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      Row(
        children: [
          MaterialButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            child: Row(
              children: [
                const Icon(
                  IconBroken.Heart,
                  color: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '${SocialCubit.get(context).likes[index]}',
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          MaterialButton(
            onPressed: () {},
            padding: const EdgeInsets.all(0),
            child: Row(
              children: const [
                Icon(
                  IconBroken.Chat,
                  color: defaultColor,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    '12',
                    // '${SocialCubit.get(context).comments[index]}',
                    style: TextStyle(color: defaultColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      Divider(
        thickness: .9,
        indent: 15,
        endIndent: 15,
        color: Colors.grey[400],
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                '${SocialCubit.get(context).socialModel!.image}',
              ),
            ),
          ),
          const SizedBox(
            width: 4,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Write a comments....'.tr,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ),
          const Spacer(),
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {
              SocialCubit.get(context)
                  .addLikes(SocialCubit.get(context).postId[index]);
            },
            child: Row(
              children: [
                const Icon(
                  IconBroken.Heart,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Like'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.red),
                ),
              ],
            ),
          ),
          MaterialButton(
            padding: const EdgeInsets.all(0),
            onPressed: () {},
            child: Row(
              children: [
                const Icon(
                  IconBroken.Send,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Share'.tr,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.green),
                ),
              ],
            ),
          )
        ],
      ),
    ]),
  );
}
