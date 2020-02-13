import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provide/provide.dart';
import '../provide/cart.dart';
import './cart_page/cart_item.dart';
import './cart_page/cart_bottom.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('购物车'),),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot){
          if(snapshot.hasData){
            List cartList = Provide.value<CartProvide>(context).cartList;

            return Stack(
              children: <Widget>[
                Provide<CartProvide>(
                  builder:(context, child, childCatgory){
                    cartList = Provide.value<CartProvide>(context).cartList;
                    return ListView.builder(itemBuilder: (context, index){
                      return CartItem(cartList[index]);
                    },
                      itemCount: cartList.length,
                    );
                  },
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                )
              ],
            );
          } else {
            return Text('正在加载');
          }
        },
      )
    );
  }

  Future<String> _getCartInfo(BuildContext context) async{
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}






