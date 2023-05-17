import 'package:flutter/material.dart';

class FirstOnboardingPage extends StatelessWidget {
  const FirstOnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).colorScheme.primary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 100.0,
            height: 100.0,
          ),
          const Text(
            'Todoapp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
          const SizedBox(height: 12,),
          const Text(
            'The best to do list application for you',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
