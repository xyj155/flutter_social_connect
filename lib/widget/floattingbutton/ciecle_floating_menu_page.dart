import 'package:flutter/material.dart';
import 'circle_floating_menu.dart';
import 'floating_button.dart';

/**
 *
 */
class FloatingMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 8,
            bottom: 8,
            child: CircleFloatingMenu(
              menuSelected: (index) {
//                showToast('You choose NO.$index');
              },
              floatingButton: FloatingButton(
                color: Color.fromARGB(255, 132, 241, 212),
                icon: Icons.add,
                size: 44.0,
                elevation: 1,
              ),
              subMenus: <Widget>[
                FloatingButton(
                  icon: Icons.widgets,
                  elevation: 0.0,
                ),
                FloatingButton(
                  icon: Icons.translate,
                  elevation: 0.0,
                ),
                FloatingButton(
                  icon: Icons.alarm_add,
                  elevation: 0.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
