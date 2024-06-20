import 'package:adopte_un_candidat/modules/authentication.dart';
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
  dynamic user;
  int currentindex = 0;
  String swipedirection = '';

  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 1)).then((_) {
    //   _shakeCard();
    // });
    super.initState();

    Authentication().getCurrentUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  void swipeRight() {
    controller.swipeRight();
  }

  void swipeLeft() {
    controller.swipeLeft();
  }

  void addFavorite() {
    if (cardStack![currentindex] != null) {
      database.addFavorite(user.uid, cardStack![currentindex]);
      controller.swipeUp();
    }
  }

  void unSwipe() {
    if (swipedirection == 'left' && currentindex > 0) {
      controller.unswipe();
    }
  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        if (kDebugMode) {
          print('The card was swiped to the : ${activity.direction}');
          print('previous index: $previousIndex, target index: $targetIndex');
        }

        currentindex = targetIndex;
        swipedirection = activity.direction.name;

        if (activity.direction.name == 'right') {
          database.likeCard(user.uid, cardStack![previousIndex]);
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
    database.getStack().then((value) {
      setState(() {
        cardStack!.add(value);
        currentindex = 0;
      });
    });
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
    if (cardStack != null && cardStack!.isNotEmpty) {
      return AppinioSwiper(
        invertAngleOnBottomDrag: true,
        backgroundCardCount: cardStack!.length > 1 ? 1 : 0,
        swipeOptions: const SwipeOptions.symmetric(
          horizontal: true,
        ),
        allowUnlimitedUnSwipe: false,
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
                    return cardStack != null && cardStack!.isNotEmpty ? cards() : const Center(child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text('Il n\'y a plus de cartes à afficher pour le moment. 😢😢', textAlign: TextAlign.center,),
                      Text('Revenez plus tard !'),
                    ],));
                  }
                },
              )),
        ),
      ],
    );
  }
}
