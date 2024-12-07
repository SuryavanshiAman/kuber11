import 'package:flutter/material.dart';
import 'package:kuber11/generated/assets.dart';
import 'package:kuber11/res/color_const.dart';
import 'package:kuber11/res/sizes_const.dart';
import 'package:kuber11/view/const_widget/container_const.dart';
import 'package:kuber11/view/const_widget/text_const.dart';

class ScorecardPage extends StatefulWidget {
  const ScorecardPage({super.key});

  @override
  State<ScorecardPage> createState() => _ScorecardPageState();
}

class _ScorecardPageState extends State<ScorecardPage> {
  int? selectedIndex;
  int selectedHighlight = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        Row(
          children: [
            ContainerConst(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => MatchDetailsScreen()));
              },
              padding: const EdgeInsets.only(
                  right: 10, left: 10, top: 10, bottom: 18),
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: AppColor.scaffoldBackgroundColor)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Sizes.spaceWidth15,
                  TextConst(
                    text: "Highlight T1",
                    fontWeight: FontWeight.w600,
                    textColor: AppColor.textGreyColor,
                    fontSize: Sizes.fontSizeThree,
                  ),
                  Sizes.spaceWidth25,
                  Container(
                    height: Sizes.screenHeight * 0.06,
                    width: Sizes.screenWidth * 0.57,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: 12,
                      itemBuilder: (_, int i) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedHighlight = i;
                              });
                            },
                            child: ContainerConst(
                              height: 40,
                              width: Sizes.screenWidth * 0.2,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: selectedHighlight == i
                                    ? AppColor.activeButtonGreenColor
                                    : AppColor.textGreyColor,
                              ),
                              color: selectedHighlight == i
                                  ? AppColor.activeButtonGreenColor
                                      .withOpacity(0.05)
                                  : Colors.transparent,
                              child: Column(
                                children: [
                                  TextConst(
                                    text: "T1",
                                    fontWeight: FontWeight.w600,
                                    textColor: selectedHighlight == i
                                        ? AppColor.activeButtonGreenColor
                                        : AppColor.textGreyColor,
                                    fontSize: Sizes.fontSizeTwo,
                                  ),
                                  TextConst(
                                    text: "319 Pts",
                                    textColor: selectedHighlight == i
                                        ? AppColor.activeButtonGreenColor
                                        : AppColor.textGreyColor,
                                    fontSize: Sizes.fontSizeOne,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        ContainerConst(
          border: Border.all(
            color: Colors.orange.withOpacity(0.3),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent, // Remove the default border
            ),
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Sizes.spaceWidth5,
                  TextConst(
                    width: 180,
                    alignment: Alignment.centerLeft,
                    text: "ina".toUpperCase(),
                    fontWeight: FontWeight.w700,
                    textColor: AppColor.blackColor,
                    fontSize: Sizes.fontSizeThree,
                  ),
                  TextConst(
                    text: "(19.2)".toUpperCase(),
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.textGreyColor,
                  ),
                  TextConst(
                    text: "95/10".toUpperCase(),
                    width: 60,
                    textColor: AppColor.blackColor,
                    fontSize: Sizes.fontSizeThree,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              tilePadding: EdgeInsets.zero,
              collapsedBackgroundColor: Colors.orange.withOpacity(0.1),
              backgroundColor: Colors.white,
              children: [
                ContainerConst(
                  height: Sizes.screenHeight * 0.055,
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: AppColor.textGreyColor.withOpacity(0.1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Sizes.spaceWidth5,
                      TextConst(
                        width: 170,
                        alignment: Alignment.centerLeft,
                        text: "Batter",
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.textGreyColor,
                        fontSize: Sizes.fontSizeTwo,
                      ),
                      TextConst(
                        width: 20,
                        text: "r".toUpperCase(),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGreyColor,
                      ),
                      TextConst(
                        width: 20,
                        text: "b".toUpperCase(),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGreyColor,
                      ),
                      TextConst(
                        width: 20,
                        text: "4s".toUpperCase(),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGreyColor,
                      ),
                      TextConst(
                        width: 20,
                        text: "6s".toUpperCase(),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGreyColor,
                      ),
                      TextConst(
                        text: "s/r".toUpperCase(),
                        width: 50,
                        textColor: AppColor.textGreyColor,
                        fontSize: Sizes.fontSizeTwo,
                        fontWeight: FontWeight.w500,
                      ),
                      Sizes.spaceWidth5,
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (_, int i) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 1.5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                        child: ContainerConst(
                          color: selectedIndex == i
                              ? AppColor.scaffoldBackgroundColorTwo
                              : Colors.transparent,
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 7, bottom: 7),
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: AppColor.scaffoldBackgroundColor,
                            ),
                          ),
                          child: const Row(
                            children: [
                              ContainerConst(
                                height: 35,
                                width: 35,
                                image: DecorationImage(
                                    image: AssetImage(Assets.playersImgPlayer5),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter),
                              ),
                              Sizes.spaceWidth15,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextConst(
                                    text: "Sachin Sharma",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextConst(
                                    text: "not out",
                                    textColor: AppColor.textGreyColor,
                                  ),
                                ],
                              ),
                              Sizes.spaceWidth25,
                              TextConst(
                                text: "18",
                                width: 20,
                                textColor: AppColor.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                              TextConst(
                                text: "19",
                                width: 30,
                                textColor: AppColor.blackColor,
                              ),
                              TextConst(
                                text: "19",
                                width: 30,
                                textColor: AppColor.blackColor,
                              ),
                              TextConst(
                                text: "19",
                                width: 30,
                                textColor: AppColor.blackColor,
                              ),
                              TextConst(
                                text: "94.97",
                                width: 50,
                                textColor: AppColor.blackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ContainerConst(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 7),
                  alignment: Alignment.center,
                  height: Sizes.screenHeight * 0.09,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColor.textGreyColor.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          TextConst(
                            width: 170,
                            alignment: Alignment.centerLeft,
                            text: "extras".toUpperCase(),
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.blackColor,
                            fontSize: Sizes.fontSizeTwo,
                          ),
                          ContainerConst(
                            width: Sizes.screenWidth * 0.5,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (_, int index) {
                                return Row(
                                  children: [
                                    TextConst(
                                      text: "(nb 0,",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "wd 5,",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "b 0",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "Ib 0,",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "pen 0)",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      TextConst(
                        width: 110,
                        alignment: Alignment.centerLeft,
                        text: "5",
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.blackColor,
                        fontSize: Sizes.fontSizeTwo,
                      ),
                    ],
                  ),
                ),
                ContainerConst(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 7),
                  alignment: Alignment.center,
                  height: Sizes.screenHeight * 0.09,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColor.textGreyColor.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          TextConst(
                            width: 170,
                            alignment: Alignment.centerLeft,
                            text: "total".toUpperCase(),
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.blackColor,
                            fontSize: Sizes.fontSizeTwo,
                          ),
                          ContainerConst(
                            width: Sizes.screenWidth * 0.5,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (_, int index) {
                                return Row(
                                  children: [
                                    TextConst(
                                      text: "(2 wickets, ",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "12 overs)",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      TextConst(
                        width: 110,
                        alignment: Alignment.centerLeft,
                        text: "75",
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.blackColor,
                        fontSize: Sizes.fontSizeTwo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ContainerConst(
          border: Border.all(
            color: AppColor.textGreyColor.withOpacity(0.1),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent, // Remove the default border
            ),
            child: ExpansionTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Sizes.spaceWidth5,
                  TextConst(
                    width: 180,
                    alignment: Alignment.centerLeft,
                    text: "ina".toUpperCase(),
                    fontWeight: FontWeight.w700,
                    textColor: AppColor.blackColor,
                    fontSize: Sizes.fontSizeThree,
                  ),
                  TextConst(
                    text: "(19.2)".toUpperCase(),
                    fontWeight: FontWeight.w500,
                    textColor: AppColor.textGreyColor,
                  ),
                  TextConst(
                    text: "95/10".toUpperCase(),
                    width: 60,
                    textColor: AppColor.blackColor,
                    fontSize: Sizes.fontSizeThree,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
              tilePadding: EdgeInsets.zero,
              collapsedBackgroundColor: AppColor.textGreyColor.withOpacity(0.1),
              backgroundColor: Colors.white,
              children: [
                ContainerConst(
                  height: Sizes.screenHeight * 0.055,
                  border: Border(
                      bottom: BorderSide(
                          width: 1,
                          color: AppColor.textGreyColor.withOpacity(0.1))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Sizes.spaceWidth5,
                      TextConst(
                        width: 170,
                        alignment: Alignment.centerLeft,
                        text: "Batter",
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.textGreyColor,
                        fontSize: Sizes.fontSizeTwo,
                      ),
                      TextConst(
                        width: 20,
                        text: "r".toUpperCase(),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGreyColor,
                      ),
                      TextConst(
                        width: 20,
                        text: "b".toUpperCase(),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGreyColor,
                      ),
                      TextConst(
                        width: 20,
                        text: "4s".toUpperCase(),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGreyColor,
                      ),
                      TextConst(
                        width: 20,
                        text: "6s".toUpperCase(),
                        fontWeight: FontWeight.w500,
                        textColor: AppColor.textGreyColor,
                      ),
                      TextConst(
                        text: "s/r".toUpperCase(),
                        width: 50,
                        textColor: AppColor.textGreyColor,
                        fontSize: Sizes.fontSizeTwo,
                        fontWeight: FontWeight.w500,
                      ),
                      Sizes.spaceWidth5,
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (_, int i) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 1.5),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = i;
                          });
                        },
                        child: ContainerConst(
                          color: selectedIndex == i
                              ? AppColor.scaffoldBackgroundColorTwo
                              : Colors.transparent,
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 7, bottom: 7),
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: AppColor.scaffoldBackgroundColor,
                            ),
                          ),
                          child: const Row(
                            children: [
                              ContainerConst(
                                height: 35,
                                width: 35,
                                image: DecorationImage(
                                    image: AssetImage(Assets.playersImgPlayer5),
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter),
                              ),
                              Sizes.spaceWidth15,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextConst(
                                    text: "Sachin Sharma",
                                    fontWeight: FontWeight.w500,
                                  ),
                                  TextConst(
                                    text: "not out",
                                    textColor: AppColor.textGreyColor,
                                  ),
                                ],
                              ),
                              Sizes.spaceWidth25,
                              TextConst(
                                text: "18",
                                width: 20,
                                textColor: AppColor.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                              TextConst(
                                text: "19",
                                width: 30,
                                textColor: AppColor.blackColor,
                              ),
                              TextConst(
                                text: "19",
                                width: 30,
                                textColor: AppColor.blackColor,
                              ),
                              TextConst(
                                text: "19",
                                width: 30,
                                textColor: AppColor.blackColor,
                              ),
                              TextConst(
                                text: "94.97",
                                width: 50,
                                textColor: AppColor.blackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ContainerConst(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 7),
                  alignment: Alignment.center,
                  height: Sizes.screenHeight * 0.09,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColor.textGreyColor.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          TextConst(
                            width: 170,
                            alignment: Alignment.centerLeft,
                            text: "extras".toUpperCase(),
                            fontWeight: FontWeight.w500,
                            textColor: AppColor.blackColor,
                            fontSize: Sizes.fontSizeTwo,
                          ),
                          ContainerConst(
                            width: Sizes.screenWidth * 0.5,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (_, int index) {
                                return Row(
                                  children: [
                                    TextConst(
                                      text: "(nb 0,",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "wd 5,",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "b 0",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "Ib 0,",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "pen 0)",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      TextConst(
                        width: 110,
                        alignment: Alignment.centerLeft,
                        text: "5",
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.blackColor,
                        fontSize: Sizes.fontSizeTwo,
                      ),
                    ],
                  ),
                ),
                ContainerConst(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 7),
                  alignment: Alignment.center,
                  height: Sizes.screenHeight * 0.09,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: AppColor.textGreyColor.withOpacity(0.1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          TextConst(
                            width: 170,
                            alignment: Alignment.centerLeft,
                            text: "total".toUpperCase(),
                            fontWeight: FontWeight.w700,
                            textColor: AppColor.blackColor,
                            fontSize: Sizes.fontSizeTwo,
                          ),
                          ContainerConst(
                            width: Sizes.screenWidth * 0.5,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (_, int index) {
                                return Row(
                                  children: [
                                    TextConst(
                                      text: "(2 wickets, ",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                    TextConst(
                                      text: "12 overs)",
                                      textColor: AppColor.textGreyColor,
                                      fontSize: Sizes.fontSizeTwo,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      TextConst(
                        width: 110,
                        alignment: Alignment.centerLeft,
                        text: "75",
                        fontWeight: FontWeight.w700,
                        textColor: AppColor.blackColor,
                        fontSize: Sizes.fontSizeTwo,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
