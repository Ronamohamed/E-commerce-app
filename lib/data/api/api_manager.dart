import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/data/models_dto/request/login_requsest_dto.dart';
import 'package:e_commerce/data/models_dto/request/register_request_dto.dart';
import 'package:e_commerce/data/models_dto/response/add_to_cart_response_dto.dart';
import 'package:e_commerce/data/models_dto/response/categories_brands_response_dto.dart';
import 'package:e_commerce/data/models_dto/response/get_cart_response_dto.dart';
import 'package:e_commerce/data/models_dto/response/products_response_dto.dart';
import 'package:e_commerce/data/models_dto/response/register_response_dto.dart';
import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/ui/utils/my_shared_preferences.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  ApiManager._();

  Future<Either<Errors, RegisterResponseDTO>> register(
      String? name,
      String? email,
      String? password,
      String? rePassword,
      String? phone) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
        ApiConstants.baseUrl,
        ApiConstants.registerEndPoint,
      );
      var registerRequest = RegisterRequestDTO(
          name: name,
          phone: phone,
          email: email,
          password: password,
          rePassword: rePassword);
      var response = await http.post(url, body: registerRequest.toJson());
      var registerResponse = RegisterResponseDTO.fromJson(
        jsonDecode(response.body),
      );
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Saving `User Token`
        MySharedPreferces.saveData(
            key: ApiConstants.userToken, value: registerResponse.token);
        return Right(registerResponse);
      } else {
        return Left(ServerError(errorMessage: registerResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }

  Future<Either<Errors, RegisterResponseDTO>> login(
      String? userEmail, String? uesrPassword) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
        ApiConstants.baseUrl,
        ApiConstants.signInEndPoint,
      );
      var loginRequest = LoginRequestDTO(
        email: userEmail,
        password: uesrPassword,
      );
      var response = await http.post(url, body: loginRequest.toJson());
      var loginResponse = RegisterResponseDTO.fromJson(
        jsonDecode(response.body),
      );

      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Saving `User Token`
        MySharedPreferces.saveData(
            key: ApiConstants.userToken, value: loginResponse.token);
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }

  Future<Either<Errors, CategoriesBrandsResponseDTO>> getAllCategories() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url =
          Uri.https(ApiConstants.baseUrl, ApiConstants.cagtegoriesEndPoint);
      var response = await http.get(url);
      var categoriesResponse =
          CategoriesBrandsResponseDTO.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoriesResponse);
      } else {
        return Left(ServerError(errorMessage: categoriesResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }

  Future<Either<Errors, CategoriesBrandsResponseDTO>> getAllBrands() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.brandsEndPoint);
      var response = await http.get(url);
      var brandsResponse =
          CategoriesBrandsResponseDTO.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(brandsResponse);
      } else {
        return Left(ServerError(errorMessage: brandsResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }

  Future<Either<Errors, ProductsResponseDTO>> getAllProducts() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.productsEndPoint);
      var response = await http.get(url);
      var productsResponse =
          ProductsResponseDTO.fromJson(jsonDecode(response.body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(productsResponse);
      } else {
        return Left(ServerError(errorMessage: productsResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }

  Future<Either<Errors, AddToCartResponseDTO>> addToCart(
      String? productId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartEndPoint);
      var userToken = MySharedPreferces.getData(key: ApiConstants.userToken);
      var response = await http.post(url,
          headers: {'token': userToken.toString()},
          body: {'productId': productId});

      var addToCartResponse =
          AddToCartResponseDTO.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }

  Future<Either<Errors, GetCartResponseDTO>> getCartProducts() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartEndPoint);
      var userToken = MySharedPreferces.getData(key: ApiConstants.userToken);
      var response = await http.get(
        url,
        headers: {'token': userToken.toString()},
      );

      var cartResponse = GetCartResponseDTO.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(cartResponse);
      } else {
        return Left(ServerError(errorMessage: cartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }

  Future<Either<Errors, GetCartResponseDTO>> deleteProductFromCart(
      String productId) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
          ApiConstants.baseUrl, "${ApiConstants.addToCartEndPoint}/$productId");
      var userToken = MySharedPreferces.getData(key: ApiConstants.userToken);
      var response = await http.delete(
        url,
        headers: {'token': userToken.toString()},
      );

      var deleteProductFromCartResponse =
          GetCartResponseDTO.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteProductFromCartResponse);
      } else {
        return Left(
            ServerError(errorMessage: deleteProductFromCartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }

  Future<Either<Errors, GetCartResponseDTO>> updateProductCountInCart(
      String productId, int count) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(
          ApiConstants.baseUrl, "${ApiConstants.addToCartEndPoint}/$productId");
      var userToken = MySharedPreferces.getData(key: ApiConstants.userToken);
      var response = await http.put(url,
          headers: {'token': userToken.toString()},
          body: {'count': count.toString()});

      var updateProductCountInCartResponse =
          GetCartResponseDTO.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateProductCountInCartResponse);
      } else {
        return Left(ServerError(
            errorMessage: updateProductCountInCartResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: "Please check the internet connection"));
    }
  }
}
