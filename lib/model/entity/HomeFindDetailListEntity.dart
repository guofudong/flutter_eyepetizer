class HomeFindDetailListEntity {
  List<DataListBean> data;

  HomeFindDetailListEntity({this.data});

  HomeFindDetailListEntity.fromJson(Map<String, dynamic> json) {
    this.data = (json['data'] as List) != null
        ? (json['data'] as List).map((i) => DataListBean.fromJson(i)).toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] =
        this.data != null ? this.data.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class DataListBean {
  String name;
  String title;
  String desc;
  String icon;
  String playUrl;
  List<String> tags;

  DataListBean(
      {this.name, this.title, this.desc, this.icon, this.playUrl, this.tags});

  DataListBean.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.title = json['title'];
    this.desc = json['desc'];
    this.icon = json['icon'];
    this.playUrl = json['playUrl'];

    List<dynamic> tagsList = json['tags'];
    this.tags = new List();
    this.tags.addAll(tagsList.map((o) => o.toString()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['icon'] = this.icon;
    data['playUrl'] = this.playUrl;
    data['tags'] = this.tags;
    return data;
  }
}
