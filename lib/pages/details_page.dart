import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../provide/details_info.dart';
import './details_page/details_top_area.dart';
import './details_page/details_explain.dart';
import './details_page/details_tabbar.dart';
import './details_page/details_web.dart';
import './details_page/details_bottom.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;

  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
//    _getBackInfo(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);//返回上一级
          },
        ),
        title: Text('商品详情'),
      ),

      body: Stack(
        children: <Widget>[
          Container(
            child: ListView(
              children: <Widget>[
                DetailsTopArea(),
                DetailsExplain(),
                DetailsTabBar(),
                DetailWeb()
              ],
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            child: DetailsBottom(),
          )
        ],
      )



    );
  }
//
//    _getBackInfo(BuildContext context){
//     Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
//    print( '完成加载');
//  }
}