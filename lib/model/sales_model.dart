class SalesModel {
  final String colorVal;
  final int saleVal;
  final String saleYear;

  SalesModel(this.colorVal, this.saleVal, this.saleYear);

  SalesModel.fromMap(Map<String, dynamic> map)
      : assert(map["colorVal"] != null),
        assert(map["saleVal"] != null),
        assert(map["saleYear"] != null),
        colorVal = map["colorVal"],
        saleVal = map["saleVal"],
        saleYear = map["saleYear"];

  @override
  String toString() => "Record<$colorVal:$saleVal:$saleYear>";
}
