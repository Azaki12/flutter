import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/social_app/social_layout/cubit/cubit.dart';
import 'package:login/layout/social_app/social_layout/cubit/states.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/styles/icon_broken.dart';

class NewPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    var now = DateTime.now();

    return BlocConsumer<SocialCubit, SocialStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              defaultTextButton(
                function: () {
                  if (SocialCubit.get(context).postImage == null) {
                    SocialCubit.get(context).createPost(
                      date: now.toString(),
                      text: textController.text,
                    );
                  } else {
                    SocialCubit.get(context).uploadPostImage(
                      date: now.toString(),
                      text: textController.text,
                    );
                  }
                  Navigator.pop(context);
                },
                text: 'Post',
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialCreatePostLoadingState)
                  LinearProgressIndicator(),
                if (state is SocialCreatePostLoadingState)
                  SizedBox(
                    height: 10,
                  ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                        '${SocialCubit.get(context).userModel.image}',
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
                                '${SocialCubit.get(context).userModel.name}',
                                style: TextStyle(
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: 'Whats on your mind...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                if (SocialCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                FileImage(SocialCubit.get(context).postImage),
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      IconButton(
                        icon: CircleAvatar(
                          radius: 20,
                          child: Icon(
                            Icons.close,
                            size: 16,
                          ),
                        ),
                        onPressed: () {
                          SocialCubit.get(context).removePostImage();
                        },
                      ),
                    ],
                  ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          SocialCubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              IconBroken.Image,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'ADD Photo',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '#TAGS',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
