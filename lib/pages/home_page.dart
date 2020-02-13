import 'package:flutter/material.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../router/application.dart';


class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  int page =1;
  List<Map> hotGoodsList = [];

  GlobalKey<RefreshFooterState> _footerKey = new GlobalKey<RefreshFooterState>();

  GlobalKey<RefreshHeaderState> _headerKey = new GlobalKey<RefreshHeaderState>();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  String homePageContent='正在获取数据';

  @override
  void initState() {
    var formData = {'lon':'115.02932','lat':'35.76189'};
    request('homePageContext', formData:formData).then((val){
      setState(() {
        homePageContent = val.toString();
      });
    });

//    _getHotGoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List aa = new List();
    aa..add('https://img.51miz.com/preview/element/00/01/09/21/E-1092118-5E096973.jpg!/quality/90/unsharp/true/compress/true/format/jpg')
    ..add('https://img.51miz.com/Element/00/59/37/99/72865aa5_E593799_1e37e7af.jpg!/quality/90/unsharp/true/compress/true/format/jpg')
    ..add('https://img.51miz.com/Element/00/59/62/00/db8a4145_E596200_61068ef4.jpg!/quality/90/unsharp/true/compress/true/format/jpg');

    List<topNaivgator> bb = new List();
    bb..add(new topNaivgator('https://gw.alicdn.com/tfs/TB1qwMMObrpK1RjSZTEXXcWAVXa-183-144.png?getAvatar=1', '天猫'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB1LvIxVAvoK1RjSZFDXXXY3pXa-183-144.png?getAvatar=1', '聚美'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB19uWKXkCy2eVjSZPfXXbdgpXa-183-144.png?getAvatar=1', '国际'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB1DaMyVpzqK1RjSZFoXXbfcXXa-185-144.png?getAvatar=1', '饿了'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB1FucwVwHqK1RjSZFgXXa7JXXa-183-144.png?getAvatar=1', '超市'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB1nBktVxTpK1RjSZR0XXbEwXXa-183-144.png?getAvatar=1', '分类'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB1fcOKXkCy2eVjSZSyXXXukVXa-183-144.png?getAvatar=1', '美食'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB1tikBVAPoK1RjSZKbXXX1IXXa-183-144.png?getAvatar=1', '健康'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB1h1MnVCrqK1RjSZK9XXXyypXa-183-144.png?getAvatar=1', '口碑'))
      ..add(new topNaivgator('https://gw.alicdn.com/tfs/TB11tFkr7L0gK0jSZFxXXXWHVXa-183-144.png?getAvatar=1', '土货'));


    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),

//      body: FutureBuilder( //解决异步请求渲染
//        future: getHomePageContent(),
//        builder: (context, snapshot){
//          if(snapshot.hasData){
//            var data = json.decode(snapshot.data.toString());
//            List<Map> swiper = (data['data']['slides'] as List).cast();
//            return Column(
//              children: <Widget>[
//                SwiperDiy(swiperDateList:swiper)
//              ],
//            );
//          } else {
//            return Center(
//              child: Text('加载中....'),
//            );
//          }
//        },
//      ),

      body: EasyRefresh(
        child:ListView(
          children: <Widget>[
            SwiperDiy(swiperDateList: aa),
            TopNavigator(navigatorList: bb),
            AdBanner(adPicture: 'https://img.alicdn.com/tfs/TB1V2eQrKSSBuNjy0FlXXbBpVXa-966-114.png',),

            LeaderPhone(leaderImage: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578052593945&di=e1319167b1640ac2eb0bce805257a9c2&imgtype=0&src=http%3A%2F%2Fpic46.nipic.com%2F20140821%2F18278037_150446166366_2.jpg', leaderPhone: '5465465464'),


            _hotGoods(),
          ],
        ),

        loadMore: ()async{
          print('加载更多');
          var formData = {'page' :page};
          request('homePageBelowConten', formData:formData).then((val){
            var data = json.decode(val.toString());
            List<Map> newGoodsList = (data['data']as List).cast();
            setState(() {
              hotGoodsList.addAll(newGoodsList);
              page++;
            });
          });
        },

        onRefresh: () async{
          print('刷新数据');
        },

        refreshFooter: ClassicsFooter(
          key: _footerKey,
          bgColor:Colors.white,
          textColor: Colors.pink,
          moreInfoColor: Colors.pink,
          showMore: true,
          noMoreText: '',
          moreInfo: '加载中',
          loadReadyText:'上拉加载....'
        ),

        refreshHeader: ClassicsHeader(
            key: _headerKey,
            bgColor:Colors.white,
            textColor: Colors.pink,
            moreInfoColor: Colors.pink,
            showMore: true,
            moreInfo: '加载中',
            refreshReadyText: '刷新数据',
        ),
      ),
    );
  }



  Widget hotTitle = Container(
    margin: EdgeInsets.only(top: 10),
    alignment: Alignment.center,
    color: Colors.transparent,
    padding: EdgeInsets.all(5),
    child: Text('火爆专区'),
  );

  Widget _wrapList(){
    if(hotGoodsList.length != 0){
      List<Widget> listWidget = hotGoodsList.map((val){
        return InkWell(
          child: Container(
            width: ScreenUtil().setWidth(372),
            color: Colors.white,
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(bottom: 3),
            child: Column(
              children: <Widget>[
                Image.network('', width: ScreenUtil().setWidth(370)),
                Text(
                  val['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.pink, fontSize: ScreenUtil().setSp(26)),
                ),
                Row(
                  children: <Widget>[
                    Text('￥1212'),
                    Text(
                      '￥1223',
                      style: TextStyle(color: Colors.black26,
                          decoration: TextDecoration.lineThrough),
                    )
                  ],
                )
              ],
            ),
          ),
          onTap: (){
            Application.router.navigateTo(context,"/detail?id=${val['goodsId']}");
          },
        );
      }).toList();

      return Wrap(
        spacing: 2,
        children: listWidget,
      );
    } else {
      return Text('');
    }
  }

  Widget _hotGoods(){
    return Container(
      child: Column(
        children: <Widget>[
          hotTitle,
          _wrapList()
        ],
      ),
    );
  }
}

