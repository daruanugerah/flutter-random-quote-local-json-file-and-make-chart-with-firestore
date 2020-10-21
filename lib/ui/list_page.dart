part of 'page.dart';

class ListPage extends StatelessWidget {
  final List<Map> items = [
    {
      "title": "THUMBRAND SERVICE",
      "detail1": r"$300",
      "detail2": "3mo",
      "detail3": "100%",
      "detail4": "See More >>"
    },
    {
      "title": "THUMBRAND SERVICE",
      "detail1": r"$300",
      "detail2": "3mo",
      "detail3": "100%",
      "detail4": "See More >>"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
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
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What would you like to search?",
              style: TextStyle(fontSize: 30, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 35,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          color: Colors.transparent,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 5,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 250,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                  offset: Offset(2, 3),
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    width:
                                        MediaQuery.of(context).size.width * 0.35,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          items[index]["title"],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(items[index]["detail1"]),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(items[index]["detail2"]),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(items[index]["detail3"]),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(items[index]["detail4"])
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 200,
                          width: 200,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 5,
                                  offset: Offset(2, 3),
                                )
                              ]),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
