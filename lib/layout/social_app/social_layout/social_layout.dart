import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/layout/social_app/social_layout/cubit/cubit.dart';
import 'package:login/layout/social_app/social_layout/cubit/states.dart';
import 'package:login/module/social_app/new_post_screen/new_post_screen.dart';
import 'package:login/shared/component/components.dart';
import 'package:login/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(
            context,
            NewPostScreen(),
          );
        }
      },
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                  icon: Icon(
                    IconBroken.Notification,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: Icon(
                    IconBroken.Search,
                  ),
                  onPressed: () {}),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              cubit.changeBottomNav(2);
            },
            child: Icon(
              Icons.add,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      IconBroken.Home,
                    ),
                    onPressed: () {
                      cubit.changeBottomNav(0);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      IconBroken.Chat,
                    ),
                    onPressed: () {
                      SocialCubit.get(context).getUsers();
                      cubit.changeBottomNav(1);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      IconBroken.Location,
                    ),
                    onPressed: () {
                      cubit.changeBottomNav(3);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      IconBroken.Setting,
                    ),
                    onPressed: () {
                      cubit.changeBottomNav(4);
                    },
                  ),
                ],
              ),
            ),
            notchMargin: 5,
            shape: CircularNotchedRectangle(),
            color: Colors.blueGrey,
          ),
        );
      },
    );
  }
}

//ConditionalBuilder(
//             builder: (context) {
//               var model = SocialCubit.get(context).model;
//               return Column(
//                 children: [
//                   // for verification of email
//                   // if (!FirebaseAuth.instance.currentUser.emailVerified)
//                   //   Container(
//                   //     color: Colors.amber.withOpacity(.6),
//                   //     child: Padding(
//                   //       padding: const EdgeInsets.symmetric(
//                   //         horizontal: 20.0,
//                   //       ),
//                   //       child: Row(
//                   //         children: [
//                   //           Icon(
//                   //             Icons.info_outline,
//                   //           ),
//                   //           SizedBox(
//                   //             width: 15.0,
//                   //           ),
//                   //           Expanded(
//                   //             child: Text(
//                   //               'Please Verify your Email',
//                   //             ),
//                   //           ),
//                   //           SizedBox(
//                   //             width: 20.0,
//                   //           ),
//                   //           defaultTextButton(
//                   //             text: 'Send',
//                   //             function: () {
//                   //               FirebaseAuth.instance.currentUser
//                   //                   .sendEmailVerification()
//                   //                   .then((value) {
//                   //                 showToast(
//                   //                     message: 'Check Your Mail',
//                   //                     state: ToastStates.SUCCESS);
//                   //               }).catchError((onError) {});
//                   //             },
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ),
//                 ],
//               );
//             },
//             condition: SocialCubit.get(context).model != null,
//             fallback: (context) => Center(
//               child: CircularProgressIndicator(),
//             ),
//           )

//BottomNavigationBar(
//             onTap: (index) {
//               cubit.changeBottomNav(index);
//             },
//             currentIndex: cubit.currentIndex,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Home,
//                 ),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Chat,
//                 ),
//                 label: 'Chat',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Paper_Upload,
//                   size: 10,
//                 ),
//                 label: 'Post',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Location,
//                 ),
//                 label: 'Users',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(
//                   IconBroken.Setting,
//                 ),
//                 label: 'Settings',
//               ),
//             ],
//           )
