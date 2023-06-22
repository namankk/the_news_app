import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/models/article.dart';
import 'package:the_news_app/features/news_app_basic_feature/domain/entities/article_entities.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tModel = Article(
      uuid: "cd9aa142-68eb-4371-a971-2f6a4a4c218b",
      title: "Transfer Talk: Man City to set record to sign Josko Gvardiol",
      description:
          "Leipzig's Josko Gvardiol could break Harry Maguire's record transfer fee as a centre-back with a move to Man City. Transfer Talk has the latest.",
      snippet:
          "Gab & Juls believe Pep Guardiola will stay at Manchester City until his contract expires in 2025. (2:03)\n\nThe summer transfer window isn't open yet in Europe, b...",
      imageUrl:
          "https://a.espncdn.com/combiner/i?img=%2Fphoto%2F2022%2F1208%2Fr1103805_1296x729_16%2D9.jpg",
      publishedAt: "2023-06-13T01:42:37.000000Z");
  test("Check the model should be of Type Article Entities", () {
    expect(tModel, isA<ArticleEntities>());
  });

  group("fromJson", () {
    test("should return a right model", () {
      //Arrange
      final Map<String, dynamic> tResponse =
          json.decode(fixture("article.json"))["data"][0];
      //Act
      final result = Article.fromJson(tResponse);
      //Assert
      expect(result, tModel);
    });
  });
}
