import 'package:adopte_un_candidat/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/buttons.dart';
import 'swiper_feature.dart';

class Home extends StatelessWidget {
 Home({super.key});

  final GlobalKey<SwiperFeatureState> _swiperFeatureKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(
                            10.0),
                        child: Center(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            child: Image.asset(
                                'assets/images/adopte-logo.png'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          
                          ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SwiperFeature(key: _swiperFeatureKey),
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 1,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SideFloatingActionButton(
                        onPressed: () {
                          // Back button logic
                          HapticFeedback.lightImpact();
                          _swiperFeatureKey.currentState?.unSwipe();
                        },
                        child: const Icon(Icons.arrow_back_rounded,
                            size: 35, color: Color(0xFF959595)),
                      ),
                      LargeFloatingActionButton(
                        onPressed: () {
                          // Refuse button logic
                          HapticFeedback.mediumImpact();
                          _swiperFeatureKey.currentState?.swipeLeft();
                        },
                        gradient: myGradientRefuse,
                        child: const Icon(Icons.clear_rounded,
                            size: 60.0, color: Colors.white),
                      ),
                      LargeFloatingActionButton(
                        onPressed: () {
                          // Accept button logic
                          HapticFeedback.mediumImpact();
                          _swiperFeatureKey.currentState?.swipeRight();
                        },
                        gradient:
                            myGradientAccept,

                        child: const Icon(Icons.check_rounded,
                            size: 60.0, color: Colors.white),
                      ),
                      SideFloatingActionButton(
                        onPressed: () {
                          // Save button logic
                          HapticFeedback.lightImpact();
                          _swiperFeatureKey.currentState?.addFavorite();
                        },
                        child: const Icon(Icons.bookmark_rounded,
                            size: 35, color: Color(0xFF959595)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const SuperNavigationBar(index: 1),
        ));
  }
}
