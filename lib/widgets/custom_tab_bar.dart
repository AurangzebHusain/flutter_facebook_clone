import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/config/palette.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;
  const CustomTabBar({Key key, this.icons,this.isBottomIndicator=false, this.selectedIndex, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
        border:isBottomIndicator?Border(bottom:BorderSide(
            color: Palette.facebookBlue,
            width: 4.0
        )):Border(top:BorderSide(
          color: Palette.facebookBlue,
          width: 4.0
        ))
      ),
      tabs: icons.asMap()
          .map(
              (index,icon) => MapEntry(index,Tab(
          icon:Icon(icon,color: index==selectedIndex?Palette.facebookBlue:Colors.black,
          size: 30.0,
          ),
        ),
        )).values
    .toList(),
    onTap:onTap
    );
  }
}
