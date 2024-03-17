import 'package:auto_route/auto_route.dart';
import 'package:game_keeper/core/utils/shared_prefs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_keeper/core/constants/constants.dart';
import 'package:game_keeper/core/router/app_router.gr.dart';
import 'package:game_keeper/modules/auth/ui/widgets/demo_widget.dart';
import 'package:game_keeper/ui/widgets/gk_button.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class DemoSharedPrefsValues {
  static const String showed = 'showed';
}

class _DemoScreenState extends State<DemoScreen> {
  late PageController _pageController;
  final _constants = GetIt.instance<DemoScreenConstants>();
  String _currentButtonText =
      GetIt.instance<DemoScreenConstants>().buttonText[0];
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentButtonText = _constants.buttonText[value];
              });
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return DemoWidget(
                backgroundColor: _constants.backgroundColors[index],
                title: _constants.titles[index],
                subtitle: _constants.subtitles[index],
                image: _constants.images[index],
              );
            },
          ),
          Positioned(
              top: 50,
              right: 15,
              child: GestureDetector(
                onTap: () {
                  AutoRouter.of(context).replace(const AuthRoute());
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black38,
                ),
              )),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GKButton(
                onTap: () async {
                  if (_pageController.page == 2) {
                    var prefs = await GetIt.I<SharedPrefencesUtil>()
                        .sharedPreferencesInit();
                    prefs.setString(SharedPrefsConstants.hasSeenDemo,
                        DemoSharedPrefsValues.showed);
                    if (context.mounted) {
                      AutoRouter.of(context).replace(const AuthRoute());
                    }
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Center(
                  child: Text(
                    _currentButtonText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SmoothPageIndicator(
                count: 3,
                effect: ScrollingDotsEffect(
                  dotColor: Colors.black26,
                  activeDotColor: Theme.of(context).primaryColor,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
                onDotClicked: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                controller: _pageController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
