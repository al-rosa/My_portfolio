class Production {
  Production({
    required this.title,
    required this.architecture,
    required this.detail,
    required this.image,
  });

 final String title;
 final List<String> architecture;
 final String detail;
 final  String image;
}

final List<Production> productions = [
  Production(
    title: 'pairium(Native App)',
    image: "cat.png",
    architecture: ["Flutter(dart)", "Firebase"],
    detail:
        " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
  ),
  Production(
    title: '日報警察(Line Bot)',
    image: "cat.png",
    architecture: ["Gas(JavaScript)", "LINE Messaging API", "Open AI API"],
    detail:
        " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
  ),
  Production(
    title: 'MissingCatLog(Web Page)',
    image: "cat.png",
    architecture: ["WordPress"],
    detail:
        " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
  ),
  Production(
    title: 'お花屋さんの予約管理システム',
    image: "cat.png",
    architecture: ["Gas(JavaScript)", "LINE Messaging API", "Open AI API"],
    detail:
        " 日報警察さんが、日報をチェックしてくれるLine Bot。主な機能は、「日報を送信していない人のカウント」、「日報に対して気まぐれで返事」。Open AIのAPIを試したくて制作に当たった。ユーザから送られたメッセージをMessaging APIが受け取り、Gasで処理を行う。GasからOpen AI APIをリクエストしている。",
  ),
];

