import 'package:adopte_un_candidat/modules/database.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/foundation.dart';
import 'modules/cards.dart';
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
  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        if (kDebugMode) {
          print('The card was swiped to the : ${activity.direction}');
          print('previous index: $previousIndex, target index: $targetIndex');
        }
        break;
      case Unswipe():
        if (kDebugMode) {
          print('A ${activity.direction.name} swipe was undone.');
          print('previous index: $previousIndex, target index: $targetIndex');
        }
        break;
      case CancelSwipe():
        if (kDebugMode) {
          print('A swipe was cancelled');
        }
        break;
      case DrivenActivity():
        if (kDebugMode) {
          print('Driven Activity');
        }
        break;
    }
  }

  void _onEnd() {
    if (kDebugMode) {
      print('end reached!');
    }
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
        backgroundCardCount: cardStack!.length > 1 ? 1 : 0,
        swipeOptions: const SwipeOptions.symmetric(
          horizontal: true,
        ),
        controller: controller,
        onCardPositionChanged: (
          SwiperPosition position,
        ) {
        
        },
        onSwipeEnd: _swipeEnd,
        onEnd: _onEnd,
        cardCount: cardStack!.length,
        cardBuilder: (BuildContext context, int index) {
          return Cards(user: cardStack![index]);
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
    return Column(
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
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>?> snapshot) {
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
              )),
        ),
      ],
    );
  }
}
