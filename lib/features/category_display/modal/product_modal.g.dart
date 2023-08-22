// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductModal _$$_ProductModalFromJson(Map<String, dynamic> json) =>
    _$_ProductModal(
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ProductModalToJson(_$_ProductModal instance) =>
    <String, dynamic>{
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
      'products': instance.products,
    };

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: json['stock'] as int?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'brand': instance.brand,
      'category': instance.category,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
    };
