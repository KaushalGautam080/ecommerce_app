import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_product_modal.freezed.dart';
part 'all_product_modal.g.dart';

@freezed
class AllProductModal with _$AllProductModal {
  const factory AllProductModal({
    List<Product>? products,
  }) = _AllProductModal;

  factory AllProductModal.fromJson(Map<String, Object?> json) =>
      _$AllProductModalFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    int? id,
    String? title,
    String? description,
    int? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    List<String>? images,
    String? thumbnail,
  }) = _Product;

  factory Product.fromJson(Map<String, Object?> json) =>
      _$ProductFromJson(json);
}
