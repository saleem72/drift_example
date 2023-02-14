//

import 'dart:developer';
import 'dart:convert';

import 'package:drift_example/core/menu_feature/data/remote/dtos/category_dto.dart';
import 'package:drift_example/core/menu_feature/data/remote/dtos/product_dto.dart';
import 'package:drift_example/core/menu_feature/data/remote/end_points.dart';
import 'package:drift_example/core/menu_feature/data/service/menu_service.dart';
import 'package:drift_example/core/menu_feature/domain/models/api_response.dart';
import 'package:http/http.dart' as http;

class MenuApiService implements MenuService {
  @override
  Future<List<CategoryDTO>> getCategories() async {
    const url = EndPoints.BaseURL + EndPoints.HomeMenu;

    final queryParameters = {'restaurant_id': '1'};
    final uri = Uri.parse(url).replace(queryParameters: queryParameters);

    log(uri.toString());
    final httpResponse = await http.get(uri);

    final apiResponse =
        ApiResponse<List<CategoryDTO>>.fromJson(httpResponse.body, (data) {
      return List<CategoryDTO>.from(
          (data as List<dynamic>).map((e) => CategoryDTO.fromMap(e)));
    });

    final list = apiResponse.data ?? [];
    return list;
  }

  @override
  Future<List<ProductDTO>> getSliderData() async {
    const url = EndPoints.BaseURL + EndPoints.HomeSlider;
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final list = productsListFromJson(response.body);
    return list;
  }
}
