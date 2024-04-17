import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:html/dom.dart' show Document;
import 'package:html/parser.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_reddit_comments_model.dart';

class RedditComments extends StatefulWidget {
  const RedditComments(
      {super.key,
      required this.redditComments,
      required this.gameId,
      required this.gameName});
  final GameRedditCommentsModel redditComments;
  final int gameId;
  final String gameName;
  @override
  State<RedditComments> createState() => _RedditCommentsState();
}

class _RedditCommentsState extends State<RedditComments> {
  List<Result> redditComments = [];
  late Timer _timer;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _getRedditComments();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _updateDisplayingComment();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _getRedditComments() {
    if (widget.redditComments.results == null) {
      return;
    }
    redditComments = widget.redditComments.results!;
    if (redditComments.isNotEmpty) {
      int length = widget.redditComments.results!.length;
      redditComments.addAll(
          widget.redditComments.results!.sublist(0, length < 5 ? length : 5));
    }
  }

  void _updateDisplayingComment() {
    if (_index < redditComments.length - 1) {
      setState(() {
        _index++;
      });
    } else {
      setState(() {
        _index = 0;
      });
    }
  }

  String decodeHtmlString(String htmlString) {
    Document document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }

  String _getUsername({required bool isAvatar}) {
    if (redditComments[_index].username != null &&
        redditComments[_index].username!.isNotEmpty) {
      String username =
          redditComments[_index].username!.replaceFirst('/u/', '');
      if (isAvatar) {
        return username.substring(0, 1).toUpperCase();
      }
      return username;
    } else {
      if (isAvatar) {
        return LocaleKeys.game_view_reddit_comments_default_username
            .tr()
            .substring(0, 1)
            .toUpperCase();
      }
      return LocaleKeys.game_view_reddit_comments_default_username.tr();
    }
  }

  String _getComment() {
    if (redditComments[_index].name != null &&
        redditComments[_index].name!.isNotEmpty) {
      return redditComments[_index].name!;
    } else if (redditComments[_index].text != null &&
        redditComments[_index].text!.isNotEmpty) {
      return redditComments[_index].text!;
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.redditComments.results!.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(
            RedditCommentsListRoute(
                gameId: widget.gameId, gameName: widget.gameName),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 12, right: 12),
          child: Card(
            shadowColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.game_view_reddit_comments_title.tr(),
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, size: 18),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                        ),
                        child: Center(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: Text(
                              _getUsername(isAvatar: true),
                              key: ValueKey<int>(_index),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 107,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: Text(
                            decodeHtmlString(
                                "${_getUsername(isAvatar: false)}: ${_getComment()}"),
                            key: ValueKey<int>(_index),
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
