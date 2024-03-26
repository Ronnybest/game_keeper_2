import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/modules/home/logic/bloc/home_bloc.dart';

class TrendigGames extends StatelessWidget {
  const TrendigGames({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            LocaleKeys.home_trend_games.tr(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(
                        right: index == 9 ? 15 : 10, left: index == 0 ? 15 : 0),
                    width: 150,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
