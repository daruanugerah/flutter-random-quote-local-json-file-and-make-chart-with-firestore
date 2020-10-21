part of 'page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QuoteModel> quotes;
  var dataRange;
  var resultDataRange;
  Color colorRandom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorRandom,
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 25),
        padding: EdgeInsets.symmetric(vertical: 50),
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString("assets/quote.json"),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              quotes = parseJson(snapshot.data.toString());
              dataRange = new Random();
              resultDataRange = dataRange.nextInt(quotes.length);
              colorRandom = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
              return quoteCard(resultDataRange);
            }
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.refresh),
                iconSize: 50,
                tooltip: "Load Quote",
                onPressed: () {
                  setState(() {
                    dataRange = new Random();
                    resultDataRange = dataRange.nextInt(quotes.length);
                    colorRandom = Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.list),
                iconSize: 50,
                tooltip: "UI List",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListPage(),
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.show_chart),
                iconSize: 50,
                tooltip: "Chart",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChartPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<QuoteModel> parseJson(String response) {
    if (response == null) {
      return [];
    }

    final parsed =
        json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed
        .map<QuoteModel>((json) => new QuoteModel.fromJson(json))
        .toList();
  }

  Widget quoteCard(resultDataRange) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Thumbrand Quote",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 70,
        ),
        Text(
          '"' + quotes[resultDataRange].letter + '"',
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          quotes[resultDataRange].author,
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
