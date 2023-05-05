enum Contents {
  top,
  aboutMe,
  aboutProductions,
  contact,
}

extension ContentsExtension on Contents {
  String get title {
    switch (this) {
      case Contents.top:
        return 'Top';
      case Contents.aboutMe:
        return 'About me';
      case Contents.aboutProductions:
        return 'About Productions';
      case Contents.contact:
        return 'Contact';
    }
  }

  int get num {
    switch (this) {
      case Contents.top:
        return 0;
      case Contents.aboutMe:
        return 1;
      case Contents.aboutProductions:
        return 2;
      case Contents.contact:
        return 3;
    }
  }
}
