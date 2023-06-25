import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_news_app/core/constants.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/data_sources/remote_data_source.dart';
import 'package:the_news_app/features/news_app_basic_feature/data/models/article.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late RemoteDataSource remoteDataSource;

  setUp(() {
    mockDio = MockDio();
    remoteDataSource = RemoteDataSource(dio: mockDio);
  });
void arrangeCommon200(){
  when(() => mockDio.get(APIConstants.listOfLatestNewsAPI))
      .thenAnswer((invocation) async {
    final result = Response(
        requestOptions: RequestOptions(
            path: APIConstants.listOfLatestNewsAPI,
            data: jsonDecode(fixture("article.json"))),
        data: jsonDecode(fixture("article.json")),
        statusCode: 200);
    return result;
  });
  }
  group("Group to test remote datasource", () {
    final tDataModel = List.from(jsonDecode(fixture("article.json"))["data"]).map((e) => Article.fromJson(e));
    test("verify the url called", () async {
      //Arrange
      arrangeCommon200();
      //Act
     await remoteDataSource.getDataFromRemoteDataSource();
      //Assert
      verify(() => mockDio.get(APIConstants.listOfLatestNewsAPI));
    });

    test("check if the model is of the same type", ()async{
      //Arrange
      arrangeCommon200();
      //Act
      final r= await remoteDataSource.getDataFromRemoteDataSource();
      //Assert
      expect(r, tDataModel);
    });
    test("Throw a server exception", ()async{
      //Arrange
      when(()=>mockDio.get(APIConstants.listOfLatestNewsAPI)).thenAnswer((invocation) async{
        final result = Response(
            requestOptions: RequestOptions(
                path: APIConstants.listOfLatestNewsAPI,
                data: "Something went wrong!!!!"),
            data: "Something is not correct",
            statusCode: 404);
        return result;
      });
      //Act
      final r= remoteDataSource.getDataFromRemoteDataSource;
      //Assert
      expect(()=>r(),throwsA(const TypeMatcher<DioError>()));
    });
  });
}
