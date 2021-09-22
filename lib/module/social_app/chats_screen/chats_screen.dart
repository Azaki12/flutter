import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/social_app/social_layout/cubit/cubit.dart';
import 'package:login/layout/social_app/social_layout/cubit/states.dart';
import 'package:login/model/social_app/social_user_model.dart';
import 'package:login/module/social_app/chat_details/chat_details_screen.dart';
import 'package:login/shared/component/components.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          builder: (context) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => buildChatItem(
                SocialCubit.get(context).users[index],
                context,
              ),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: SocialCubit.get(context).users.length,
            );
          },
          condition: SocialCubit.get(context).users.length > 0,
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildChatItem(SocialUserModel model, context) => InkWell(
        onTap: () {
          navigateTo(
              context,
              ChatDetailsScreen(
                userModel: model,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                  '${model.image}',
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                '${model.name}',
                style: TextStyle(
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      );
}
