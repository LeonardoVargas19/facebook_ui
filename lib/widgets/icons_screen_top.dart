import 'package:flutter/material.dart';

class IconsScreenTop extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color colorIcon;
  final bool? showNotification;

  const IconsScreenTop({
    Key? key,
    required this.icon,
    required this.color,
    required this.colorIcon,
    this.showNotification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: colorIcon,
            size: 19,
          ),
        ),
        if (showNotification == true)
          Positioned(
            top: 7,
            right: 0,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
                border: Border.all(
                  width: 3,
                  color: Colors.white,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
