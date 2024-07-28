import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QuickAcctions extends StatelessWidget {
  const QuickAcctions({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.center,
      child: Row(
        children: [
          _QuickButton(
            iconData: Icons.photo_camera_back_outlined,
            colorContiner: const Color.fromARGB(255, 210, 235, 211),
            colorFont: Colors.green.shade300,
            colorText: const Color(0xff9ac895),
            colorIcon: const Color(0xffAEE2A4),
            title: 'Galley',
          ),
          const  SizedBox(
            width: 11,
          ),
        
          _QuickButton(
            iconData: Icons.people_alt_outlined,
            colorContiner: Colors.blue.shade100,
            colorFont: Colors.blue.shade400,
            colorText: Colors.blue,
            colorIcon: Colors.blue.shade200, 
            title: 'Tag Friends',
          ),
          const  SizedBox(
            width: 11,
          ),
          _QuickButton(
              iconData: Icons.photo_camera_front,
              colorContiner: Colors.red.shade100,
              colorFont: Colors.red.shade200,
              colorText: Colors.red.shade300,
              colorIcon: Color.fromARGB(255, 237, 111, 102), 
              title: 'Live',)
        ],
      ),
    );
  }
}

class _QuickButton extends StatelessWidget {
  const _QuickButton({
    super.key,
    required this.iconData,
    required this.colorContiner,
    required this.colorFont,
    required this.colorText,
    required this.colorIcon,
    required this.title,
  });
  final IconData iconData;
  final Color colorContiner;
  final Color colorFont;
  final Color colorText;
  final Color colorIcon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: colorContiner),
      padding: const EdgeInsets.only(right: 25),
      child: Row(
        children: [
          IconsScreenTop(
            icon: iconData,
            color: colorIcon,
            colorIcon: colorFont,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(color: colorText),
          )
        ],
      ),
    );
  }
}
