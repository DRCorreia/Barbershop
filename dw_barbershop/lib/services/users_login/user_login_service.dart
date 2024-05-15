import 'package:dw_barbershop/core/exceptions/service_exception.dart';
import 'package:dw_barbershop/core/fp/either.dart';
import 'package:dw_barbershop/core/fp/nil.dart';

abstract interface class UserLoginService{
  Future<Either<ServiceException, Nil>> execute(String email, String password); 
}