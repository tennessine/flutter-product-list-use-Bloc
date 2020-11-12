class GoodListModel {
  String code;
  String message;
  List<GoodModel> data;

  GoodListModel(this.data);

  GoodListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = List<GoodModel>();
      json['data'].forEach((v) {
        data.add(GoodModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GoodModel {
  String image;
  double oriPrice;
  double presetPrice;
  String name;
  String goodsId;

  GoodModel({
    this.image,
    this.oriPrice,
    this.presetPrice,
    this.name,
    this.goodsId,
  });

  GoodModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = double.parse(json['oriPrice'].toString());
    presetPrice = double.parse(json['presetPrice'].toString());
    name = json['name'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    data['oriPrice'] = oriPrice;
    data['presetPrice'] = presetPrice;
    data['name'] = name;
    data['goodsId'] = goodsId;
    return data;
  }
}
