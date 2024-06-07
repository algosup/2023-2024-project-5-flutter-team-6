import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import 'package:appinio_swiper/appinio_swiper.dart';

// Gradient for Refuse button
const myGradientRefuse = LinearGradient(
  colors: [Color(0xFFE5BF93), Color(0xffd23030)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
// End of Gradient for Refuse button

//..//

// Gradient for Accept button
const myGradientAccept = LinearGradient(
  colors: [Color(0xff5ad230), Color(0xffd4e593)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
// End of Gradient for Accept button

//..//

// Gradient for menu border
const myGradientMenu = LinearGradient(
  colors: [Color(0xffa7207d), Color(0xff6e297c)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

const myGradientButtons = LinearGradient(
  colors: [Color(0xffa7207d), Color(0xff6e297c)],
  begin: Alignment.centerRight,
  end: Alignment.centerLeft,
);
// End of Gradient for menu border

//--//

// Start: LargeFloatingActionButton class (Yes, No buttons)
class LargeFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final LinearGradient? gradient;

  const LargeFloatingActionButton({
    required this.onPressed,
    required this.child,
    this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        shape: BoxShape.circle,
        boxShadow: [
          // Add a shadow to the container
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Define the shadow color here
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(screenWidth *
            0.03),
        child: child, // Adjust padding as a percentage of screen width
      ),
    );
  }
}

// End: LargeFloatingActionButton class (Yes, No buttons)

//---//

// Start: SideFloatingActionButton class (Save, Back buttons)
class SideFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;

  const SideFloatingActionButton({super.key, 
    required this.onPressed,
    required this.child,
    this.color = const Color(0xFFDEDEDE),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width > 600
          ? MediaQuery.of(context).size.width * 0.10
          : MediaQuery.of(context).size.width * 0.15,
      child: FittedBox(
        child: FloatingActionButton(
            onPressed: onPressed,
            backgroundColor: color,
            shape: const CircleBorder(),
            child: child
          ),
      ),
    );
  }
}
// End: SideFloatingActionButton class (Save, Back buttons)

//--//
class RegisterChoice extends StatelessWidget {
  final VoidCallback onPressed;
  final String choice;

  const RegisterChoice({
    required this.onPressed,
    required this.choice,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.07,
      decoration: BoxDecoration(
        gradient: myGradientButtons,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(70),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Define the shadow color here
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        child: Center(
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Center(
                  child: Text(
                    choice,
                    style: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: CupertinoColors.white,
                      fontSize: 26,
                    ),
                  )
                )
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 35.0, 
                    color: Color(0xFFa7207d),
                  ),
                )
              )
            ]
          )
        )
      ),
    );
  }
}

class ConnectionButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ConnectionButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.045,
      decoration: BoxDecoration(
        gradient: myGradientButtons,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(70),
      ),
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
        child: const Center(
          child: Text(
            'Connexion',
            style: TextStyle(
              fontFamily: 'Quicksand',
              color: CupertinoColors.white,
              fontSize: 12,
            ),
          )
        ),
      )
    );
  }
}

class TutorialAnimationButton extends StatelessWidget {
  const TutorialAnimationButton(this.onTap, {super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.question_mark,
        color: CupertinoColors.systemGrey2,
      ),
    );
  }
}

