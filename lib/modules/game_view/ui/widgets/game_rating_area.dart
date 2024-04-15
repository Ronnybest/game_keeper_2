import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:gradient_borders/gradient_borders.dart';

class BuildRatingArea extends StatelessWidget {
  const BuildRatingArea({super.key, required this.game});
  final FullGameModel game;

  int gimmeBiggestRatingCountName() {
    if (game.ratings!.isEmpty) {
      return -1;
    }
    int maxCount = 0;
    int maxIndex = 0;
    for (int i = 0; i < game.ratings!.length; i++) {
      if (game.ratings![i].count! > maxCount) {
        maxCount = game.ratings![i].count!;
        maxIndex = i;
      }
    }
    return maxIndex;
  }

  String capitalizeFirstLetter(String text) {
    if (text.isEmpty) {
      return '';
    }

    return text.substring(0, 1).toUpperCase() + text.substring(1);
  }

  Container buildRatingBar(int widthPercent, Color color) {
    return Container(
      width: widthPercent.toDouble(),
      color: color,
    );
  }

  String formatAddedValue(int value) {
    if (value >= 1000) {
      final double roundedValue = (value / 100).roundToDouble() / 10;
      return '${roundedValue.toStringAsFixed(1)}k';
    } else {
      return value.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    int biggestId = gimmeBiggestRatingCountName();
    if (biggestId >= 0) {
      return IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Text(
            //           capitalizeFirstLetter(game.ratings![biggestId].title!),
            //           style: const TextStyle(
            //               fontSize: 21, fontWeight: FontWeight.bold),
            //         ),
            //         Container(
            //           margin: const EdgeInsets.only(left: 7),
            //           //color: Colors.red,
            //           width: 28,
            //           height: 28,
            //           child: Image.asset(
            //             'assets/images/${AppConstants.emojiPack[game.ratings![biggestId].id]!}',
            //           ),
            //         ),
            //       ],
            //     ),
            //     Text(
            //       '${formatAddedValue(game.ratings![biggestId].count!).toString()} votes',
            //       style: TextStyle(
            //           fontSize: 21, fontWeight: FontWeight.normal),
            //     )
            //   ],
            // ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width - 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Row(
                    children: buildRatingBars(),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: buildRatingsCount(),
              ),
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  List<Widget> buildRatingsCount() {
    List<Widget> ratingsCount = [];
    for (var rating in game.ratings!) {
      ratingsCount.add(Container(
        padding: EdgeInsets.all(3.h),
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: GradientBoxBorder(
            gradient: AppConstants.colorRatingPack[rating.id]!,
            width: 1.5,
          ),
        ),
        height: 30,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            '${capitalizeFirstLetter(rating.title!)}: ${rating.count}',
          ),
        ),
      ));
    }
    return ratingsCount;
  }

  List<Widget> buildRatingBars() {
    List<Widget> ratingBars = [];
    for (var rating in game.ratings!) {
      ratingBars.add(Expanded(
        flex: rating.percent!.toInt(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: AppConstants.colorRatingPack[rating.id]),
              height: 50,
            ),
            Positioned(
              bottom: -2,
              left: -15,
              child: SizedBox(
                height: 45,
                width: 45,
                child: rating.percent!.toInt() >= 10
                    ? Image.asset(
                        'assets/images/${AppConstants.emojiPack[rating.id]}',
                      )
                    : null,
              ),
            ),
          ],
        ),
      ));
    }
    return ratingBars;
  }
}
