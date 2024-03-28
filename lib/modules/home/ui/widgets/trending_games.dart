import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:game_keeper/core/models/user_firestore.dart';
import 'package:game_keeper/core/utils/user_info_firestore.dart';
import 'package:game_keeper/modules/home/logic/api/model/games_list_model.dart';
import 'package:game_keeper/ui/widgets/gk_animated_bookmark.dart';
import 'package:get_it/get_it.dart';

class TrendigGames extends StatefulWidget {
  const TrendigGames({super.key, required this.gamesListModel});
  final GamesListModel gamesListModel;

  @override
  State<TrendigGames> createState() => _TrendigGamesState();
}

class _TrendigGamesState extends State<TrendigGames> {
  late UserFirestore userFirestore;
  List<int> bookMarkedGamesId = [];
  List<int> userMarkedGamesId = [];
  @override
  void initState() {
    super.initState();
    userFirestore = GetIt.I<UserInfoFirestore>().getUserFirestore;
    userMarkedGamesId = userFirestore.bookMarkedGamesId!;
  }

  Map<int, bool> bookmarkedMap = {};
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
            itemCount: widget.gamesListModel.results!.length,
            itemBuilder: (context, index) {
              var game = widget.gamesListModel.results![index];
              bool isBookmarked = false;
              if (userMarkedGamesId.contains(game.id) &&
                  userMarkedGamesId.isNotEmpty) {
                isBookmarked = true;
              }
              return GestureDetector(
                onTap: () {
                  // Navigator.of(context).pushNamed(
                  //   Routes.gameDetailsScreen,
                  //   arguments: GameDetailsScreenArguments(game: game),
                  // );
                },
                onDoubleTap: () async {
                  if (isBookmarked) {
                    userMarkedGamesId.remove(game.id);
                  } else {
                    userMarkedGamesId.add(game.id!);
                  }
                  setState(() {
                    isBookmarked = !isBookmarked;
                  });
                  var newData = userFirestore.copyWith(
                    bookMarkedGamesId: userMarkedGamesId,
                  );
                  await GetIt.I<UserInfoFirestore>().updateUserInfo(newData);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      right: index == 9 ? 15 : 10, left: index == 0 ? 15 : 0),
                  width: 300.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondaryContainer
                        .withOpacity(.3),
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
                            ).merge(
                              const TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    offset: Offset(1, 1),
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      GKAnimatedBookmark(
                        isBookmarked: isBookmarked,
                        right: 10,
                        top: -10,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
