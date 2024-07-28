import 'package:facebook_ui/models/publication.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'dart:math';

class PublicationItem extends StatelessWidget {
  final String photoAvatar;
  final String photoPublication;
  final String username;
  final String description;

  const PublicationItem({
    super.key,
    required this.publication,
    required this.photoPublication,
    required this.username,
    required this.description,
    required this.photoAvatar,
  });
  final Publication publication;

  String _getEmogiPath(Reaction reaction) {
    switch (reaction) {
      case Reaction.like:
        return 'assets/emojis/like.svg';
      case Reaction.love:
        return 'assets/emojis/heart.svg';
      case Reaction.laughing:
        return 'assets/emojis/laughing.svg';
      case Reaction.sad:
        return 'assets/emojis/sad.svg';
      case Reaction.shocking:
        return 'assets/emojis/shocked.svg';
      case Reaction.angry:
        return 'assets/emojis/angry.svg';
    }
  }

  String _formatCout(int value) {
    if (value <= 1000) {
      return value.toString();
    } else {
      return "${(value / 1000).toStringAsFixed(1)}k";
    }
  }

  DateTime getRandomDate() {
    final now = DateTime.now();
    final random = Random();
    final daysAgo = random.nextInt(90); // Rango de los últimos 90 días
    return now.subtract(Duration(days: daysAgo));
  }

  @override
  Widget build(BuildContext context) {
    final randomDate = getRandomDate();

    const reactions = Reaction.values;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Avatar(size: 37, asset: photoAvatar),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  username,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                Text(
                  timeago.format(randomDate),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              photoPublication,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              publication.title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ).copyWith(bottom: 10),
            child: Row(
              children: [
                ...List.generate(reactions.length, (index) {
                  final reaction = reactions[index];
                  final isActive = reaction == publication.currentUserReations;
                  return Padding(
                    padding: const EdgeInsets.only(right: 7),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          _getEmogiPath(reaction),
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Icon(
                          Icons.circle,
                          color: isActive ? Colors.red : Colors.transparent,
                          size: 5,
                        ),
                      ],
                    ),
                  );
                }),
                Flexible(
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text(
                          "${_formatCout(publication.commentsCount)} Comments",
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "${_formatCout(publication.sharesCount)} Share",
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}



DateTime getRandomDate() {
  final now = DateTime.now();
  final random = Random();
  final daysAgo = random.nextInt(90); // Rango de los últimos 90 días
  return now.subtract(Duration(days: daysAgo));
}
