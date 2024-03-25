import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fast_cached_network_image/fast_cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/generated/locale.keys.g.dart';
import 'package:game_keeper/ui/widgets/gk_appbar.dart';
import 'package:game_keeper/ui/widgets/gk_list_item.dart';

@RoutePage()
class ApplicationPreferences extends StatefulWidget {
  const ApplicationPreferences({super.key});

  @override
  State<ApplicationPreferences> createState() => _ApplicationPreferencesState();
}

class _ApplicationPreferencesState extends State<ApplicationPreferences> {
  static User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GKAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 90,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: FastCachedImageProvider(user!.photoURL!),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user!.displayName!,
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          LocaleKeys.preferences_profile_settings.tr(),
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer
                                  .withOpacity(.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GKListItem(
              title: 'test',
              subtitle: 'asdasd',
              leading: 'assets/images/log_out.svg',
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            // GKListItem(
            //   title: 'test',
            //   leading: Icon(Icons.abc),
            //   borderRadius: BorderRadius.zero,
            // ),
            // GKListItem(
            //   title: 'test',
            //   leading: Icon(Icons.abc),
            //   borderRadius: BorderRadius.zero,
            // ),
            // GKListItem(
            //   title: 'test',
            //   leading: Icon(Icons.abc),
            //   borderRadius: BorderRadius.zero,
            // ),
            // GKListItem(
            //   title: 'test',
            //   leading: Icon(Icons.abc),
            //   borderRadius: BorderRadius.zero,
            // ),
            // GKListItem(
            //   title: 'test',
            //   leading: Icon(Icons.abc),
            //   borderRadius: BorderRadius.only(
            //     bottomLeft: Radius.circular(20),
            //     bottomRight: Radius.circular(20),
            //   ),
            // ),
            SizedBox(
              height: 40,
            ),
            GKListItem(
              title: LocaleKeys.preferences_logout.tr(),
              leading: 'assets/images/log_out.svg',
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                FirebaseAuth.instance.signOut();
                AutoRouter.of(context).popAndPush(const AuthRoute());
              },
            )
          ],
        ),
      ),
    );
  }
}
