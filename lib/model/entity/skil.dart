class Skil {
  Skil({
    required this.title,
    required this.level,
    required this.text,
    required this.isEngineering,
  });

  final String title;
  final int level;
  final String text;
  final bool isEngineering;
}

final List<Skil> skils = [
  Skil(
    title: "Flutter",
    level: 4,
    text: "個人アプリのリリースや、ネイティブアプリやWebアプリの業務に関わらさせていただきました。",
    isEngineering: true,
  ),
  Skil(
    title: "React",
    level: 1,
    text: "短期間ではありますが、すでにリリースされているWebアプリの制作に携わりました。",
    isEngineering: true,
  ),
  Skil(
    title: "Python",
    level: 1,
    text: "Line Botを作成した際に用いました。",
    isEngineering: true,
  ),
  Skil(
    title: "Figma",
    level: 4,
    text: "Line Botを作成した際に用いました。",
    isEngineering: false,
  ),
  Skil(
    title: "graphic",
    level: 1,
    text: "個人アプリのリリースや、ネイティブアプリやWebアプリの業務に関わらさせていただきました。",
    isEngineering: false,
  ),
];
