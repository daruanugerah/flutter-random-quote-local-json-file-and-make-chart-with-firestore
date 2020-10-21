part of 'page.dart';

class ChartPage extends StatefulWidget {
  @override
  _ChartPageState createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  List<charts.Series<SalesModel, String>> _seriesBarData;
  List<SalesModel> salesData;

  _generateData(salesData) {
    _seriesBarData = List<charts.Series<SalesModel, String>>();
    _seriesBarData.add(charts.Series(
      domainFn: (SalesModel sales, _) => sales.saleYear.toString(),
      measureFn: (SalesModel sales, _) => sales.saleVal,
      colorFn: (SalesModel sales, _) =>
          charts.ColorUtil.fromDartColor(Color(int.parse(sales.colorVal))),
      id: "sales",
      data: salesData,
      labelAccessorFn: (SalesModel row, _) => "${row.saleYear}",
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Chart",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          iconSize: 30,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("sales").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        } else {
          List<SalesModel> sales = snapshot.data.docs
              .map((documentSnapshot) =>
                  SalesModel.fromMap(documentSnapshot.data()))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<SalesModel> sales) {
    salesData = sales;
    _generateData(salesData);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          children: [
            Text(
              "Thumbrand Sales by Year",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: charts.BarChart(
                _seriesBarData,
                animate: true,
                animationDuration: Duration(seconds: 3),
                behaviors: [                  
                  new charts.DatumLegend(
                      entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.gray.shadeDefault,                    
                    fontSize: 15,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
