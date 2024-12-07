import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kuber11/generated/assets.dart';
import 'package:kuber11/res/color_const.dart';
import 'package:kuber11/res/sizes_const.dart';
import 'package:kuber11/utils/route/app_routes.dart';
import 'package:kuber11/utils/utils.dart';
import 'package:kuber11/view/const_widget/button_const.dart';
import 'package:kuber11/view/const_widget/container_const.dart';
import 'package:kuber11/view/const_widget/text_const.dart';
import 'package:kuber11/view_model/contest_view_model.dart';
import 'package:kuber11/view_model/player_view_model.dart';

import '../contest/joiin_contest_bottom_sheet.dart';

class ContestsList extends StatelessWidget {
  const ContestsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContestViewModel>(
      builder: (context, contestProvider, child) {
        final contests = contestProvider.contestData.contestList;
        switch (contestProvider.dataState){
          case ContestDataState.loading:
            return Utils.loadingRed;
          case ContestDataState.success:
            return  ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              shrinkWrap: true,
              itemCount: contests!.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final contest = contests[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ContainerConst(
                    onTap: (){
                      contestProvider.setEnableJoinContestBottomSheet(true);
                      contestProvider.setSelectedContestData(contest);
                      contestProvider.getContestDetail(context,contest.id.toString());
                      Navigator.pushReplacementNamed(context, AppRoutes.contestDetailScreen, arguments: {"contestDetail":contest});
                    },
                    color: AppColor.whiteColor,
                    border:
                    Border.all(width: 2, color: AppColor.scaffoldBackgroundColor),
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        ListTile(
                          title: TextConst(
                            text: "Prize Pool",
                            width: Sizes.screenWidth / 2.5,
                            alignment: Alignment.centerLeft,
                            fontSize: Sizes.fontSizeOne,
                            textColor: AppColor.textGreyColor,
                          ),
                          subtitle: TextConst(
                            text: "₹${contest.prizePool}",
                            width: Sizes.screenWidth / 2.5,
                            alignment: Alignment.centerLeft,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextConst(
                                text: contest.name??"Not avl",
                                width: Sizes.screenWidth / 2.5,
                                alignment: Alignment.centerRight,
                                textColor: AppColor.textGreyColor,
                                fontSize: Sizes.fontSizeOne,
                              ),
                              contest.entry.toString() == contest.my_joined_count.toString()?
                              const SizedBox.shrink():
                              contest.entryLimit == 'Single' && contest.my_joined_count == 1?
                              const SizedBox.shrink():
                              contest.left_spot==0?const SizedBox.shrink():
                              ButtonConst(
                                onTap: () async {
                                  contestProvider.setEnableJoinContestBottomSheet(true);
                                  contestProvider.setSelectedContestData(contest);
                                  await Provider.of<PlayerViewModel>(context, listen: false).getPlayers(context);
                                  if(Provider.of<PlayerViewModel>(context, listen: false).teamData!.data!.isEmpty){
                                    Navigator.pushReplacementNamed(context, AppRoutes.createTeamScreen);
                                  }
                                  else if(Provider.of<PlayerViewModel>(context ,listen: false).teamData!.data!.length==1){
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (_) {
                                          return const JoinContestBottomSheetScreen();
                                        });
                                  }else{
                                    Navigator.pushNamed(context, AppRoutes.selectTeamScreen);
                                  }
                                },
                                label: "₹${contest.entryFee}",
                                width: 80,
                                height: 30,
                                color: AppColor.activeButtonGreenColor,
                                textColor: AppColor.whiteColor,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:  const EdgeInsets.symmetric(horizontal: 16.0),
                          child: LinearProgressIndicator(
                             value: (int.parse(contest.totalSpot.toString()) - contest.left_spot) /
                            // value: (int.parse(contest.left_spot.toString()) - 10) /
                                 int.parse(contest.totalSpot.toString()),
                            backgroundColor: Colors.grey.shade300,
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextConst(
                                text: contest.left_spot==0?'Full':"${contest.left_spot} spots left",
                                width: Sizes.screenWidth / 2.5,
                                alignment: Alignment.centerLeft,
                                textColor: AppColor.primaryRedColor,
                                fontSize: Sizes.fontSizeOne,
                              ),
                              TextConst(
                                text: contest.totalSpot??"",
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
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: Row(
                            children: [
                              Image.asset(
                                Assets.assetsStraightCoinReward,
                                width: 18,
                              ),
                              TextConst(
                                text: "${Utils.rupeeSymbol} ${contest.firstPrize??0}",
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
                                text: "62%",
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
                                  text: contest.entryLimit=='Single'?'S':'M',
                                  fontSize: Sizes.fontSizeZero,
                                  textColor: AppColor.textGreyColor,
                                ),
                              ),
                              Sizes.spaceWidth5,
                              TextConst(
                                text: contest.entryLimit??"0",
                                fontSize: Sizes.fontSizeOne,
                                textColor: AppColor.textGreyColor,
                              ),
                              const Spacer(),
                              TextConst(
                                text:contest.contestSuccessType??"Not avl",
                                width: Sizes.screenWidth / 3,
                                alignment: Alignment.centerRight,
                                fontSize: Sizes.fontSizeOne,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          case ContestDataState.noDataAvl:
            return Utils.noDataAvailableVector();
          case ContestDataState.error:
            return Utils.noDataAvailableVector(messageLabel: contestProvider.message);
        }
      }
    );
  }
}
