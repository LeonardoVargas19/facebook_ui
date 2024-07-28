class Publication {
  final User users;
  final String title;
  final DateTime createAdt;
  final String imgesURL;
  final int commentsCount;
  final int sharesCount;
  final Reaction currentUserReations;

  Publication({required this.users, required this.title, required this.createAdt, required this.imgesURL, required this.commentsCount, required this.sharesCount, required this.currentUserReations});


      
}

class User {
  final String avatar;
  final String userName;

  User({required this.avatar, required this.userName});
}

enum Reaction {
  like,
  love,
  laughing,
  sad,
  shocking,
  angry,
}
