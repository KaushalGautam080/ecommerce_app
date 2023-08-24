// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_product_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleProductModal _$$_SingleProductModalFromJson(
        Map<String, dynamic> json) =>
    _$_SingleProductModal(
      id: json['id'] as int?,
      price: json['price'] as int?,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: json['stock'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      thumbnail: json['thumbnail'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_SingleProductModalToJson(
        _$_SingleProductModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'title': instance.title,
      'description': instance.description,
      'brand': instance.brand,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
    };
