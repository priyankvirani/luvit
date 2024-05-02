import 'package:another_transformer_page_view/another_transformer_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/helper/colors.dart';
import 'package:luvit/helper/dimens.dart';
import 'package:luvit/helper/string.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'widgets/bottom_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class ImageData {
  String title;
  String image;

  ImageData(this.title, this.image);
}

class Data {
  String image;
  String title;
  String subTile;
  String age;
  String location;
  String likeCount;
  List<ImageData> imageData;

  Data(this.image, this.title, this.subTile, this.age, this.location,
      this.likeCount, this.imageData);
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  int selectedItem = -1;

  List<Data> list = [
    Data(Images.image1, "잭과분홍콩나물", "서울", "25", "2km 거리에 있음", "29,930", []),
    Data(
        Images.image2,
        "잭과분홍콩나물",
        "서로 아껴주고 힘이 되어줄 사람 찾아요 선릉으로 직장 다니고 있고 여행 좋아해요 이상한 이야기하시는 분 바로 차단입니다",
        "25",
        "",
        "29,930", []),
    Data(Images.image3, "잭과분홍콩나물", "", "25", "", "29,930", [
      ImageData("진지한 연애를 찾는 중", Images.heart),
      ImageData("전혀 안 함", Images.glass),
      ImageData("비흡연", Images.cigar),
      ImageData("매일 1시간 이상", Images.punch),
      ImageData("만나는 걸 좋아함", Images.shake),
      ImageData("INFP", ""),
    ]),
  ];

  int currentIndex = 0;

