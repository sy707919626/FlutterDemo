import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes{
  static String root = '/'; //根目录
  static String detailPages = '/aaaa'; //

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
      handlerFunc: (BuildContext context, Map<String , List<String>> params){
        print('Error ==> 没找到这个页面路由!!!!!!');
      }
    );

    router.define(detailPages, handler: detailsHandler);
  }
}