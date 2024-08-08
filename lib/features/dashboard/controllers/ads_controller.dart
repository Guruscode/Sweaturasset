import 'dart:convert';

import 'package:get/get.dart';
import 'package:fpdart/fpdart.dart';
import 'package:swa/core/constants/const.dart';
import 'package:swa/core/constants/errors.dart';
import 'package:swa/core/models/ads_model.dart';
import 'package:http/http.dart' as http;

class AdsController extends GetxController {
  bool isLoading = false;
  var ads = <AdsModel>[].obs;

  void loading() {
    isLoading =!isLoading;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    fetchAds();
  }

  Future<Either<AppFailure, List<AdsModel>>> fetchAds() async {
    ads.value.clear();
    loading();
    try {
      var request = await http.get(
        Uri.parse('$endpointUrl/advertisements'),
      );
      var response = jsonDecode(request.body);
      if(request.statusCode != 200) {
        response = response as Map<String, dynamic>;
        print(response);
        return Left(AppFailure(response['errors']));
      }
      print(response);
      for(final data in response) {
        ads.value.add(AdsModel.fromJson(data));
        print(ads.value);
      }
      return Right(ads.value);
    }catch(e) {
      print(e.toString());
      return Left(AppFailure(e.toString()));
    } finally {
      loading();
    }
  }
}