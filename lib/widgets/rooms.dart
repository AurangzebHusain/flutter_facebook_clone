import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key key, @required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 60.0,
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + this.onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0), child: _CreateRoomButton());
          }
          final User user = onlineUsers[index-1];
          return Container(
              padding: const EdgeInsets.all(4.0),

            child: ProfileAvatar(imageUrl:user.imageUrl),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      textColor: Palette.facebookBlue,
        onPressed: () => {print("Create Room")},
        color: Colors.white,
        borderSide: BorderSide(width: 3.0, color: Colors.blueAccent[100]),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)
            ),
      child: Row(
        children: [
       ShaderMask(
          shaderCallback: (rect)=>
          Palette.createRoomGradient.createShader(rect),
           child: Icon(Icons.video_call,size:30,color:Colors.white)),
        const SizedBox(
            width: 50.0,
            child: Text("Create\nRoom"))
      ],),
    );
  }
}
