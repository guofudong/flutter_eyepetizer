///首页-发现-日报数据类
class HomeDailyEntity {
  String nextPageUrl;
  String dialog;
  String topIssue;
  bool adExist;
  int count;
  int total;
  int refreshCount;
  int lastStartId;
  num date;
  num nextPublishTime;
  List<ItemListListBean> itemList;

  HomeDailyEntity({this.nextPageUrl, this.dialog, this.topIssue, this.adExist, this.count, this.total, this.refreshCount, this.lastStartId, this.date, this.nextPublishTime, this.itemList});

  HomeDailyEntity.fromJson(Map<String, dynamic> json) {
    this.nextPageUrl = json['nextPageUrl'];
    this.dialog = json['dialog'];
    this.topIssue = json['topIssue'];
    this.adExist = json['adExist'];
    this.count = json['count'];
    this.total = json['total'];
    this.refreshCount = json['refreshCount'];
    this.lastStartId = json['lastStartId'];
    this.date = json['date'];
    this.nextPublishTime = json['nextPublishTime'];
    this.itemList = (json['itemList'] as List)!=null?(json['itemList'] as List).map((i) => ItemListListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nextPageUrl'] = this.nextPageUrl;
    data['dialog'] = this.dialog;
    data['topIssue'] = this.topIssue;
    data['adExist'] = this.adExist;
    data['count'] = this.count;
    data['total'] = this.total;
    data['refreshCount'] = this.refreshCount;
    data['lastStartId'] = this.lastStartId;
    data['date'] = this.date;
    data['nextPublishTime'] = this.nextPublishTime;
    data['itemList'] = this.itemList != null?this.itemList.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class ItemListListBean {
  String type;
  String tag;
  int id;
  int adIndex;
  DataBean data;

  ItemListListBean({this.type, this.tag, this.id, this.adIndex, this.data});

  ItemListListBean.fromJson(Map<String, dynamic> json) {
    this.type = json['type'];
    this.tag = json['tag'];
    this.id = json['id'];
    this.adIndex = json['adIndex'];
    this.data = json['data'] != null ? DataBean.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['tag'] = this.tag;
    data['id'] = this.id;
    data['adIndex'] = this.adIndex;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class DataBean {
  String title;
  String category;
  String playUrl;
  int duration;
  AuthorBean author;
  CoverBean cover;
  WebUrlBean webUrl;

  DataBean({this.title, this.category, this.playUrl, this.duration, this.author, this.cover, this.webUrl});

  DataBean.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.category = json['category'];
    this.playUrl = json['playUrl'];
    this.duration = json['duration'];
    this.author = json['author'] != null ? AuthorBean.fromJson(json['author']) : null;
    this.cover = json['cover'] != null ? CoverBean.fromJson(json['cover']) : null;
    this.webUrl = json['webUrl'] != null ? WebUrlBean.fromJson(json['webUrl']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['category'] = this.category;
    data['playUrl'] = this.playUrl;
    data['duration'] = this.duration;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.cover != null) {
      data['cover'] = this.cover.toJson();
    }
    if (this.webUrl != null) {
      data['webUrl'] = this.webUrl.toJson();
    }
    return data;
  }

}

class AuthorBean {
  String icon;
  String name;

  AuthorBean({this.icon, this.name});

  AuthorBean.fromJson(Map<String, dynamic> json) {
    this.icon = json['icon'];
    this.name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['name'] = this.name;
    return data;
  }
}

class CoverBean {
  String feed;

  CoverBean({this.feed});

  CoverBean.fromJson(Map<String, dynamic> json) {
    this.feed = json['feed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feed'] = this.feed;
    return data;
  }
}

class WebUrlBean {
  String raw;

  WebUrlBean({this.raw});

  WebUrlBean.fromJson(Map<String, dynamic> json) {
    this.raw = json['raw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    return data;
  }
}
