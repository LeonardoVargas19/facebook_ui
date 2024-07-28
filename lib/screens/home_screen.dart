import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:faker/faker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final publications = <Publication>[
      //Ritzuko
      Publication(
          users: User(
              avatar: 'assets/images_flutter/ritsuko.jpeg',
              userName: 'Ritsuko Akagi'),
          title: 'Finding peace amidst the chaos, today was a day of perfect balance.',
          createAdt: DateTime.now(),
          imgesURL: 'assets/images_flutter/ritsuko_publications.jpeg',
          commentsCount: 5,
          sharesCount: 2,
          currentUserReations: Reaction.like),
          //Shinji
      Publication(
          users: User(
              avatar: 'assets/images_flutter/shiji.jpeg',
              userName: 'Shinji Ikari'),
          title: 'Amidst the chaos, I find brief moments of calm with Misato.',
          createAdt: faker.date.dateTime(),
          imgesURL: 'assets/images_flutter/shiji_publication.jpeg',
          commentsCount: 10,
          sharesCount: 4,
          currentUserReations: Reaction.love),
          //Asuka
      Publication(
          users: User(
              avatar: 'assets/images_flutter/azuka_1.jpeg',
              userName: 'Asuka Langley '),
          title: 'Sometimes, facing the chaos head-on is the only way to find your true self. 💪',
          createAdt: faker.date.dateTime(),
          imgesURL: 'assets/images_flutter/asuka_publication.jpeg',
          commentsCount: 10,
          sharesCount: 4,
          currentUserReations: Reaction.angry),
          //Kagi
      Publication(
          users: User(
              avatar: 'assets/images_flutter/kaji_icon.jpeg',
              userName: 'Ryōji Kaji'),
          title: 'Life s complexities are easier to handle with the right company. 🌊😊',
          createAdt: faker.date.dateTime(),
          imgesURL: 'assets/images_flutter/kaji_1_publication.jpeg',
          commentsCount: 10,
          sharesCount: 4,
          currentUserReations: Reaction.love),
          //Misato
      Publication(
          users: User(
              avatar: 'assets/images_flutter/mis_1.jpeg',
              userName: 'Misato Katsuragi'),
          title: 'Finding humor in the chaos keeps me going. 🍻😅',
          createAdt: faker.date.dateTime(),
          imgesURL: 'assets/images_flutter/kaji.jpeg',
          commentsCount: 10,
          sharesCount: 4,
          currentUserReations: Reaction.like),
          
      // Agrega más publicaciones según sea necesario
    ];

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 150,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        backgroundColor: Colors.white,
        elevation: 0,
        leading:
            SvgPicture.asset('assets/logo/facebook.svg', color: Colors.blue),
        actions: [
          const IconsScreenTop(
            icon: Icons.search,
            color: Colors.grey,
            colorIcon: Colors.white,
          ),
          const SizedBox(width: 15),
          const IconsScreenTop(
            icon: Icons.notifications,
            color: Colors.red,
            colorIcon: Colors.white,
          ),
          const SizedBox(width: 15),
          IconsScreenTop(
            icon: Icons.people,
            color: Colors.blue.shade300,
            colorIcon: Colors.white,
          ),
          const SizedBox(width: 15),
          const IconsScreenTop(
            icon: Icons.message_rounded,
            color: Colors.blue,
            colorIcon: Colors.white,
            showNotification: true,
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
        children: [
          const Row(
            children: [
              Avatar(size: 60, asset: 'assets/users/rei.jpeg'),
              SizedBox(width: 10),
              _whatIsYourMind(),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          const QuickAcctions(),
          const SizedBox(
            height: 14,
          ),
          const Stories(),
          const SizedBox(
            height: 20,
          ),
          for (var publication in publications)
            PublicationItem(
              publication: publication,
              photoPublication: publication.imgesURL,
              username: publication.users.userName,
              description: publication.title,
              photoAvatar: publication.users.avatar,
            ),
        ],
      ),
    );
  }
}

class _whatIsYourMind extends StatelessWidget {
  const _whatIsYourMind({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TextField(
        decoration: InputDecoration(
          hintText: 'What\'s on your mind?',
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
