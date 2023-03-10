import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/layout/social_layout/cubit/social_cubit.dart';
import 'package:news_app/modules/social%20app/edit_profile/edit_profile.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/styles/icon_broken.dart';

class SettingLayout extends StatelessWidget {
  const SettingLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = SocialCubit.get(context).socialModel;
        return SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 180,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    elevation: 5.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      '${model!.cover}',
                      fit: BoxFit.cover,
                      height: 160,
                      width: double.infinity,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                      '${model.image}',
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                '${model.name}',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Text(
              '${model.bio}',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            '100',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Friends'.tr,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            '1 K',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Posts'.tr,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            '10 K',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Followers'.tr,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Column(
                        children: [
                          Text(
                            '350',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            'Followings'.tr,
                            style: TextStyle(
                                color: Colors.grey[700], fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text('Edit Profile'.tr),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: OutlinedButton(
                      onPressed: () {
                        navigateTo(context, const EditLayout());
                      },
                      child: const Icon(IconBroken.Edit),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  OutlinedButton(
                      onPressed: () {
                        FirebaseMessaging.instance.subscribeToTopic('AllUsers');
                      },
                      child: Text(
                        'Subscribe'.tr,
                        style: TextStyle(fontSize: 17),
                      )),
                  const Spacer(
                    flex: 2,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      FirebaseMessaging.instance
                          .unsubscribeFromTopic('AllUsers');
                    },
                    child: Text(
                      'UnSubscribe'.tr,
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}
