import 'package:dio/dio.dart';

abstract class BaseRepository{
  Future<Response> getAPI();
}