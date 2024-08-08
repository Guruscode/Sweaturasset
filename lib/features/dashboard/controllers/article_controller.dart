import 'dart:convert';

import 'package:get/get.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/core/constants/errors.dart';
import 'package:swa/core/models/article_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

class ArticleController extends GetxController {
  bool isLoading = false;
  var articles = <ArticleModel>[].obs;

  void loading() {
    isLoading =!isLoading;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchArticles();
  }
  
  Future<Either<AppFailure, List<ArticleModel>>> fetchArticles() async {
    articles.value.clear();
    loading();
    try{
      var request = await http.get(
        Uri.parse('$endpointUrl/articles')
      );
      var response = jsonDecode(request.body);
      if(request.statusCode != 200) {
        response = response as Map<String, dynamic>;
        print(response);
        return Left(AppFailure(response['errors']));
      }
      print(response);
      for(final data in response) {
        articles.value.add(ArticleModel.fromJson(data));
        print(articles.value);
      }
      return Right(articles.value);
    }catch(e) {
      print(e.toString());
      return Left(AppFailure());
    } finally {
      loading();
    }
  }
}