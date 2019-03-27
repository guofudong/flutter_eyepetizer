/// 首页-发现tab item详情header数据实体类
class HomeFindDetailEntity {
  String name;
  String desc;
  String headerImage;
  int collectionCount;
  int shareCount;

  HomeFindDetailEntity(
      {this.name,
      this.desc,
      this.headerImage,
      this.collectionCount,
      this.shareCount});

  HomeFindDetailEntity.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.desc = json['desc'];
    this.headerImage = json['headerImage'];
    this.collectionCount = json['collectionCount'];
    this.shareCount = json['shareCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['headerImage'] = this.headerImage;
    data['collectionCount'] = this.collectionCount;
    data['shareCount'] = this.shareCount;
    return data;
  }
}
