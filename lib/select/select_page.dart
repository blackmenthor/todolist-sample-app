import 'package:flutter/material.dart';
import 'package:flutter_uol_sample/main/main_page.dart';
import 'package:flutter_uol_sample/select/card_select.dart';
import 'package:flutter_uol_sample/widgets/green_button.dart';

enum SelectColor {
  green,
  black,
  red,
  blue;

  Color get color {
    return switch (this) {
      green => const Color(0xFF24A19C),
      black => Colors.black,
      red => const Color(0xFFEA4335),
      blue => const Color(0xFF1877F2),
    };
  }
}

class SelectPage extends StatefulWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  SelectColor _selectedColor = SelectColor.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Create to do list',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Choose your to do list color scheme:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF767E8C),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: SelectColor.values.length,
                    itemBuilder: (context, index) {
                      final color = SelectColor.values[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CardSelect(
                          color: color.color,
                          selected: color == _selectedColor,
                          onTap: () {
                            setState(() {
                              _selectedColor = color;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
                Hero(
                  tag: 'continue-btn',
                  child: GreenButton(
                    text: 'Open Todoapp',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(
                            color: _selectedColor,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
