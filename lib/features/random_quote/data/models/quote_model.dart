// Entities
import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  // const QuoteModel({
  //   required String author,
  //   required int id,
  //   required String content,
  //   required String permalink,
  // }) : super(author: author, id: id, content: content, permalink: permalink);

  const QuoteModel({
    required super.author,
    required super.id,
    required super.content,
    required super.permalink,
  });

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'id': id,
      'quote': content,
      'permalink': permalink,
    };
  }

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      author: json['author'],
      id: json['id'],
      content: json['quote'],
      permalink: json['permalink'],
    );
  }
}
