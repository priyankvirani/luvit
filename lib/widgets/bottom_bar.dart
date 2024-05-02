import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/helper/colors.dart';
import 'package:luvit/helper/dimens.dart';
import 'package:luvit/helper/string.dart';

class BottomBar extends StatefulWidget {
  int selectedIndex;

  BottomBar({required this.selectedIndex});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(Dimens.radius_12),
        topRight: Radius.circular(Dimens.radius_12),
      ),
      child: BottomAppBar(
        color: blackColor,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.radius_12),
              topRight: Radius.circular(Dimens.radius_12),
            ),
          ),
          height: 80,
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    containerTile(
                      index: 0,
                      value: "홈",
                      image: Images.home
                    ),
                    containerTile(
                        index: 1,
                        value: "스팟",
                        image: Images.location
                    )
                  ],
                ),
              ),
              SizedBox(width: Dimens.width_70,),
              Expanded(
                child: Row(
                  children: [
                    containerTile(
                      index: 2,
                        value: "채팅",
                        image: Images.chat
                    ),
                    containerTile(
                      index: 3,
                        value: "마이",
                        image: Images.profile
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  containerTile({required int index,required String value, required String image}) {
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset(image),
          Text(
            value,
            style: TextStyle(
              fontFamily: Fonts.regular,
              fontSize: Dimens.fontSize_12,
              color: widget.selectedIndex == index ? primaryColor : accentColor
            ),
          ),
        ],
      ),
    );
  }
}
