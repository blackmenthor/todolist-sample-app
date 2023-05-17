import 'package:flutter/material.dart';

class CardSelect extends StatelessWidget {
  const CardSelect({
    Key? key,
    required this.color,
    required this.onTap,
    this.selected = true,
  }) : super(key: key);

  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(selected ? 6.0 : 0.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 6,
            surfaceTintColor: Colors.white,
            color: Colors.white,
            child: InkWell(
              onTap: onTap,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                      color: color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE7ECF5),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 5,
                                margin: const EdgeInsets.only(right: 64),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE7ECF5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: double.infinity,
                                height: 5,
                                margin: const EdgeInsets.only(right: 108),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE7ECF5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: double.infinity,
                                height: 5,
                                margin: const EdgeInsets.only(right: 84),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE7ECF5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: AnimatedOpacity(
            opacity: selected ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: const Center(
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
