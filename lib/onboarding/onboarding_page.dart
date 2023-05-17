import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/onboarding/first_onboarding_page.dart';
import 'package:flutter_uol_sample/onboarding/second_onboarding_page.dart';
import 'package:flutter_uol_sample/onboarding/third_onboarding_page.dart';
import 'package:flutter_uol_sample/select/select_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key, required this.title});

  final String title;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _controller = PageController(initialPage: _currentPage);
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.round();
      });
    });
  }

  void _toSelectPage() => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SelectPage()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _controller,
            children: [
              const FirstOnboardingPage(),
              SecondOnboardingPage(
                onContinue: _toSelectPage,
              ),
              ThirdOnboardingPage(
                onContinue: _toSelectPage,
              ),
            ],
          ),
          Positioned(
            bottom: 108,
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                dotColor: const Color(0xFFCBF1F0),
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: _currentPage == 0
                    ? const Color(0xFFCBF1F0)
                    : const Color(0xFF24A19C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
