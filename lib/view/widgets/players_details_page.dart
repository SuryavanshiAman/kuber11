import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kuber11/model/team_data_model.dart';
import 'package:kuber11/new_pages_by_harsh/model/live_team_preview_model.dart';
import 'package:kuber11/new_pages_by_harsh/model/match_player_info.dart';
import 'package:kuber11/res/app_url_const.dart';
import 'package:kuber11/res/color_const.dart';
import 'package:kuber11/res/sizes_const.dart';
import 'package:kuber11/view/const_widget/container_const.dart';
import 'package:kuber11/view/const_widget/text_const.dart';
import 'package:http/http.dart' as http;
import 'package:kuber11/view_model/game_view_model.dart';
import 'package:provider/provider.dart';

class PlayersListPage extends StatefulWidget {
  final String index;
  final LiveTeamPreviewModel? player1;
  final TeamPlayerList? player2;

  const PlayersListPage({
    Key? key,
    required this.index,
    this.player1,
    this.player2,
  }) : super(key: key);

  @override
  State<PlayersListPage> createState() => _PlayersListPageState();
}

class _PlayersListPageState extends State<PlayersListPage> {
  @override
  void initState() {
    playerInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColor.blackColor,
        leadingWidth: 300,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: AppColor.whiteColor),
            ),
            TextConst(
              textAlign: TextAlign.start,
              text: "Player Info",
              textColor: AppColor.whiteColor,
              fontWeight: FontWeight.bold,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ContainerConst(
              height: Sizes.screenHeight * 0.07,
              width: Sizes.screenWidth * 0.07,
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.whiteColor, width: 2),
              child: TextConst(
                text: "PTS",
                textColor: AppColor.whiteColor,
                fontWeight: FontWeight.w500,
                fontSize: Sizes.fontSizeOne,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ContainerConst(
                height: Sizes.screenHeight * 0.1,
                color: Colors.black,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CachedNetworkImage(
                      imageUrl: playerImg.toString(),
                      imageBuilder: (context, imageProvider) => Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                        ],
                      ),
                      placeholder: (context, url) => const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.error),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Sizes.spaceHeight25,
                        TextConst(
                          text: "Selected By",
                          textColor: Colors.grey,
                          fontSize: Sizes.fontSizeOne,
                        ),
                        TextConst(
                         // text: "46.53%",
                          text: selectedBy==null?'N/A':'$selectedBy%',
                          textColor: Colors.grey,
                          fontSize: Sizes.fontSizeThree,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Sizes.spaceHeight25,
                        TextConst(
                          text: "Credits",
                          textColor: Colors.grey,
                          fontSize: Sizes.fontSizeOne,
                        ),
                        TextConst(
                          text: credits??'N/A',
                          textColor: Colors.grey,
                          fontSize: Sizes.fontSizeThree,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Sizes.spaceHeight25,
                        TextConst(
                          text: "Points",
                          textColor: Colors.grey,
                          fontSize: Sizes.fontSizeOne,
                          fontWeight: FontWeight.bold,
                        ),
                        TextConst(
                          text: totalPoints??'N/A',
                          textColor: Colors.grey,
                          fontSize: Sizes.fontSizeThree,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Sizes.spaceHeight10,
              TextConst(
                text: playerFullName??'N/A',
                fontWeight: FontWeight.bold,
                fontSize: Sizes.fontSizeThree,
                textAlign: TextAlign.start,
              ),
              Sizes.spaceHeight5,
              Divider(color: AppColor.scaffoldBackgroundColor),
              ContainerConst(
                height: Sizes.screenHeight * 0.05,
                padding: const EdgeInsets.only(left: 10, right: 10),
                border: Border(
                  bottom: BorderSide(color: AppColor.scaffoldBackgroundColor),
                ),
                child: Row(
                  children: [
                    TextConst(
                      text: "Event",
                      textColor: AppColor.textGreyColor,
                      fontSize: Sizes.fontSizeTwo,
                      fontWeight: FontWeight.w500,
                      width: Sizes.screenWidth*0.35,
                      alignment: Alignment.centerLeft,
                    ),
                    TextConst(
                      text: "Points",
                      textColor: AppColor.textGreyColor,
                      fontSize: Sizes.fontSizeTwo,
                      fontWeight: FontWeight.w500,
                      width: Sizes.screenWidth*0.15
                    ),
                    TextConst(
                      text: "Actual",
                      textColor: AppColor.textGreyColor,
                      fontSize: Sizes.fontSizeTwo,
                      fontWeight: FontWeight.w500,
                      alignment: Alignment.centerRight,
                        width: Sizes.screenWidth*0.32
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: playerInfoDetail.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final data= playerInfoDetail[index];
                    return Container(
                      height: Sizes.screenHeight * 0.05,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: AppColor.scaffoldBackgroundColor),
                        ),
                      ),
                      child: Row(
                        children: [
                          TextConst(
                            text: data.event,
                            fontSize: Sizes.fontSizeOne,
                            fontWeight: FontWeight.w400,
                            alignment: Alignment.centerLeft,
                            width: Sizes.screenWidth*0.35,
                          ),
                          TextConst(
                            text: data.points,
                            fontSize: Sizes.fontSizeOne,
                            fontWeight: FontWeight.w400,
                              width: Sizes.screenWidth*0.15
                          ),
                          TextConst(
                            text: data.actual,
                            fontSize: Sizes.fontSizeOne,
                            fontWeight: FontWeight.w400,
                            alignment: Alignment.centerRight,
                              width: Sizes.screenWidth*0.32

                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int? responseStatusCode;

  List<EventData> playerInfoDetail = [];
  String? playerFullName;
  String? selectedBy;
  String? credits;
  String? totalPoints;
  String? playerImg;


  Future<void> playerInfo() async {
    final matchId = widget.index == "1" ? widget.player1!.matchid : widget.player2!.matchid;
    final playerId = widget.index == "1" ? widget.player1!.playerid : widget.player2!.playerid;
    final gameID = Provider.of<GameViewModel>(context, listen: false).selectedGameTypeId;

    print(gameID);
    print('gameID');

    final headers = {
      "Content-Type": "application/json; charset=UTF-8",
    };
    final body = json.encode({
      'type': '1',
      'matchid': matchId.toString(),
      'gameid': gameID.toString(),
      'playerid': playerId.toString(),
    });
print(body);
    try {
      final response = await http.post(
        Uri.parse(AppApiUrls.playerInfo),
        headers: headers,
        body: body,
      );
      print(AppApiUrls.playerInfo);

      setState(() {
        responseStatusCode = response.statusCode;
      });

      if (response.statusCode == 200) {
      final  responseData = json.decode(response.body)['data'];
        final List<dynamic> responseData2 = json.decode(response.body)['data']['event_data'];
        setState(() {
          playerInfoDetail = responseData2.map((item) => EventData.fromJson(item)).toList();
          playerFullName= responseData['playername'];
          selectedBy= responseData['selected_by'].toString();
          credits= responseData['credit_points'].toString();
          totalPoints= responseData['total_point'].toString();
          playerImg= responseData['playerimage'].toString();

        });
      } else if (response.statusCode == 400) {
        setState(() {
          playerInfoDetail = [];
        });
        if (kDebugMode) {
          print('Data not found');
        }
      } else {
        throw Exception('Failed to load data with status code ${response.statusCode}');
      }
    } catch (e) {
      if (kDebugMode) {
        print('An error occurred: $e');
      }
      // Optionally, handle connection error or other specific error cases.
    }
  }}
