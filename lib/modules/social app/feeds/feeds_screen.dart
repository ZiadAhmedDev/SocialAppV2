import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:news_app/models/new_post.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/styles/colors.dart';
import 'package:news_app/shared/styles/icon_broken.dart';
import '../../../layout/social_layout/cubit/social_cubit.dart';
import 'package:timeago/timeago.dart' as timeago;

enum _MenuItem {
  Chat,
  Save,
  Delete,
  show_Less,
}

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
                      padding: EdgeInsets.all(50.0),
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
  String Date = timeago.format(
      DateTime.fromMillisecondsSinceEpoch(int.parse(model.date!)),
      locale: CacheHelper.getData(key: 'lang'));
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
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(5)),
            elevation: 2,
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: Text('Chat'),
                value: _MenuItem.Chat,
              ),
              PopupMenuItem(child: Text('Save'), value: _MenuItem.Save),
              PopupMenuItem(child: Text('Delete'), value: _MenuItem.Delete),
              PopupMenuItem(
                  child: Text('Show Less'), value: _MenuItem.show_Less),
            ],
            onSelected: (value) {
              switch (value) {
                case _MenuItem.Chat:
                  SocialCubit.get(context).changeScreenIndex(1);
                  break;
                case _MenuItem.Delete:
                  Get.showSnackbar(GetSnackBar(
                    title: 'Hi Mr.${model.name}',
                    icon: Icon(
                      IconBroken.Delete,
                      color: Colors.orange,
                    ),
                    message: 'This post will Delete from your Feed soon..',
                    duration: Duration(seconds: 2),
                  ));
                  break;
                case _MenuItem.Save:
                  Get.showSnackbar(GetSnackBar(
                    title: 'Hi Mr.${model.name}',
                    icon: Icon(
                      IconBroken.Star,
                      color: Colors.orange,
                    ),
                    message: 'Saving.....',
                    duration: Duration(seconds: 2),
                  ));
                  break;
                case _MenuItem.show_Less:
                  Get.showSnackbar(GetSnackBar(
                    title: 'Hi Mr.${model.name}',
                    icon: Icon(
                      FontAwesomeIcons.person,
                      color: Colors.orange,
                    ),
                    message:
                        'You will not show someThing like this trash posts again',
                    duration: Duration(seconds: 4),
                  ));
                  break;
              }
            },
          ),
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
          maxLines: 3,
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
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                '${SocialCubit.get(context).socialModel!.image}',
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Write a comments....'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          // const Spacer(),
          Expanded(
            child: MaterialButton(
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
                    width: 2,
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
          ),
          Expanded(
            child: MaterialButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    IconBroken.Send,
                    color: Colors.green,
                    // size: 18,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Share'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: Colors.green),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ]),
  );
}
