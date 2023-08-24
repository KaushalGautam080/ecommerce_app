import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_product_modal.freezed.dart';
part 'single_product_modal.g.dart';

@freezed
class SingleProductModal with _$SingleProductModal {
  const factory SingleProductModal({
    int? id,
    int? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? title,
    String? description,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
  }) = _SingleProductModal;

  factory SingleProductModal.fromJson(Map<String, Object?> json) =>
      _$SingleProductModalFromJson(json);
}