  late final pageController = PageController(
    initialPage: 0,
    viewportFraction: 0.9,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: Dimens.padding_20,
                  bottom: Dimens.padding_20,
                  left: Dimens.padding_20,
                  right: Dimens.padding_10),
              child: Row(
                children: [
                  SvgPicture.asset(Images.marker),
                  SizedBox(
                    width: Dimens.width_10,
                  ),
                  Text(
                    "목이길어슬픈기린님의 새로운 스팟",
                    style: TextStyle(
                        color: textColor, fontSize: Dimens.fontSize_10),
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimens.padding_12,
                        vertical: Dimens.padding_7),
                    decoration: BoxDecoration(
                      color: blackColor,
                      borderRadius:
                          BorderRadius.circular(Dimens.circularRadius_50),
                      border: Border.all(
                        color: gradientColor,
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(Images.starCheck),
                        SizedBox(
                          width: Dimens.width_10,
                        ),
                        Text(
                          "323,233",
                          style: TextStyle(
                              color: textColor,
                              fontSize: Dimens.fontSize_12,
                              fontFamily: Fonts.medium),
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset(Images.notification)
                ],
              ),
            ),
            Expanded(
              child: list.isEmpty
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "추천 드릴 친구들을 준비 중이에요",
                          style: TextStyle(
                            color: textColor,
                            fontSize: Dimens.fontSize_24,
                            fontFamily: Fonts.semiBold,
                          ),
                        ),
                        SizedBox(height: Dimens.height_10,),
                        Text(
                          "매일 새로운 친구들을 소개시켜드려요",
                          style: TextStyle(
                            color: text1Color,
                            fontSize: Dimens.fontSize_16,
                            fontFamily: Fonts.regular,
                          ),
                        )
                      ],
                    )
                  : GestureDetector(
                      onTap: () {
                        print("tap : ");
                      },
                      onVerticalDragEnd: (details) {
                        if (details.primaryVelocity! > 0) {
                          // Swiped from top to bottom
                          print("pageController. : $currentIndex");
                          setState(() {
                            if(list.length == 1){
                              list.clear();
                            }else{
                              list.removeAt(currentIndex);
                            }
                          });
                        }
                      },
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: pageController,
                            onPageChanged: (val) {
                              setState(() {
                                currentIndex = val;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimens.padding_5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimens.radius_20),
                                      border: Border.all(color: gradientColor)),
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            Dimens.radius_20),
                                        child: Image.asset(
                                          list[index].image,
                                          width: double.infinity,
                                          height: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimens.radius_20),
                                          gradient: LinearGradient(
                                            end: const Alignment(0.0, -1),
                                            begin: const Alignment(0.0, 0.6),
                                            colors: <Color>[
                                              blackColor.withOpacity(.8),
                                              blackColor.withOpacity(.7),
                                              blackColor.withOpacity(.5),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.all(Dimens.padding_20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: Dimens.padding_12,
                                                  vertical: Dimens.padding_7),
                                              decoration: BoxDecoration(
                                                color: blackColor,
                                                borderRadius:
                                                    BorderRadius.circular(Dimens
                                                        .circularRadius_50),
                                                border: Border.all(
                                                  color: gradientColor,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SvgPicture.asset(
                                                      Images.starUn),
                                                  SizedBox(
                                                    width: Dimens.width_10,
                                                  ),
                                                  Text(
                                                    list[index].likeCount,
                                                    style: TextStyle(
                                                        color: textColor,
                                                        fontSize:
                                                            Dimens.fontSize_12,
                                                        fontFamily:
                                                            Fonts.medium),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: Dimens.height_5,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Text(
                                                            list[index].title,
                                                            style: TextStyle(
                                                              color: textColor,
                                                              fontFamily:
                                                                  Fonts.bold,
                                                              fontSize: Dimens
                                                                  .fontSize_26,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                Dimens.width_10,
                                                          ),
                                                          Text(
                                                            list[index].age,
                                                            style: TextStyle(
                                                              color: textColor,
                                                              fontFamily:
                                                                  Fonts.regular,
                                                              fontSize: Dimens
                                                                  .fontSize_22,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: Dimens.height_5,
                                                      ),
                                                      if (list[index]
                                                          .location
                                                          .isEmpty)
                                                        list[index]
                                                                .subTile
                                                                .isEmpty
                                                            ? const SizedBox()
                                                            : Text(
                                                                list[index]
                                                                    .subTile,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      subTitleColor,
                                                                  fontFamily: Fonts
                                                                      .regular,
                                                                  fontSize: Dimens
                                                                      .fontSize_15,
                                                                ),
                                                              )
                                                      else
                                                        Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              "${list[index].subTile} • ",
                                                              style: TextStyle(
                                                                color:
                                                                    subTitleColor,
                                                                fontFamily: Fonts
                                                                    .regular,
                                                                fontSize: Dimens
                                                                    .fontSize_15,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                list[index]
                                                                    .location,
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      subTitleColor,
                                                                  fontFamily: Fonts
                                                                      .regular,
                                                                  fontSize: Dimens
                                                                      .fontSize_15,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      if (list[index]
                                                          .imageData
                                                          .isNotEmpty)
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              top: Dimens
                                                                  .padding_10),
                                                          child: Wrap(
                                                            direction:
                                                                Axis.horizontal,
                                                            spacing:
                                                                Dimens.width_5,
                                                            runSpacing:
                                                                Dimens.height_5,
                                                            alignment:
                                                                WrapAlignment
                                                                    .start,
                                                            children:
                                                                list[index]
                                                                    .imageData
                                                                    .map(
                                                                        (data) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  int val = list[
                                                                          index]
                                                                      .imageData
                                                                      .indexOf(
                                                                          data);
                                                                  setState(() {
                                                                    selectedItem =
                                                                        val;
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  padding: EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          Dimens
                                                                              .padding_15,
                                                                      vertical:
                                                                          Dimens
                                                                              .padding_10),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: list[index].imageData.indexOf(data) ==
                                                                            selectedItem
                                                                        ? primaryColor
                                                                            .withOpacity(0.2)
                                                                        : darkBlackColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            Dimens.circularRadius_50),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color:
                                                                          gradientColor,
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      if (data
                                                                          .image
                                                                          .isNotEmpty)
                                                                        Image
                                                                            .asset(
                                                                          data.image,
                                                                          height:
                                                                              Dimens.height_15,
                                                                        ),
                                                                      SizedBox(
                                                                        width: data.image.isNotEmpty
                                                                            ? Dimens.width_10
                                                                            : 0,
                                                                      ),
                                                                      Text(
                                                                        data.title,
                                                                        style: TextStyle(
                                                                            color: list[index].imageData.indexOf(data) == selectedItem
                                                                                ? primaryColor
                                                                                : textColor,
                                                                            fontSize:
                                                                                Dimens.fontSize_12,
                                                                            fontFamily: Fonts.medium),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimens.width_20,
                                                ),
                                                SvgPicture.asset(Images.like)
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimens.height_10,
                                            ),
                                            const Center(
                                              child: Icon(
                                                Icons
                                                    .keyboard_arrow_down_outlined,
                                                color: textColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: list.length,
                          ),
                          if (list.isNotEmpty)
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(top: Dimens.padding_20),
                                child: SmoothPageIndicator(
                                  controller: pageController,
                                  count: list.length,
                                  effect: const WormEffect(
                                      dotHeight: 3,
                                      dotWidth: 50,
                                      type: WormType.thinUnderground,
                                      dotColor: dotColor,
                                      activeDotColor: primaryColor),
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
            ),
            SizedBox(
              height: Dimens.height_30,
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            child: Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(Dimens.padding_18),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  begin: Alignment(0.7, -0.5),
                  end: Alignment(0.6, 0.5),
                  colors: [
                    Color(0xFF101010),
                    Color(0xFF2F2F2F),
                  ],
                ),
                  boxShadow: const [BoxShadow(
                    color: gradientColor,
                    blurRadius: 5.0,
                  ),]
              ),
              child: SvgPicture.asset(Images.star),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: Dimens.padding_1),
        decoration: BoxDecoration(
            color: gradientColor,
            borderRadius: BorderRadius.circular(Dimens.radius_10)),
        child: BottomBar(
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}

class DepthPageTransformer extends PageTransformer {
  DepthPageTransformer() : super(reverse: true);

  @override
  Widget transform(Widget child, TransformInfo info) {
    final position = info.position!;
    if (position <= 0) {
      return Opacity(
        opacity: 1.0,
        child: Transform.translate(
          offset: Offset.zero,
          child: Transform.scale(
            scale: 1.0,
            child: child,
          ),
        ),
      );
    } else if (position <= 1) {
      const minScale = 0.75;
      // Scale the page down (between minScale and 1)
      final scaleFactor = minScale + (1 - minScale) * (1 - position);

      return Opacity(
        opacity: 1.0 - position,
        child: Transform.translate(
          offset: Offset(info.width! * -position, 0.0),
          child: Transform.scale(
            scale: scaleFactor,
            child: child,
          ),
        ),
      );
    }

    return child;
  }
}
