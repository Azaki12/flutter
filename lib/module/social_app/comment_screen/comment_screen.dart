import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/social_app/social_layout/cubit/cubit.dart';
import 'package:login/layout/social_app/social_layout/cubit/states.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/component/constants.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    var now = DateTime.now();

    return BlocConsumer<SocialCubit, SocialStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Write a Comment',
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialCommentPostsLoadingState)
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
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: textController,
                        decoration: InputDecoration(
                          labelText: 'write your comment...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        SocialCubit.get(context).commentPost(
                            SocialCubit.get(context).postId[i],
                            textController.text);
                        textController.text = '';
                        Navigator.pop(context);
                      },
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
