import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/social_app/social_layout/cubit/cubit.dart';
import 'package:login/layout/social_app/social_layout/cubit/states.dart';
import 'package:login/model/social_app/message_model.dart';
import 'package:login/model/social_app/social_user_model.dart';
import 'package:login/shared/styles/colors.dart';
import 'package:login/shared/styles/icon_broken.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel userModel;
  var messageController = TextEditingController();

  ChatDetailsScreen({this.userModel});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        SocialCubit.get(context).getMessages(receiverId: userModel.uID);

        return BlocConsumer<SocialCubit, SocialStates>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                        '${userModel.image}',
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '${userModel.name}',
                    ),
                  ],
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          var message =
                              SocialCubit.get(context).messages[index];

                          // if the message send by the first (me) put it left

                          if (SocialCubit.get(context).userModel.uID ==
                              message.senderId) return buildMyMessage(message);

                          // else put it right

                          return buildMessage(message);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                        itemCount: SocialCubit.get(context).messages.length,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (SocialCubit.get(context).chatImage != null)
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            height: 140,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(
                                  SocialCubit.get(context).chatImage,
                                ),
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
                              SocialCubit.get(context).removeChatImage();
                            },
                          ),
                        ],
                      ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300],
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: TextFormField(
                                controller: messageController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Type your message here',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            color: defaultColor,
                            child: Row(
                              children: [
                                MaterialButton(
                                  minWidth: 1,
                                  onPressed: () {
                                    SocialCubit.get(context).getChatImage();
                                  },
                                  child: Icon(
                                    IconBroken.Image,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                MaterialButton(
                                  minWidth: 1,
                                  onPressed: () {
                                    if (SocialCubit.get(context).chatImage !=
                                        null) {
                                      SocialCubit.get(context)
                                          .uploadChatImage();
                                    }
                                    SocialCubit.get(context).sendMessage(
                                      dateTime: DateTime.now().toString(),
                                      receiverId: userModel.uID,
                                      text: messageController.text,
                                    );
                                    messageController.text = '';
                                    SocialCubit.get(context).removeChatImage();
                                  },
                                  child: Icon(
                                    IconBroken.Send,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {},
        );
      },
    );
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Text(
            '${model.text}',
          ),
        ),
      );

  Widget buildMyMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            color: defaultColor.withOpacity(.2),
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (model.chatImage != '')
                Image(
                  fit: BoxFit.cover,
                  image: NetworkImage('${model.chatImage}'),
                ),
              Text(
                '${model.text}',
              ),
            ],
          ),
        ),
      );

  Widget buildImage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            color: defaultColor.withOpacity(.2),
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10),
              topEnd: Radius.circular(10),
              topStart: Radius.circular(10),
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 15,
          ),
          child: Image(
            image: NetworkImage(
              '${model.chatImage}',
            ),
          ),
        ),
      );
}
