

import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

final _stories = [
  Story(
      //Siji
      bg: 'assets/images_flutter/shiji_font.jpeg',
      avatar: 'assets/images_flutter/shiji.jpeg',
      userName: 'Shinji'),
  Story(
      //Ritzuko
      bg: 'assets/images_flutter/rit.jpeg',
      avatar: 'assets/images_flutter/ritsuko.jpeg',
      userName: 'Ritzuko'),
  Story(
      //Azuka
      bg: 'assets/images_flutter/azu_kaji.jpeg',
      avatar: 'assets/images_flutter/azuka_1.jpeg',
      userName: 'Azuka'),
  Story(
      //Kaji
      bg: 'assets/images_flutter/kaji_1.jpeg',
      avatar: 'assets/images_flutter/kaji_icon.jpeg',
      userName: 'Kaji'),
  Story(
      //Kaji
      bg: 'assets/images_flutter/mari_1.jpeg',
      avatar: 'assets/images_flutter/mari.jpeg',
      userName: 'Mari')
];

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final story = _stories[index];
          return _stori(story: story);
          
        },
        itemCount: _stories.length,
      ),
    );
  }
}

class _stori extends StatelessWidget {
  const _stori({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90,
      height: 80,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  bottom: 10,
                  top: 0,
                  child: Container(
                    
                    width: 80,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image:AssetImage(story.bg),
                        fit: BoxFit.cover,
                        
                      )
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Avatar(
                    size: 40,
                    asset: story.avatar,
                    borderWidth: 3,
                    
                  ),
                ),
          
              
              ],
            ),
          ),
          
          
          Text(
          story.userName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
         ),
        ],
      ),
      
      
    );
  }
}
