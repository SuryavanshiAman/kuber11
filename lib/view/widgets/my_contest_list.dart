import 'package:flutter/material.dart';
import 'package:kuber11/model/player_data_model.dart';
import 'package:kuber11/new_pages_by_harsh/live_match/constant/contest_details_page.dart';
import 'package:kuber11/new_pages_by_harsh/live_match/live_team_preview.dart';
import 'package:kuber11/new_pages_by_harsh/team_preview.dart';
import 'package:kuber11/view/contest/contest_screen.dart';
import 'package:kuber11/view_model/player_view_model.dart';
import 'package:provider/provider.dart';
import 'package:kuber11/generated/assets.dart';
import 'package:kuber11/res/color_const.dart';
import 'package:kuber11/res/sizes_const.dart';
import 'package:kuber11/utils/route/app_routes.dart';
import 'package:kuber11/utils/utils.dart';
import 'package:kuber11/view/const_widget/container_const.dart';
import 'package:kuber11/view/const_widget/text_const.dart';
import 'package:kuber11/view_model/contest_view_model.dart';

import '../../model/team_data_model.dart';

class MyContestList extends StatelessWidget {
  const MyContestList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContestViewModel>(
      builder: (context, contestProvider, child) {
        final contests = contestProvider.contestData.myContest ?? [];
        final contestLists = contestProvider.contestData.contestList ?? [];

        if (contests.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Utils.noDataAvailableContest(
                titleLabel: '',
                  messageLabel:
                      "You haven't joined a contest yet!\n Find a contest to join and start winning",
                  buttonLabel: 'Join a Contest',
                buttonWidth: Sizes.screenWidth * 0.45,
                onTap:(){Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ContestScreen()));}

              ),
            ],
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          shrinkWrap: true,
          itemCount: contests.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final contest = contests[index];
            final contestList =
                contestLists.length > index ? contestLists[index] : null;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ContainerConst(
                onTap: () {
                  contestProvider.getContestDetail(
                      context, contest.contestId?.toString() ?? '');
                  Navigator.pushNamed(
                    context,
                    AppRoutes.contestDetailScreen,
                    arguments: {"contestDetail": contest},
                  );
                },
                color: AppColor.whiteColor,
                border: Border.all(
                    width: 2, color: AppColor.scaffoldBackgroundColor),
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Sizes.spaceHeight10,
                    TextConst(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      textAlign: TextAlign.left,
                      text: contest.name ?? "Not available",
                      width: Sizes.screenWidth / 2.5,
                      alignment: Alignment.centerLeft,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: LinearProgressIndicator(
                        value: (int.parse(contest.totalSpot.toString() ?? "0") -
                                double.parse(
                                    contest.left_spots.toString() ?? "0")) /
                            int.parse(contest.totalSpot.toString() ?? "1"),
                        backgroundColor: Colors.grey.shade300,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextConst(
                            text: "${contest.left_spots ?? "0"} spots left",
                            width: Sizes.screenWidth / 2.5,
                            alignment: Alignment.centerLeft,
                            textColor: AppColor.primaryRedColor,
                            fontSize: Sizes.fontSizeOne,
                          ),
                          TextConst(
                            text: contest.totalSpot ?? "0",
                            width: Sizes.screenWidth / 2.5,
                            alignment: Alignment.centerRight,
                            fontSize: Sizes.fontSizeOne,
                            textColor: AppColor.textGreyColor,
                          ),
                        ],
                      ),
                    ),
                    ContainerConst(
                      padding: const EdgeInsets.only(
                          left: 15, top: 8, bottom: 8, right: 15),
                      color: AppColor.scaffoldBackgroundColor.withOpacity(0.6),
                      child: Row(
                        children: [
                          Image.asset(
                            Assets.assetsStraightCoinReward,
                            width: 18,
                          ),
                          TextConst(
                            text:
                                "${Utils.rupeeSymbol} ${contest.firstPrize ?? 0}",
                            fontSize: Sizes.fontSizeOne,
                            textColor: AppColor.textGreyColor,
                          ),
                          Sizes.spaceWidth10,
                          const Icon(
                            Icons.emoji_events_outlined,
                            size: 15,
                            color: AppColor.textGreyColor,
                          ),
                          TextConst(
                            text: "",
                            fontSize: Sizes.fontSizeOne,
                            textColor: AppColor.textGreyColor,
                          ),
                          Sizes.spaceWidth10,
                          ContainerConst(
                            width: 16,
                            height: 16,
                            border: Border.all(
                                color: AppColor.blackColor.withOpacity(0.5)),
                            shape: BoxShape.circle,
                            child: TextConst(
                              text: contest.entryLimit == 'Single' ? 'S' : 'M',
                              fontSize: Sizes.fontSizeZero,
                              textColor: AppColor.textGreyColor,
                            ),
                          ),
                          Sizes.spaceWidth5,
                          TextConst(
                            text: contest.entryLimit ?? "0",
                            fontSize: Sizes.fontSizeOne,
                            textColor: AppColor.textGreyColor,
                          ),
                          const Spacer(),
                          TextConst(
                            text: contest.contestSuccessType ?? "Not available",
                            width: Sizes.screenWidth / 3,
                            alignment: Alignment.centerRight,
                            fontSize: Sizes.fontSizeOne,
                          ),
                        ],
                      ),
                    ),
                    ExpansionTile(
                      title: TextConst(
                        text: "Joined with Team ${contest.teams?.length ?? 0}",
                        alignment: Alignment.centerLeft,
                        textColor: AppColor.textGreyColor,
                      ),
                      subtitle: ContainerConst(
                        child: TextConst(
                          text: contest.teamNames ?? "",
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      childrenPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      children: List.generate(contest.teams?.length ?? 0, (i) {
                        final contestTeamData = contest.teams![i];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LiveTeamPreview(
                                  type: 3,
                                  data: null,
                                  data2: null,
                                  data3: null,
                                  data4: contestTeamData,
                                ),
                              ),
                            );
                          },
                          child: ContainerConst(
                            color: Colors.yellow.shade200.withOpacity(0.35),
                            margin: const EdgeInsets.only(bottom: 10),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColor.scaffoldBackgroundColor),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    InkWell(
                                      child: TextConst(
                                        text: contestTeamData.teamName ??
                                            "No name",
                                      ),
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        final pvmCon =
                                            Provider.of<PlayerViewModel>(
                                                context,
                                                listen: false);
                                        // List<TeamPlayerList> data=
                                        // // final data =
                                        // pvmCon.playerData.data!
                                        //     .where((e) => e.teamId.toString() == contestTeamData.id.toString())
                                        //     .toList();
                                        print(
                                            contestTeamData.playerlist!.length);
                                        pvmCon.clearSelectedPlayerList();
                                        pvmCon.setUpdateTeam(
                                            true, contest.id ?? 0);
                                        pvmCon.getUpdateTeamData(
                                            contestTeamData.playerlist);
                                        Navigator.pushNamed(
                                          context,
                                          AppRoutes.createTeamScreen,
                                          arguments: {"allowEdit": true},
                                        );
                                      },
                                      icon: const Icon(Icons.edit),
                                    ),
                                    Sizes.spaceWidth20,
                                    const Icon(Icons.swap_horiz),
                                  ],
                                ),
                                Sizes.spaceHeight10,
                                SizedBox(
                                  width: Sizes.screenWidth / 1.5,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextConst(
                                            text: "Captain:",
                                            textColor: AppColor.textGreyColor,
                                            fontSize: Sizes.fontSizeOne,
                                          ),
                                          TextConst(
                                            text: contestTeamData.captainName ??
                                                "No captain",
                                            width: 120,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextConst(
                                            text: "Vice Captain:",
                                            textColor: AppColor.textGreyColor,
                                            fontSize: Sizes.fontSizeOne,
                                          ),
                                          TextConst(
                                            text: contestTeamData
                                                    .viceCaptainName ??
                                                "No vice-captain",
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
