import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/repository/data_sources/auth_remote_data_source_impl.dart';
import 'package:e_commerce/data/repository/data_sources/cart_remote_data_source_impl.dart';
import 'package:e_commerce/data/repository/data_sources/home_tab_remote_data_source_impl.dart';
import 'package:e_commerce/data/repository/data_sources/products_tab_remote_data_source_impl.dart';
import 'package:e_commerce/data/repository/repository/auth_repository_impl.dart';
import 'package:e_commerce/data/repository/repository/cart_repository_impl.dart';
import 'package:e_commerce/data/repository/repository/home_tab_repository_impl.dart';
import 'package:e_commerce/data/repository/repository/products_tab_repository_impl.dart';
import 'package:e_commerce/domain/repository/data_sources/auth_remote_data_source_contract.dart';
import 'package:e_commerce/domain/repository/data_sources/cart_remote_data_source_contract.dart';
import 'package:e_commerce/domain/repository/data_sources/products_tab_remote_data_source_contract.dart';
import 'package:e_commerce/domain/repository/repository/auth_repository_contract.dart';
import 'package:e_commerce/domain/repository/data_sources/home_tab_remote_data_source_contract.dart';
import 'package:e_commerce/domain/repository/repository/cart_repository_contract.dart';
import 'package:e_commerce/domain/repository/repository/home_tab_repository_contract.dart';
import 'package:e_commerce/domain/repository/repository/products_tab_repository_contract.dart';
import 'package:e_commerce/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/delete_product_from_cart_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_brands_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_cart_products_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_categories_use_case.dart';
import 'package:e_commerce/domain/use_cases/get_products_use_case.dart';
import 'package:e_commerce/domain/use_cases/login_use_case.dart';
import 'package:e_commerce/domain/use_cases/register_use_case.dart';
import 'package:e_commerce/domain/use_cases/update_product_count_in_cart_use_case.dart';

///*------------ ViewModel => object UseCase -----------------------------
///
RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepositoryContract());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepositoryDelegate: injectAuthRepositoryContract());
}

GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(
      repositoryDelegate: injectHomeTabRepositoryContract());
}

GetAllBrandsUseCase injectGetAllBrandsUseCase() {
  return GetAllBrandsUseCase(
      repositoryDelegate: injectHomeTabRepositoryContract());
}

GetAllProductsUseCase injectGetAllProductsUseCase() {
  return GetAllProductsUseCase(
      repositoryDelegate: injectProductsTabRepositoryContract());
}

AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(
      repositoryDelegate: injectProductsTabRepositoryContract());
}

GetCartProductsUseCase injectGetCartProductsUseCase() {
  return GetCartProductsUseCase(
      repositoryDelegate: injectCartRepositoryContract());
}

DeleteProductFromCartUseCase injectDeleteProductFromCartUseCase() {
  return DeleteProductFromCartUseCase(
      repositoryDelegate: injectCartRepositoryContract());
}

UpdateProductCountInCartUseCase injectUpdateProductCountInCartUseCase() {
  return UpdateProductCountInCartUseCase(
      repositoryDelegate: injectCartRepositoryContract());
}

///*------------ UseCase => object Repository  -----------------------------
///
AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(
      remoteDataSourceDelegate: injectAuthRemoteDataSourceContract());
}

HomeTabRepositoryContract injectHomeTabRepositoryContract() {
  return HomeTabRepositoryImpl(
      remoteDataSourceDelegate: injectCategoriesRemoteDataSourceContract());
}

ProductsTabRepositoryContract injectProductsTabRepositoryContract() {
  return ProductsTabRepositoryImpl(
      remoteDataSourceDelegate: injectProductsTabRemoteDataSourceContract());
}

CartRepositoryContract injectCartRepositoryContract() {
  return CartRepositoryImpl(
      remoteDataSourceDelegate: injectCartRemoteDataSourceContract());
}

///*------------ Repository => object DataSource  -----------------------------
///
AuthRemoteDataSourceContract injectAuthRemoteDataSourceContract() {
  return AuthRemoteDataSourceImpl(apiManager: injectApiManager());
}

ProductsTabRemoteDataSourceContract
    injectProductsTabRemoteDataSourceContract() {
  return ProductsTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

HomeTabRemoteDataSourceContract injectCategoriesRemoteDataSourceContract() {
  return HomeTabRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

CartRemoteDataSourceContract injectCartRemoteDataSourceContract() {
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

///*------------ DataSource = > object ApiManager  -----------------------------
///
ApiManager injectApiManager() {
  return ApiManager.getInstance();
}
