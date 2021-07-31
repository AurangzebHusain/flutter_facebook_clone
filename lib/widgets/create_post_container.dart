import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({key, @required this.currentUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop=Responsive.isDesktop(context);

    return Card(
      margin:EdgeInsets.symmetric(horizontal: isDesktop?5.0:0.0),
      elevation: isDesktop?1.0:0.0,
      shape: isDesktop? RoundedRectangleBorder(borderRadius:BorderRadius.circular(12.0)):null,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),


        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl,isActive: true),

                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration:
                        InputDecoration(hintText: 'What\'s on your mind?'),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10.0,
              thickness: 0.5,
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                      onPressed: () => {print("Live")},
                      icon: const Icon(Icons.videocam, color: Colors.red),
                      label: Text('Live')
                  ),
                  const VerticalDivider(width: 8.0,),
                  TextButton.icon(
                      onPressed: () => {print("Photo")},
                      icon: const Icon(Icons.photo_library, color: Colors.green),
                      label: Text('Live')
                  ),
                  const VerticalDivider(width: 8.0,),
                  TextButton.icon(
                      onPressed: () => {print("Room")},
                      icon: const Icon(Icons.video_call, color: Colors.purpleAccent),
                      label: Text('Room')
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
