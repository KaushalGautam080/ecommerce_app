import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_modal.freezed.dart';
part 'product_modal.g.dart';

@freezed
class ProductModal with _$ProductModal {
  const factory ProductModal({
    int? total,
    int? skip,
    int? limit,
    List<Product>? products,
  }) = _ProductModal;

  factory ProductModal.fromJson(Map<String, Object?> json) =>
      _$ProductModalFromJson(json);
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
