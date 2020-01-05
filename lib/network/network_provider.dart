import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:one_flutter_octopus/model/result_news.dart';
import 'package:one_flutter_octopus/network/constant_file.dart';

abstract class NetworkResponse {
  Future<List> getNews();
  Future<List> searchNews(String query);
}

class NetworkProvider implements NetworkResponse{
  int index;
  @override
  Future<List<Article>> getNews() async {
    // TODO: implement getNews

    final response = await http.get(ConstantFile().baseUrl);
    ResultNews data = resultNewsFromJson(response.body);
    return data.articles;
  }

  @override
  Future<List<Article>> searchNews(String query) async{

    final response = await http.get(ConstantFile().baseUrl+query);
    ResultNews data = resultNewsFromJson(response.body);
    return data.articles;
  }
}
