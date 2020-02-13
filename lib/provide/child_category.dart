import 'package:flutter/material.dart';
import '../model/category.dart';

//ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier{

  List<BxMallSubDto> childCategoryList = [];
  int childIndex = 0;//子类高亮索引
  String categoryId = '4'; //大类ID
  String subId =''; //小类ID

  int page = 1; //列表页数
  String noMoreText = ""; //显示没有数据的文字

  getChildCategory(List<BxMallSubDto> list, String id){
    page = 1;
    noMoreText = '';
    //大类切换逻辑
    childIndex = 0;
    categoryId = id;


    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';

    childCategoryList = [all];
    childCategoryList.addAll(list);

    notifyListeners();
  }

  //改变子类索引
  changeChildIndex(index){
    page = 1;
    noMoreText = '';

    childIndex = index;
    notifyListeners();
  }

  //增加page的方法
  addPage(){
    page++;
    notifyListeners();
  }

  changeNoMore(String text){
    noMoreText = text;
    notifyListeners();
  }
}