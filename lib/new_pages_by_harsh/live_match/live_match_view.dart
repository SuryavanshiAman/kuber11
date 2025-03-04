import 'package:flutter/material.dart';
import 'package:kuber11/model/game_data_model.dart';
import 'package:kuber11/new_pages_by_harsh/live_match/Score_card.dart';
import 'package:kuber11/new_pages_by_harsh/live_match/Stats.dart';
import 'package:kuber11/new_pages_by_harsh/live_match/commentry_page.dart';
import 'package:kuber11/new_pages_by_harsh/live_match/live_match_score.dart';
import 'package:kuber11/new_pages_by_harsh/live_match/my_contest_page.dart';
import 'package:kuber11/new_pages_by_harsh/live_match/teams.dart';
import 'package:kuber11/res/color_const.dart';
import 'package:kuber11/res/sizes_const.dart';
import 'package:kuber11/view/const_widget/container_const.dart';
import 'package:kuber11/view/const_widget/text_const.dart';

class LiveMatchView extends StatefulWidget {
  final GameData data;
  const LiveMatchView({super.key, required this.data});

  @override
  State<LiveMatchView> createState() => _LiveMatchViewState();
}

class _LiveMatchViewState extends State<LiveMatchView> {
  final List<String> contestList = [
    "My Contest",
    "Teams",
    "Commentary",
    "Scorecard",
    "Stats",
  ];
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: contestList.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blackColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColor.whiteColor,
            ),
          ),
          title: TextConst(
            text:
            "${widget.data.homeTeamShortName} vs ${widget.data.visitorTeamShortName}",
            textColor: AppColor.whiteColor,
            fontSize: Sizes.fontSizeLarge / 1.25,
            alignment: FractionalOffset.centerLeft,
            fontWeight: FontWeight.w600,
          ),
          actions: [appBarAction()],
        ),
        body: Column(
          children: [
            LiveMatchScore(data: widget.data),
            TabBar(
              isScrollable: true,
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              tabAlignment: TabAlignment.start,
              tabs: contestList.map((title) => Tab(text: title)).toList(),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MyContestPage(data: widget.data),
                  Teams(),
                  CommentryPage(),
                  ScorecardPage(),
                  LiveStats(data: widget.data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget appBarAction() {
    return Row(
      children: [
        ContainerConst(
          margin: const EdgeInsets.only(right: 15),
          shape: BoxShape.circle,
          padding: const EdgeInsets.all(5),
          border: Border.all(color: Colors.white, width: 2),
          child: Text(
            "?",
            style: TextStyle(
                fontSize: Sizes.fontSizeOne,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        ContainerConst(
          margin: const EdgeInsets.only(right: 15),
          shape: BoxShape.circle,
          padding: const EdgeInsets.all(5),
          border: Border.all(color: Colors.white, width: 2),
          child: const Text(
            "PTS",
            style: TextStyle(
                fontSize: 7, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
