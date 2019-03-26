class HomeFind {
  String name;
  String alias;
  String description;
  String bgPicture;
  String bgColor;
  String headerImage;
  int id;
  int defaultAuthorId;
  int tagId;

  HomeFind(
      {this.name,
      this.alias,
      this.description,
      this.bgPicture,
      this.bgColor,
      this.headerImage,
      this.id,
      this.defaultAuthorId,
      this.tagId});

  HomeFind.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.alias = json['alias'];
    this.description = json['description'];
    this.bgPicture = json['bgPicture'];
    this.bgColor = json['bgColor'];
    this.headerImage = json['headerImage'];
    this.id = json['id'];
    this.defaultAuthorId = json['defaultAuthorId'];
    this.tagId = json['tagId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['description'] = this.description;
    data['bgPicture'] = this.bgPicture;
    data['bgColor'] = this.bgColor;
    data['headerImage'] = this.headerImage;
    data['id'] = this.id;
    data['defaultAuthorId'] = this.defaultAuthorId;
    data['tagId'] = this.tagId;
    return data;
  }
}

final List<HomeFind> homeFindList = [
  HomeFind(
      name: "广告",
      description: "为广告人的精彩创意点赞",
      bgPicture:
          "http://img.kaiyanapp.com/57472e13fd2b6c9655c8a600597daf4d.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "剧情",
      description: "用一个好故事，描绘生活的不可思议",
      bgPicture:
          "http://img.kaiyanapp.com/afa27b9c52d2ed2f5f8b5f8c12992fcf.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "运动",
      description: "冲浪、滑板、跑酷、骑行，生命停不下来",
      bgPicture:
          "http://img.kaiyanapp.com/afa27b9c52d2ed2f5f8b5f8c12992fcf.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "创意",
      description: "技术与审美结合，探索视觉的无限可能",
      bgPicture:
          "http://img.kaiyanapp.com/727bd34a770ba32dd2b7fa225df0cd9b.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "旅行",
      description: "发现世界的奇妙和辽阔",
      bgPicture:
          "http://img.kaiyanapp.com/0f3513fdfb72434b3a74ccb157406f54.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "影视",
      description: "电影、剧集、戏剧抢先看",
      bgPicture:
          "http://img.kaiyanapp.com/f4bf4df0e077ffa6e9c5f90ce40a6f53.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "记录",
      description: "告诉他们为什么与众不同",
      bgPicture:
          "http://img.kaiyanapp.com/936e0c299688eb88c5ba593a971c7abf.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "音乐",
      description: "汇聚全球最新、最优质的音乐视频",
      bgPicture:
          "http://img.kaiyanapp.com/33cc30cf40de3288a8862d12e7dbd674.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "科技",
      description: "每天获得新知识",
      bgPicture:
          "http://img.kaiyanapp.com/1da6527c7300b7766def87a585952295.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "开胃",
      description: "眼球和味蕾，一个都不放过",
      bgPicture:
          "http://img.kaiyanapp.com/37301e88af9a789e41b89af35aaa77f2.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "游戏",
      description: "欢迎来到惊险刺激的新世界",
      bgPicture:
          "http://img.kaiyanapp.com/fd5691e646f9de718a817b8d202b1e1c.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "动画",
      description: "有趣的人永远不缺童心",
      bgPicture:
          "http://img.kaiyanapp.com/68fe1a141a27df721496c6711370b1cc.png?imageMogr2/quality/60/format/jpg"),
];

final List<HomeFind> homeFindList1 = [
  HomeFind(
      name: "开眼周末计划",
      description: "你的周末指南",
      bgPicture:
          "http://img.kaiyanapp.com/64f2b2ed039bd92c3be10d003d6041bf.jpeg?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "开眼专题策划",
      description: "潮骚",
      bgPicture:
          "http://img.kaiyanapp.com/c4daeee307e8efca77e095faaf5a5ab9.png?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "开眼榜单",
      description: "最热的都在这",
      bgPicture:
          "http://img.kaiyanapp.com/9623d26752a5897f4e8fc7beab673da0.jpeg?imageMogr2/quality/100"),
  HomeFind(
      name: "开眼社区",
      description: "交到酷朋友",
      bgPicture:
          "http://img.kaiyanapp.com/e1dc184aec1d67c74fb38c93f0c884d9.png?imageMogr2/quality/60/format/jpg"),
];

final List<HomeFind> homeFindList2 = [
  HomeFind(
      name: "#Vlog",
      description: "用视频记录你的精彩生活",
      bgPicture:
          "http://img.kaiyanapp.com/67025fb5bf4f8ff4ccd63cdcfd0cd6c6.jpeg?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "#摄影师日常",
      description: "透过镜头，我看到了更加真实的世界",
      bgPicture:
          "http://img.kaiyanapp.com/56a8818adb038c59ab04ffc781db2f50.jpeg?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "#一起追高分剧",
      description: "美剧英剧日剧...追剧爱好者们快来...",
      bgPicture:
          "http://img.kaiyanapp.com/afb9e7d7f061d10ade5ebcb524dc8679.jpeg?imageMogr2/quality/60/format/jpg"),
  HomeFind(
      name: "#一句话哲学",
      description: "今天又有了一些新的思考",
      bgPicture:
          "http://img.kaiyanapp.com/2c869d91d5db6ecf1c8c46af0f448719.png?imageMogr2/quality/60/format/jpg"),
];

final List<HomeFind> homeFindHeaderDatas = [
  HomeFind(bgPicture: "http://img.kaiyanapp.com/beb70d42f56acc9ce4565e7e68292411.jpeg?imageMogr2/quality/60/format/jpg"),
  HomeFind(bgPicture: "http://img.kaiyanapp.com/feaf6237dbb62bba787e01d1cc1af131.jpeg?imageMogr2/quality/60/format/jpg"),
  HomeFind(bgPicture: "http://img.kaiyanapp.com/20e5097462c5d9badcd5747e258d76d9.jpeg?imageMogr2/quality/60/format/jpg"),
  HomeFind(bgPicture: "http://img.kaiyanapp.com/5fe6afc957d5bb87d2234055ecaf78fc.jpeg?imageMogr2/quality/60/format/jpg"),
  HomeFind(bgPicture: "http://img.kaiyanapp.com/8accfe3b083061609326f2c9fa6e6016.jpeg?imageMogr2/quality/60/format/jpg"),
];