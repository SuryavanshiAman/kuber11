import 'package:flutter/material.dart';
import 'package:kuber11/model/game_data_model.dart';
import 'package:kuber11/res/color_const.dart';
import 'package:kuber11/res/sizes_const.dart';
import 'package:kuber11/view/const_widget/container_const.dart';
import 'package:kuber11/view/const_widget/text_const.dart';

class LiveMatchScore extends StatefulWidget {
  final GameData data;
  const LiveMatchScore({super.key, required this.data});

  @override
  State<LiveMatchScore> createState() => _LiveMatchScoreState();
}

class _LiveMatchScoreState extends State<LiveMatchScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.blackColor,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConst(
                  text: "${widget.data.homeTeamName}",
                  textColor: AppColor.whiteColor,
                  fontSize: 12,
                  alignment: FractionalOffset.centerLeft,
                  fontWeight: FontWeight.w400,
                ),
                TextConst(
                  text: "${widget.data.visitorTeamName}",
                  textColor: AppColor.whiteColor,
                  fontSize: 12,
                  alignment: FractionalOffset.centerLeft,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
             const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.data.status == 2
                    ? Row(
                        children: [
                          ContainerConst(
                            shape: BoxShape.circle,
                            width: 30,
                            height: 30,
                            image: DecorationImage(
                              image:
                                  NetworkImage(widget.data.homeTeamImage ?? ""),
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const TextConst(
                            text: "yet to bat",
                            textColor: Colors.white70,
                            fontSize: 12,
                            alignment: FractionalOffset.centerLeft,
                            fontWeight: FontWeight.w200,
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          ContainerConst(
                            shape: BoxShape.circle,
                            width: 30,
                            height: 30,
                            image: DecorationImage(
                              image: NetworkImage(widget.data.homeTeamImage ?? ""),
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                           TextConst(
                            text: "${widget.data.homeTeamScore}/${widget.data.homeTeamWicket}",
                            textColor: Colors.white70,
                            fontSize: 16,
                            alignment: FractionalOffset.centerLeft,
                            fontWeight: FontWeight.w800,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                           TextConst(
                            text: "(${widget.data.homeTeamOvers})",
                            textColor: Colors.white,
                            fontSize: 12,
                            alignment: FractionalOffset.centerLeft,
                            fontWeight: FontWeight.w300,
                          ),
                        ],
                      ),
                widget.data.status == 2?
                Row(
                  children: [
                    const TextConst(
                      text: "(0)",
                      textColor: Colors.white70,
                      fontSize: 12,
                      alignment: FractionalOffset.centerLeft,
                      fontWeight: FontWeight.w200,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const TextConst(
                      text: "31/3",
                      textColor: Colors.white70,
                      fontSize: 16,
                      alignment: FractionalOffset.centerLeft,
                      fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ContainerConst(
                      shape: BoxShape.circle,
                      width: 30,
                      height: 30,
                      image: DecorationImage(
                        image: NetworkImage(widget.data.visitorTeamImage ?? ""),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ):
                Row(
                  children: [
                     TextConst(
                      text: "(${widget.data.visitorTeamOvers})",
                      textColor: Colors.white,
                      fontSize: 12,
                      alignment: FractionalOffset.centerLeft,
                      fontWeight: FontWeight.w300,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                     TextConst(
                      text: "${widget.data.visitorTeamScore}/${widget.data.visitorTeamWicket}",
                      textColor: Colors.white70,
                      fontSize: 16,
                      alignment: FractionalOffset.centerLeft,
                      fontWeight: FontWeight.w800,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    ContainerConst(
                      shape: BoxShape.circle,
                      width: 30,
                      height: 30,
                      image: DecorationImage(
                        image: NetworkImage(widget.data.visitorTeamImage ?? ""),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            widget.data.status == 2
                ? ContainerConst(
                    width: 60,
                    color: AppColor.primaryRedColor.withOpacity(0.1),
                    child: const TextConst(
                      text: "• Live",
                      textColor: AppColor.primaryRedColor,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                : ContainerConst(
                    width: 120,
                    color: AppColor.primaryRedColor.withOpacity(0.1),
                    child: Row(
                      children: [
                        const TextConst(
                          text: "•  ",
                          textColor: AppColor.activeButtonGreenColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                        TextConst(
                          text: "Completed".toUpperCase(),
                          textColor: AppColor.whiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ],
                    ),
                  ),
            widget.data.status == 2
                ? Column(
                    children: [
                      const Divider(),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextConst(
                                  text: "k Carty*",
                                  textColor: AppColor.whiteColor,
                                  fontSize: 12,
                                  alignment: FractionalOffset.centerLeft,
                                  fontWeight: FontWeight.w700,
                                ),
                                TextConst(
                                  text: "6 (11)",
                                  textColor: AppColor.whiteColor,
                                  fontSize: 12,
                                  alignment: FractionalOffset.centerLeft,
                                  fontWeight: FontWeight.w700,
                                ),
                              ],
                            ),
                          ),
                          TextConst(
                            text: "A Farando",
                            textColor: AppColor.whiteColor,
                            fontSize: 12,
                            alignment: FractionalOffset.centerLeft,
                            fontWeight: FontWeight.w700,
                          ),
                          TextConst(
                            text: "2/19 (4.0)",
                            textColor: AppColor.whiteColor,
                            fontSize: 12,
                            alignment: FractionalOffset.centerLeft,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: SizedBox(
                              width: Sizes.screenWidth * 0.48,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextConst(
                                    text: "k Carty",
                                    textColor: AppColor.whiteColor,
                                    fontSize: 12,
                                    alignment: FractionalOffset.centerLeft,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  TextConst(
                                    text: "6 (11)",
                                    textColor: AppColor.whiteColor,
                                    fontSize: 12,
                                    alignment: FractionalOffset.centerLeft,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 20,
                            //  color: AppColor.whiteColor,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 8,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.white,
                                          )),
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ],
                  )
                : TextConst(
                    text: widget.data.note.toString(),
                    textColor: AppColor.whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 10,
                  ),
          ],
        ),
      ),
    );
  }
}
