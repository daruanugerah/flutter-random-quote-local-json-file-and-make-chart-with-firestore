class QuoteModel {
  final String letter;
  final String author;

  QuoteModel({this.letter, this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return new QuoteModel(
      letter: json["quoteText"] as String,
      author: json["quoteAuthor"] as String,
    );
  }
}
