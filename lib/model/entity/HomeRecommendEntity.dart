class HomeRecommendEntity {
  List<DataListBean> data;

  HomeRecommendEntity({this.data});

  HomeRecommendEntity.fromJson(Map<String, dynamic> json) {    
    this.data = (json['data'] as List)!=null?(json['data'] as List).map((i) => DataListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data != null?this.data.map((i) => i.toJson()).toList():null;
    return data;
  }

}

class DataListBean {
  String name;
  String image;
  String time;
  String webUrl;
  String videoUrl;
  AuthorBean author;
  List<ListListBean> list;

  DataListBean({this.name, this.image, this.time, this.webUrl, this.videoUrl, this.author, this.list});

  DataListBean.fromJson(Map<String, dynamic> json) {    
    this.name = json['name'];
    this.image = json['image'];
    this.time = json['time'];
    this.webUrl = json['webUrl'];
    this.videoUrl = json['videoUrl'];
    this.author = json['author'] != null ? AuthorBean.fromJson(json['author']) : null;
    this.list = (json['list'] as List)!=null?(json['list'] as List).map((i) => ListListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['time'] = this.time;
    data['webUrl'] = this.webUrl;
    data['videoUrl'] = this.videoUrl;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['list'] = this.list != null?this.list.map((i) => i.toJson()).toList():null;
    return data;
  }
}

class AuthorBean {
  String icon;
  String slogan;
  String title;

  AuthorBean({this.icon, this.slogan, this.title});

  AuthorBean.fromJson(Map<String, dynamic> json) {    
    this.icon = json['icon'];
    this.slogan = json['slogan'];
    this.title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['slogan'] = this.slogan;
    data['title'] = this.title;
    return data;
  }
}

class ListListBean {
  String title;
  String image;
  String time;

  ListListBean({this.title, this.image, this.time});

  ListListBean.fromJson(Map<String, dynamic> json) {    
    this.title = json['title'];
    this.image = json['image'];
    this.time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['time'] = this.time;
    return data;
  }
}
