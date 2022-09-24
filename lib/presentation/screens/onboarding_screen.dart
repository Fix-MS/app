import 'package:fix_ms/routes.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              'assets/images/onboarding_background.jpg',
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Image.asset(
              'assets/images/logoyellow.png',
              fit: BoxFit.contain,
              height: 100,
            ),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            Container(
              color: const Color.fromARGB(200, 252, 221, 9),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'Willkomen bei ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFDA121A),
                  ),
                  children: [
                    TextSpan(
                        text: 'fixMS',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: '. Wir möchten Dir helfen, Dein '),
                    TextSpan(
                        text: 'Münster',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            ' schöner zu machen. Du hast etwas entdeckt, das '),
                    TextSpan(
                        text: 'kaputt',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' oder '),
                    TextSpan(
                        text: 'dreckig',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' ist? Hier kannst Du es '),
                    TextSpan(
                        text: 'schnell',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ' der richtigen Stelle '),
                    TextSpan(
                        text: 'melden!',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(Routes.settings);
                        },
                        child: const Text(
                          'Los geht\'s!',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Bernhard Kils CC-BY-SA-3.0',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
