import 'dart:developer';

import 'package:adopte_un_candidat/modules/database.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'modules/cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwiperFeature extends StatefulWidget {
  const SwiperFeature({
    super.key,
  });

  @override
  SwiperFeatureState createState() => SwiperFeatureState();
}

class SwiperFeatureState extends State<SwiperFeature> {
  final AppinioSwiperController controller = AppinioSwiperController();

  Database database = Database();
  List<dynamic>? cardStack;

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 1)).then((_) {
    //   _shakeCard();
    // });
    super.initState();
    database.getStack().then(
      (value) {
        setState(() {
          cardStack = value;
        });
      },
    );
  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        log('The card was swiped to the : ${activity.direction}');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case Unswipe():
        log('A ${activity.direction.name} swipe was undone.');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        log('A swipe was cancelled');
        break;
      case DrivenActivity():
        log('Driven Activity');
        break;
    }
  }

  void _onEnd() {
    log('end reached!');
  }

  // Animates the card back and forth to teach the user that it is swipable.
  // Future<void> _shakeCard() async {
  //   const double distance = 30;
  //   // We can animate back and forth by chaining different animations.
  //   await controller.animateTo(
  //     const Offset(-distance, 0),
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  //   await controller.animateTo(
  //     const Offset(distance, 0),
  //     duration: const Duration(milliseconds: 400),
  //     curve: Curves.easeInOut,
  //   );
  //   // We need to animate back to the center because `animateTo` does not center
  //   // the card for us.
  //   await controller.animateTo(
  //     const Offset(0, 0),
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  // }

  Widget cards() {
    if (cardStack != null) {
      return AppinioSwiper(
        invertAngleOnBottomDrag: true,
        backgroundCardCount: 1,
        swipeOptions: const SwipeOptions.symmetric(horizontal: true,),
        controller: controller,
        onCardPositionChanged: (
          SwiperPosition position,
        ) {
          //debugPrint('${position.offset.toAxisDirection()}, '
          //    '${position.offset}, '
          //    '${position.angle}');
        },
        onSwipeEnd: _swipeEnd,
        onEnd: _onEnd,
        cardCount: cardStack!.length,
        cardBuilder: (BuildContext context, int index) {
          return Cards(company: cardStack![index]);
        },
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CupertinoPageScaffold(
         //child: SingleChildScrollView( // Check
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .55,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 0,
                  bottom: 0,
                ),
                child: FutureBuilder<List<dynamic>?>(
                  future: database.getStack(),
                  builder: (BuildContext context, AsyncSnapshot<List<dynamic>?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      cardStack = snapshot.data;
                      return cards();
                    }
                  },
                )
                  
              ),
            ),
          
          ],
        
        ),
      ),
    );
  } 
}
