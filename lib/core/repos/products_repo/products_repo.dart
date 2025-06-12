

import '../../../features/add_product/domain/entities/add_product_entity_input.dart';

abstract class ProductsRepo {
  Future<void> addProduct(AddProductInputEntity addProductInputEntity);
}