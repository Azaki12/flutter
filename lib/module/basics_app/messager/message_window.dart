import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: CircleAvatar(
                child: Icon(
                  Icons.camera,
                  color: Colors.white,
                ),
              ),
              onPressed: () {}),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search bar
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                  color: Colors.grey[300],
                ),
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      'Search',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              // Stories
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: [
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Ahmed Zaki',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Ahmed Zaki',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Ahmed Zaki',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Ahmed Zaki',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Ahmed Zaki',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //       SizedBox(
              //         width: 10.0,
              //       ),
              //       Container(
              //         width: 60.0,
              //         child: Column(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               height: 6.0,
              //             ),
              //             Text(
              //               'Ahmed Zaki',
              //               maxLines: 2,
              //               overflow: TextOverflow.ellipsis,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              // list of messages
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Ahmed Zaki',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 2,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'Message, hi hi hi hi hih hih ilhkdlhih',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 7.0,
              //                           height: 7.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '2.00AM',
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Ahmed Zaki',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 2,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'Message, hi hi hi hi hih hih ilhkdlhih',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 7.0,
              //                           height: 7.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '2.00AM',
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Ahmed Zaki',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 2,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'Message, hi hi hi hi hih hih ilhkdlhih',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 7.0,
              //                           height: 7.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '2.00AM',
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Ahmed Zaki',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 2,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'Message, hi hi hi hi hih hih ilhkdlhih',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 7.0,
              //                           height: 7.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '2.00AM',
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Ahmed Zaki',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 2,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'Message, hi hi hi hi hih hih ilhkdlhih',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 7.0,
              //                           height: 7.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '2.00AM',
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Ahmed Zaki',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 2,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'Message, hi hi hi hi hih hih ilhkdlhih',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 7.0,
              //                           height: 7.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '2.00AM',
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 10.0,
              //         ),
              //         Row(
              //           children: [
              //             Stack(
              //               alignment: AlignmentDirectional.bottomEnd,
              //               children: [
              //                 CircleAvatar(
              //                   radius: 30.0,
              //                   backgroundImage: NetworkImage(
              //                       'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsetsDirectional.only(
              //                     bottom: 3.0,
              //                     end: 3.0,
              //                   ),
              //                   child: CircleAvatar(
              //                     radius: 7.0,
              //                     backgroundColor: Colors.green,
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             SizedBox(
              //               width: 20.0,
              //             ),
              //             Expanded(
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Ahmed Zaki',
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                     maxLines: 2,
              //                     overflow: TextOverflow.ellipsis,
              //                   ),
              //                   SizedBox(
              //                     height: 5.0,
              //                   ),
              //                   Row(
              //                     children: [
              //                       Expanded(
              //                         child: Text(
              //                           'Message, hi hi hi hi hih hih ilhkdlhih',
              //                           maxLines: 1,
              //                           overflow: TextOverflow.ellipsis,
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.symmetric(
              //                           horizontal: 10.0,
              //                         ),
              //                         child: Container(
              //                           width: 7.0,
              //                           height: 7.0,
              //                           decoration: BoxDecoration(
              //                             color: Colors.blue,
              //                             shape: BoxShape.circle,
              //                           ),
              //                         ),
              //                       ),
              //                       Text(
              //                         '2.00AM',
              //                       ),
              //                     ],
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  shrinkWrap: true,
                  // the context here doesnt refer to the context of the build method
                  // i.e. it only refers for the itemBuilder anonymous method
                  // the index refers to the index of the List(arrays in java)
                  itemBuilder: (context, index) => buildStoryItem(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              ListView.separated(
                // without the physics both the ListView and SingleChildScrollView scrolls so we need to tell one of them to stop scrolling so
                // we tell the ListView to stop scrolling
                physics: NeverScrollableScrollPhysics(),
                // this means that all the list needs to build as a whole before running
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10.0,
                ),
                itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // using Lists
  // 1. build item
  // 2. build list
  // 3. add item to list

  // make a method that return that item
  Widget buildChatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.green,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ahmed Zaki',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Message, hi hi hi hi hih hih ilhkdlhih',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      '2.00AM',
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );

  Widget buildStoryItem() => Container(
        width: 60.0,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/82341310?s=400&u=eccfa949f5d943b6950a01a3021cc465e7eaebc8&v=4'),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    bottom: 3.0,
                    end: 3.0,
                  ),
                  child: CircleAvatar(
                    radius: 7.0,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Ahmed Zaki',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      );
}
