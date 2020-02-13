import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import '../pages/details_page.dart';
import '../demo.dart';

Handler detailsHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params){
    String goodsId = params['id'].first;
    
    print('index>details goodsID is ${goodsId}');
    
    return DetailsPage(goodsId);

//    return Demo();
  }

);
