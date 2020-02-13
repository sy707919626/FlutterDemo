class DetailsModel{
  String _code;
  String _message;
  DetailsGoodsData _data;

  DetailsModel({String code, String message, DetailsGoodsData data}) {
    this._code = code;
    this._message = message;
    this._data = data;
  }

  String get code => _code;
  set code(String code) => _code = code;
  String get message => _message;
  set message(String message) => _message = message;
  DetailsGoodsData get data => _data;
  set data(DetailsGoodsData data) => _data = data;

  DetailsModel.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? new DetailsGoodsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this._code;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data.toJson();
    }
    return data;
  }
}

class DetailsGoodsData {
  GoodInfo _goodInfo;
  List<GoodComments> _goodComments;
  AdvertesPicture _advertesPicture;

  DetailsGoodsData(
      {GoodInfo goodInfo,
        List<GoodComments> goodComments,
        AdvertesPicture advertesPicture}) {
    this._goodInfo = goodInfo;
    this._goodComments = goodComments;
    this._advertesPicture = advertesPicture;
  }

  GoodInfo get goodInfo => _goodInfo;
  set goodInfo(GoodInfo goodInfo) => _goodInfo = goodInfo;
  List<GoodComments> get goodComments => _goodComments;
  set goodComments(List<GoodComments> goodComments) =>
      _goodComments = goodComments;
  AdvertesPicture get advertesPicture => _advertesPicture;
  set advertesPicture(AdvertesPicture advertesPicture) =>
      _advertesPicture = advertesPicture;

  DetailsGoodsData.fromJson(Map<String, dynamic> json) {
    _goodInfo = json['goodInfo'] != null
        ? new GoodInfo.fromJson(json['goodInfo'])
        : null;
    if (json['goodComments'] != null) {
      _goodComments = new List<GoodComments>();
      json['goodComments'].forEach((v) {
        _goodComments.add(new GoodComments.fromJson(v));
      });
    }
    _advertesPicture = json['advertesPicture'] != null
        ? new AdvertesPicture.fromJson(json['advertesPicture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._goodInfo != null) {
      data['goodInfo'] = this._goodInfo.toJson();
    }
    if (this._goodComments != null) {
      data['goodComments'] = this._goodComments.map((v) => v.toJson()).toList();
    }
    if (this._advertesPicture != null) {
      data['advertesPicture'] = this._advertesPicture.toJson();
    }
    return data;
  }
}

class GoodInfo {
  String _image5;
  int _amount;
  String _image3;
  String _image4;
  String _goodsId;
  String _isOnline;
  String _image1;
  String _image2;
  String _goodsSerialNumber;
  double _oriPrice;
  double _presentPrice;
  String _comPic;
  int _state;
  String _shopId;
  String _goodsName;
  String _goodsDetail;

  GoodInfo(
      {String image5,
        int amount,
        String image3,
        String image4,
        String goodsId,
        String isOnline,
        String image1,
        String image2,
        String goodsSerialNumber,
        double oriPrice,
        double presentPrice,
        String comPic,
        int state,
        String shopId,
        String goodsName,
        String goodsDetail}) {
    this._image5 = image5;
    this._amount = amount;
    this._image3 = image3;
    this._image4 = image4;
    this._goodsId = goodsId;
    this._isOnline = isOnline;
    this._image1 = image1;
    this._image2 = image2;
    this._goodsSerialNumber = goodsSerialNumber;
    this._oriPrice = oriPrice;
    this._presentPrice = presentPrice;
    this._comPic = comPic;
    this._state = state;
    this._shopId = shopId;
    this._goodsName = goodsName;
    this._goodsDetail = goodsDetail;
  }

