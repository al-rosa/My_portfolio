enum Section {
  top,
  aboutMe,
  aboutProductions,
  contact,
}

extension ContentsExtension on Section {
  String get title {
    switch (this) {
      case Section.top:
        return 'Top';
      case Section.aboutMe:
        return 'About me';
      case Section.aboutProductions:
        return 'About Productions';
      case Section.contact:
        return 'Contact';
    }
  }

  int get num {
    switch (this) {
      case Section.top:
        return 0;
      case Section.aboutMe:
        return 1;
      case Section.aboutProductions:
        return 2;
      case Section.contact:
        return 3;
    }
  }
}
