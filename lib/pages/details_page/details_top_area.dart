import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import '../../provide/details_info.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<DetailsInfoProvide>(
      builder: (context, child, val){
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(2),
          child: Column(
            children: <Widget>[
              _goodsImage('http://images.baixingliangfan.cn/shopGoodsImg/20190116/20190116162618_2924.jpg'),
              _goodsName('可口可乐500ml/瓶'),
              _goodsNum('6928804011173'),
              _goodsPrice('2.70', '3.00')
            ],
          ),
        );
      },
    );
  }

  //商品图片
  Widget _goodsImage(url){
    return Image.network(
      url,
      width: ScreenUtil().setWidth(740),
    );
  }

  //商品名称
  Widget _goodsName(name){
    return Container(
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.only(left: 15),
      child: Text(
        name,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  //商品编号
  Widget _goodsNum(num){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 8),
      child: Text(
        '编号:${num}',
        style: TextStyle(
            color: Colors.black26
        ),
      )
    );
  }

  //商品价格方法
  Widget _goodsPrice(presentPrice,oriPrice){
    return Container(
      width: ScreenUtil().setWidth(730),
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: <Widget>[
          Text(
            '￥${presentPrice}',
            style: TextStyle(
              color: Colors.pinkAccent,
              fontSize: ScreenUtil().setSp(40),
            ),

          ),

          Text(
            '市场价:￥${oriPrice}',
            style: TextStyle(
                color: Colors.black26,
                decoration: TextDecoration.lineThrough,
          ),
          )
        ],
      ),
    );
  }
}
