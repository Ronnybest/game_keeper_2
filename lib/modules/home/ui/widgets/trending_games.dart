import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';

class TrendigGames extends StatelessWidget {
  const TrendigGames({super.key, required this.gamesListModel});
  final GamesListModel gamesListModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: gamesListModel.results!.length,
            itemBuilder: (context, index) {
              var game = gamesListModel.results![index];
              return Container(
                margin: EdgeInsets.only(
                    right: index == 9 ? 15 : 10, left: index == 0 ? 15 : 0),
                width: 300.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: FastCachedImageProvider(game.backgroundImage!),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 15,
                      right: 15,
                      child: SizedBox(
                        width: 300.w,
                        child: Text(
                          game.name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
