import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/game_view/logic/api/model/full_game_model.dart';
import 'package:game_keeper/modules/game_view/ui/widgets/animated_description.dart';

class GameDescriptionCard extends StatefulWidget {
  const GameDescriptionCard({super.key, required this.game});
  final FullGameModel game;
  @override
  State<GameDescriptionCard> createState() => _GameDescriptionCardState();
}

class _GameDescriptionCardState extends State<GameDescriptionCard>
    with SingleTickerProviderStateMixin {
  bool isDescriptionExpanded = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Card(
        shadowColor: Colors.transparent,
        child: InkWell(
          splashFactory: NoSplash.splashFactory,
          onTap: () {
            setState(() {
              isDescriptionExpanded = !isDescriptionExpanded;
              if (isDescriptionExpanded) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.game_view_description.tr(),
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RotationTransition(
                      turns: Tween(begin: 0.25, end: 0.75).animate(
                        CurvedAnimation(
                          parent: _controller,
                          curve: Curves.easeInOut,
                        ),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                      ),
                    ),
                  ],
                ),
                AnimatedDescription(
                  expand: isDescriptionExpanded,
                  child: Text(
                    widget.game.descriptionRaw ?? '',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
