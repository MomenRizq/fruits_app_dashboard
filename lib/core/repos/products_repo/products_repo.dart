

import 'package:dartz/dartz.dart';

import '../../../features/add_product/domain/entities/add_product_entity_input.dart';
import '../../errors/faluire.dart';

abstract class ProductsRepo {
  Future<Either<Failure, void>> addProduct(AddProductInputEntity addProductInputEntity);
}