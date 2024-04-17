import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/game_reddit_comments_model.dart';
import 'package:game_keeper/ui/widgets/gk_shimmer.dart';
import 'package:html/dom.dart' show Document;
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

class RedditCommentTile extends StatelessWidget {
  const RedditCommentTile({super.key, required this.comment});
  final Result comment;

  String _getUsername() {
    if (comment.username != null && comment.username!.isNotEmpty) {
      String username = comment.username!.replaceFirst('/u/', '');
      return username;
    } else {
      return LocaleKeys.game_view_reddit_comments_default_username.tr();
    }
  }

  String decodeHtmlString(String htmlString) {
    Document document = parse(htmlString);
    return parse(document.body!.text).documentElement!.text;
  }

  Future<void> _launchUrl(String url) async {
    if (url.isEmpty) {
      return;
    }
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchUrl(comment.url ?? 'https://www.reddit.com');
      },
      splashFactory: NoSplash.splashFactory,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
        ),
        child: Card(
          shadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${_getUsername()}: ${comment.name}",
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (comment.image != null && comment.image!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FastCachedImage(
                        url: comment.image!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, progress) {
                          return ShimmerElement(
                              width: double.infinity,
                              height: 200,
                              radius: BorderRadius.circular(20));
                        },
                      ),
                    ),
                  ),
                if (comment.text != null && comment.text!.isNotEmpty)
                  Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(decodeHtmlString(comment.text ?? ''))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
