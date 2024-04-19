import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/games/game_view/logic/api/model/where_to_buy_model.dart';
import 'package:url_launcher/url_launcher.dart';

class GameWhereToBuy extends StatefulWidget {
  const GameWhereToBuy({super.key, required this.whereToBuyModel});
  final WhereToBuyModel whereToBuyModel;

  @override
  State<GameWhereToBuy> createState() => _GameWhereToBuyState();
}

const Map<int, String> storeIconPack = {
  1: 'steam.png',
  3: 'ps.png',
  2: 'xbox.png',
  4: 'appstore.png',
  5: 'gog.png',
  6: 'nintendo.png',
  7: 'xbox.png',
  8: 'googleplay.png',
  9: 'itch.png',
  11: 'epicgames.png',
};

const Map<int, String> storesNames = {
  1: 'Steam',
  3: 'PlayStation Store',
  2: 'Xbox Store',
  4: 'App Store',
  5: 'GOG',
  6: 'Nintendo Store',
  7: 'Xbox 360 Store',
  8: 'Google Play',
  9: 'itch.io',
  11: 'Epic Games',
};

class _GameWhereToBuyState extends State<GameWhereToBuy> {
  @override
  Widget build(BuildContext context) {
    return widget.whereToBuyModel.count! > 0 ? SizedBox(
      height: 150,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 5),
            child: Text(
              LocaleKeys.game_view_where_to_buy.tr(),
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ), // Добавьте ваш текст здесь
          Expanded(
            child: ListView.builder(
              itemCount: widget.whereToBuyModel.results!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    right: index == widget.whereToBuyModel.results!.length - 1
                        ? 15
                        : 10,
                    left: index == 0 ? 15 : 0,
                  ),
                  child: WhereToBuyItem(
                    shop: widget.whereToBuyModel.results![index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ) : const SizedBox();
  }
}

Future<void> _launchUrl(String url) async {
  if (url.isEmpty) {
    return;
  }
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}

class WhereToBuyItem extends StatelessWidget {
  const WhereToBuyItem({super.key, required this.shop});
  final Result shop;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchUrl(shop.url ?? 'https://www.google.com');
      },
      child: Card(
        shadowColor: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(5),
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/${storeIconPack[shop.storeId] ?? 'default.png'}',
                height: 42,
                width: 42,
              ),
              Text(
                storesNames[shop.storeId] ?? 'Unknown',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
