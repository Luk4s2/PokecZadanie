// To parse this JSON data, do
//
//     final iTbookResult = iTbookResultFromJson(jsonString);

import 'dart:convert';

ITbookResult iTbookResultFromJson(String str) =>
    ITbookResult.fromJson(json.decode(str));

String iTbookResultToJson(ITbookResult data) => json.encode(data.toJson());

class ITbookResult {
  ITbookResult({
    this.error,
    this.total,
    this.page,
    this.books,
  });

  String error;
  String total;
  String page;
  List<Book> books;

  factory ITbookResult.fromJson(Map<String, dynamic> json) => ITbookResult(
        error: json["error"],
        total: json["total"],
        page: json["page"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "page": page,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}

class Book {
  Book({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  String title;
  String subtitle;
  String isbn13;
  String price;
  String image;
  String url;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
