import 'package:e_commerce/domain/entities/errors.dart';
import 'package:e_commerce/domain/entities/get_cart_response_entity.dart';

abstract class CartScreenStates {}

class CartScreenInitialState extends CartScreenStates {}

///* -------------- GetCartStates --------------

class GetCartLoadingState extends CartScreenStates {}

class GetCartErrorState extends CartScreenStates {
  Errors error;

  GetCartErrorState({required this.error});
}

class GetCartSuccessState extends CartScreenStates {
  GetCartResponseEntity getCartResponseEntity;

  GetCartSuccessState({required this.getCartResponseEntity});
}

///* -------------- DeleteFromCartStates --------------

class DeleteFromCartLoadingState extends CartScreenStates {}

class DeleteFromCartErrorState extends CartScreenStates {
  Errors error;

  DeleteFromCartErrorState({required this.error});
}

class DeleteFromCartSuccessState extends CartScreenStates {
  GetCartResponseEntity getCartResponseEntity;

  DeleteFromCartSuccessState({required this.getCartResponseEntity});
}

///* -------------- UpdateCartProductCountStates --------------

class UpdateCartProductCountLoadingState extends CartScreenStates {}

class UpdateCartProductCountErrorState extends CartScreenStates {
  Errors error;

  UpdateCartProductCountErrorState({required this.error});
}

class UpdateCartProductCountSuccessState extends CartScreenStates {
  GetCartResponseEntity getCartResponseEntity;

  UpdateCartProductCountSuccessState({required this.getCartResponseEntity});
}
