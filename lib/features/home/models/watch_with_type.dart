enum WatchWithType {
  lover,
  friend,
  alone,
  family,
  acquaintance;

  String get url => switch (this) {
        WatchWithType.lover => "assets/icons/watch-with-lover.svg",
        WatchWithType.friend => "assets/icons/watch-with-friend.svg",
        WatchWithType.alone => "assets/icons/watch-with-alone.svg",
        WatchWithType.family => "assets/icons/watch-with-family.svg",
        WatchWithType.acquaintance =>
          "assets/icons/watch-with-acquaintance.svg",
      };

  String get korean => switch (this) {
        WatchWithType.lover => "연인",
        WatchWithType.friend => "친구",
        WatchWithType.alone => "혼자",
        WatchWithType.family => "가족",
        WatchWithType.acquaintance => "지인",
      };
}

extension WatchWithTypeExtension on WatchWithType {
  static WatchWithType fromString(String person) {
    switch (person) {
      case "lover":
        return WatchWithType.lover;
      case "friend":
        return WatchWithType.friend;
      case "alone":
        return WatchWithType.alone;
      case "family":
        return WatchWithType.family;
      case "acquaintance":
        return WatchWithType.acquaintance;
      default:
        throw Exception("Invalid type");
    }
  }
}