  String get image5 => _image5;
  set image5(String image5) => _image5 = image5;
  int get amount => _amount;
  set amount(int amount) => _amount = amount;
  String get image3 => _image3;
  set image3(String image3) => _image3 = image3;
  String get image4 => _image4;
  set image4(String image4) => _image4 = image4;
  String get goodsId => _goodsId;
  set goodsId(String goodsId) => _goodsId = goodsId;
  String get isOnline => _isOnline;
  set isOnline(String isOnline) => _isOnline = isOnline;
  String get image1 => _image1;
  set image1(String image1) => _image1 = image1;
  String get image2 => _image2;
  set image2(String image2) => _image2 = image2;
  String get goodsSerialNumber => _goodsSerialNumber;
  set goodsSerialNumber(String goodsSerialNumber) =>
      _goodsSerialNumber = goodsSerialNumber;
  double get oriPrice => _oriPrice;
  set oriPrice(double oriPrice) => _oriPrice = oriPrice;
  double get presentPrice => _presentPrice;
  set presentPrice(double presentPrice) => _presentPrice = presentPrice;
  String get comPic => _comPic;
  set comPic(String comPic) => _comPic = comPic;
  int get state => _state;
  set state(int state) => _state = state;
  String get shopId => _shopId;
  set shopId(String shopId) => _shopId = shopId;
  String get goodsName => _goodsName;
  set goodsName(String goodsName) => _goodsName = goodsName;
  String get goodsDetail => _goodsDetail;
  set goodsDetail(String goodsDetail) => _goodsDetail = goodsDetail;

  GoodInfo.fromJson(Map<String, dynamic> json) {
    _image5 = json['image5'];
    _amount = json['amount'];
    _image3 = json['image3'];
    _image4 = json['image4'];
    _goodsId = json['goodsId'];
    _isOnline = json['isOnline'];
    _image1 = json['image1'];
    _image2 = json['image2'];
    _goodsSerialNumber = json['goodsSerialNumber'];
    _oriPrice = json['oriPrice'];
    _presentPrice = json['presentPrice'];
    _comPic = json['comPic'];
    _state = json['state'];
    _shopId = json['shopId'];
    _goodsName = json['goodsName'];
    _goodsDetail = json['goodsDetail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image5'] = this._image5;
    data['amount'] = this._amount;
    data['image3'] = this._image3;
    data['image4'] = this._image4;
    data['goodsId'] = this._goodsId;
    data['isOnline'] = this._isOnline;
    data['image1'] = this._image1;
    data['image2'] = this._image2;
    data['goodsSerialNumber'] = this._goodsSerialNumber;
    data['oriPrice'] = this._oriPrice;
    data['presentPrice'] = this._presentPrice;
    data['comPic'] = this._comPic;
    data['state'] = this._state;
    data['shopId'] = this._shopId;
    data['goodsName'] = this._goodsName;
    data['goodsDetail'] = this._goodsDetail;
    return data;
  }
}

class GoodComments {
  int _sCORE;
  String _comments;
  String _userName;
  int _discussTime;

  GoodComments({int sCORE, String comments, String userName, int discussTime}) {
    this._sCORE = sCORE;
    this._comments = comments;
    this._userName = userName;
    this._discussTime = discussTime;
  }

  int get sCORE => _sCORE;
  set sCORE(int sCORE) => _sCORE = sCORE;
  String get comments => _comments;
  set comments(String comments) => _comments = comments;
  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  int get discussTime => _discussTime;
  set discussTime(int discussTime) => _discussTime = discussTime;

  GoodComments.fromJson(Map<String, dynamic> json) {
    _sCORE = json['SCORE'];
    _comments = json['comments'];
    _userName = json['userName'];
    _discussTime = json['discussTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SCORE'] = this._sCORE;
    data['comments'] = this._comments;
    data['userName'] = this._userName;
    data['discussTime'] = this._discussTime;
    return data;
  }
}

class AdvertesPicture {
  String _pICTUREADDRESS;
  String _tOPLACE;

  AdvertesPicture({String pICTUREADDRESS, String tOPLACE}) {
    this._pICTUREADDRESS = pICTUREADDRESS;
    this._tOPLACE = tOPLACE;
  }

  String get pICTUREADDRESS => _pICTUREADDRESS;
  set pICTUREADDRESS(String pICTUREADDRESS) => _pICTUREADDRESS = pICTUREADDRESS;
  String get tOPLACE => _tOPLACE;
  set tOPLACE(String tOPLACE) => _tOPLACE = tOPLACE;

  AdvertesPicture.fromJson(Map<String, dynamic> json) {
    _pICTUREADDRESS = json['PICTURE_ADDRESS'];
    _tOPLACE = json['TO_PLACE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PICTURE_ADDRESS'] = this._pICTUREADDRESS;
    data['TO_PLACE'] = this._tOPLACE;
    return data;
  }
}