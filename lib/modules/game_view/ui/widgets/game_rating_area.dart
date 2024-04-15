import 'package:dynamic_color/dynamic_color.dart';
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
    Map<int, Gradient> colorRatingPack = {
      1: LinearGradient(
        colors: [
          const Color.fromARGB(255, 197, 29, 49).harmonizeWith(
            Theme.of(context).colorScheme.secondaryContainer,
          ),
          const Color.fromARGB(255, 63, 13, 18).harmonizeWith(
            Theme.of(context).colorScheme.secondaryContainer,
          ),
        ], //rgba(90, 255, 21, 1)
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      3: LinearGradient(
        colors: [
          const Color.fromARGB(255, 255, 170, 1).harmonizeWith(
            Theme.of(context).colorScheme.secondaryContainer,
          ),
          const Color.fromARGB(255, 158, 85, 2).harmonizeWith(
            Theme.of(context).colorScheme.secondaryContainer,
          ),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      4: LinearGradient(
        colors: [
          const Color.fromARGB(255, 0, 70, 210).harmonizeWith(
            Theme.of(context).colorScheme.secondaryContainer,
          ),
          const Color.fromARGB(255, 41, 29, 124).harmonizeWith(
            Theme.of(context).colorScheme.secondaryContainer,
          )
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
      5: LinearGradient(
        colors: [
          const Color.fromARGB(255, 95, 226, 18).harmonizeWith(
            Theme.of(context).colorScheme.secondaryContainer,
          ),
          const Color.fromARGB(255, 2, 106, 16).harmonizeWith(
            Theme.of(context).colorScheme.secondaryContainer,
          ),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    };

    int biggestId = gimmeBiggestRatingCountName();
    if (biggestId >= 0) {
      return IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Row(
                      children: buildRatingBars(colorRatingPack),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 11),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: buildRatingsCount(colorRatingPack),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  List<Widget> buildRatingsCount(var colorRatingPack) {
    List<Widget> ratingsCount = [];
    int index = 0;
    for (var rating in game.ratings!) {
      ratingsCount.add(
        Container(
          padding: EdgeInsets.all(3.h),
          margin: EdgeInsets.only(
            right: index == 3 ? 15 : 10,
            left: index == 0 ? 15 : 0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: GradientBoxBorder(
              gradient: colorRatingPack[rating.id]!,
              width: 1.5,
            ),
          ),
          height: 30,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              '${capitalizeFirstLetter(AppConstants.ratingNamePack[rating.id]!)}: ${rating.count}',
            ),
          ),
        ),
      );
      index++;
    }
    return ratingsCount;
  }

  List<Widget> buildRatingBars(var colorRatingPack) {
    List<Widget> ratingBars = [];
    for (var rating in game.ratings!) {
      ratingBars.add(Expanded(
        flex: rating.percent!.toInt(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(gradient: colorRatingPack[rating.id]),
              height: 50,
            ),
            Positioned(
              bottom: -2,
              left: -10,
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
