import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/models/good_list_model.dart';
import 'package:flutter_app/services/http_service.dart';

class GoodListPage extends StatefulWidget {
  @override
  _GoodListPageState createState() => _GoodListPageState();
}

class _GoodListPageState extends State<GoodListPage> {
  GoodListModel goodsList = GoodListModel([]);
  ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    getGoods();
  }

  @override
  Widget build(BuildContext context) {
    if (goodsList.data.length > 0) {
      return ListView.builder(
        itemCount: goodsList.data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1.0,
                  color: Colors.black12,
                ),
              ),
            ),
            child: Row(
              children: [
                _goodsImage(goodsList.data, index),
                SizedBox(width: 10),
                Column(
                  children: [
                    _goodsName(goodsList.data, index),
                    _goodsPrice(goodsList.data, index),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
    return Container();
  }

  void getGoods() async {
    var url = 'https://gekongfei.cn/test';
    var formData = {'shopId': '001'};

    request(url, formData: formData).then((value) {
      var data = jsonDecode(value.toString());
      setState(() {
        goodsList = GoodListModel.fromJson(data);
      });
    });
  }

  Widget _goodsImage(List<GoodModel> data, int index) {
    return Container(
      width: 150,
      height: 150,
      child: Image.network(data[index].image),
    );
  }

  _goodsName(List<GoodModel> data, int index) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 200,
      child: Text(
        data[index].name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  _goodsPrice(List<GoodModel> data, int index) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      width: 200.0,
      child: Row(
        children: [
          Text('价格：¥ ${data[index].presetPrice}'),
          Text('¥ ${data[index].oriPrice}'),
        ],
      ),
    );
  }
}