//首页轮播组件
class SwiperDiy extends StatelessWidget {
  final List swiperDateList;

  SwiperDiy({Key key, this.swiperDateList}):super(key:key);
//  SwiperDiy({this.swiperDateList});

  @override
  Widget build(BuildContext context) {

    print('${ScreenUtil.screenHeight}');

    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setHeight(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index){

          return InkWell(
            onTap: (){},
            child: Image.network('${swiperDateList[index]}'),
          );
        },

        itemCount: swiperDateList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

//导航图标
class TopNavigator extends StatelessWidget {
  final List<topNaivgator> navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context, topNaivgator aa){
    return InkWell(

      onTap: (){Application.router.navigateTo(context,"/aaaa?id=aaaazzzz}");},

      child: Column(

        children: <Widget>[
          Image.network(aa.imagePath, width: ScreenUtil().setHeight(95)),
          Text(aa.name)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3),
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(5),
        children: <Widget>[
          _gridViewItemUI(context, navigatorList[0]),
          _gridViewItemUI(context, navigatorList[1]),
          _gridViewItemUI(context, navigatorList[2]),
          _gridViewItemUI(context, navigatorList[3]),
          _gridViewItemUI(context, navigatorList[4]),
          _gridViewItemUI(context, navigatorList[5]),
          _gridViewItemUI(context, navigatorList[6]),
          _gridViewItemUI(context, navigatorList[7]),
          _gridViewItemUI(context, navigatorList[8]),
          _gridViewItemUI(context, navigatorList[9]),
        ],
      ),
    );
  }
}

class topNaivgator{
  String imagePath;
  String name;

  topNaivgator(this.imagePath, this.name);

}

//广告图片
class AdBanner extends StatelessWidget {
  final String adPicture;

  const AdBanner({Key key, this.adPicture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: Image.network(adPicture, width: 200,),
      alignment: Alignment.center,
      height: 50,
      width: 750,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10)
    );
  }
}

//电话模块
class LeaderPhone extends StatelessWidget {
  final String leaderImage;
  final String leaderPhone;

  const LeaderPhone({Key key, this.leaderImage, this.leaderPhone}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,

        child: Image.network(leaderImage)
      ),
    );
  }

  void _launchURL() async{
    String url = 'tel:' + leaderPhone;
    if(await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

//商品推荐类
class Recommend extends StatelessWidget {
  final List recommendList;

  const Recommend({Key key, this.recommendList}) : super(key: key);

  //标题方法
  Widget _titleWidget(){
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10, 2, 0, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 0.5, color: Colors.black12)
        )
      ),

      child: Text('商品推荐',
        style: TextStyle(color: Colors.pink)),
    );
  }

  //横向列表方法
  Widget _recommedList(){
    return Container(
      height: ScreenUtil().setHeight(330),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index){
          return _item(index);
        },
      ),
    );
  }

  //商品单独项方法
  Widget _item(int index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(width: 0.5, color: Colors.white12),
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text('￥${recommendList[index]['mallPrice']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough, //删除线
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(380),
      margin: EdgeInsets.only(top: 10),
      child: Column(
          children: <Widget>[
            _titleWidget(),
            _recommedList(),
          ],
      ),
    );
  }
}

//楼层标题
class FloorTitle extends StatelessWidget {
  final String picture_address;

  const FloorTitle({Key key, this.picture_address}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Image.network(picture_address),
    );
  }
}

//楼层商品列表
class FloorContent extends StatelessWidget {
  final List floorGoodsList;

  const FloorContent({Key key, this.floorGoodsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods()
        ],
      ),
    );
  }

  Widget _firstRow(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
            _goodsItem(floorGoodsList[1]),
            _goodsItem(floorGoodsList[2])
          ],
        )
      ],
    );
  }

  Widget _otherGoods(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[4]),
        _goodsItem(floorGoodsList[5])
      ],
    );
  }

  Widget _goodsItem(Map goods){
    return Container(
      width: ScreenUtil().setWidth(375),
      child: InkWell(
        onTap: (){print('点击了楼层商品');},
        child: Image.network(''),
      ),
    );
  }
}


