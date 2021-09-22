import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/social_app/social_layout/cubit/cubit.dart';
import 'package:login/layout/social_app/social_layout/cubit/states.dart';
import 'package:login/model/social_app/post_model.dart';
import 'package:login/module/social_app/comment_screen/comment_screen.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/component/constants.dart';
import 'package:login/shared/styles/colors.dart';
import 'package:login/shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      builder: (context, state) {
        var model = SocialCubit.get(context).posts;

        return ConditionalBuilder(
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(8.0),
                  elevation: 20.0,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                        width: double.infinity,
                        image: NetworkImage(
                            'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
                        fit: BoxFit.cover,
                        height: 200.0,
                      ),
                      Text(
                        'Communicate with friends',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Colors.red,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
                ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildPostItem(model[index], context, index),
                  itemCount: SocialCubit.get(context).posts.length,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          condition: SocialCubit.get(context).posts.length > 0 &&
              SocialCubit.get(context).userModel != null,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      listener: (context, state) {},
    );
  }

  Widget buildPostItem(PostModel model, context, index) => Card(
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        elevation: 20.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                      '${model.image}',
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${model.name}',
                              style: TextStyle(
                                height: 1.4,
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              Icons.check_circle,
                              color: defaultColor,
                              size: 16.0,
                            ),
                          ],
                        ),
                        Text(
                          '${model.date}',
                          style: Theme.of(context).textTheme.caption.copyWith(
                                height: 1.4,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  IconButton(
                    icon: Icon(Icons.more_horiz),
                    onPressed: () {},
                    iconSize: 16.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                '${model.text}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //     vertical: 10,
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     child: Wrap(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsetsDirectional.only(
              //             end: 6.0,
              //           ),
              //           child: Container(
              //             height: 25,
              //             child: MaterialButton(
              //               minWidth: 1,
              //               height: 20,
              //               padding: EdgeInsets.zero,
              //               onPressed: () {},
              //               child: Text(
              //                 '#anything',
              //                 style:
              //                     Theme.of(context).textTheme.caption.copyWith(
              //                           color: defaultColor,
              //                         ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              if (model.postImage != '')
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 15,
                  ),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${model.postImage}',
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                IconBroken.Heart,
                                size: 20,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${SocialCubit.get(context).likes[index]}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                IconBroken.Chat,
                                size: 20,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${SocialCubit.get(context).comment.length} comments',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 18.0,
                            backgroundImage: NetworkImage(
                              '${SocialCubit.get(context).userModel.image}',
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'Write your Comment...',
                          ),
                        ],
                      ),
                      onTap: () {
                        i = index;
                        navigateTo(context, CommentScreen());
                      },
                    ),
                  ),
                  InkWell(
                    child: Row(
                      children: [
                        Icon(
                          IconBroken.Heart,
                          size: 20,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Like',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                    onTap: () {
                      SocialCubit.get(context)
                          .likePost(SocialCubit.get(context).postId[index]);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
