enum Contents {
  top,
  aboutMe,
  engineeringDesign,
  other,
  account,
}

extension ContentsExtension on Contents {
  String get title {
    switch (this) {
      case Contents.top:
        return 'top';
      case Contents.aboutMe:
        return 'about Me';
      case Contents.engineeringDesign:
        return 'engineering/design';
      case Contents.other:
        return 'other';
      case Contents.account:
        return 'account';
    }
  }
  int get num {
    switch (this) {
      case Contents.top:
        return 0;
      case Contents.aboutMe:
        return 1;
      case Contents.engineeringDesign:
        return 2;
      case Contents.other:
        return 3;
      case Contents.account:
        return 4;
    }
  }
}
