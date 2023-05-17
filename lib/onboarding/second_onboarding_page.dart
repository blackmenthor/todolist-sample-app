import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/widgets/green_button.dart';

class SecondOnboardingPage extends StatelessWidget {
  const SecondOnboardingPage({
    Key? key,
    required this.onContinue,
  }) : super(key: key);

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset(
            'assets/images/onboarding_1.png',
            width: double.infinity,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Your convenience in\nmaking a todo list',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Here\'s a mobile platform that helps you create task or to list so that it can help you in every jobeasier and faster.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF767E8C),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Hero(
              tag: 'continue-btn',
              child: GreenButton(
                text: 'Continue',
                onTap: onContinue,
              ),
            ),
          ),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
