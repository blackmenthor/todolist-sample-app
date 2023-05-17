import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/widgets/green_button.dart';

class ThirdOnboardingPage extends StatelessWidget {
  const ThirdOnboardingPage({
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
            'assets/images/onboarding_2.png',
            width: double.infinity,
          ),
          const SizedBox(height: 16,),
          const Text(
            'Find the practicality in\nmaking your todo list',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Easy-to-understand user interface that makes you more comfortable when you want to create a task or to do list, Todyapp can also improve productivity',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF767E8C),
              ),
            ),
          ),
          MaterialButton(
            child: const Text(
              'Continue',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {},
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
