// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostItem> _$postItemSerializer = new _$PostItemSerializer();

class _$PostItemSerializer implements StructuredSerializer<PostItem> {
  @override
  final Iterable<Type> types = const [PostItem, _$PostItem];
  @override
  final String wireName = 'PostItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, PostItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'image',
      serializers.serialize(object.image,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PostItem deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PostItem extends PostItem {
  @override
  final String id;
  @override
  final String image;

  factory _$PostItem([void Function(PostItemBuilder)? updates]) =>
      (new PostItemBuilder()..update(updates))._build();

  _$PostItem._({required this.id, required this.image}) : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'PostItem', 'id');
    BuiltValueNullFieldError.checkNotNull(image, r'PostItem', 'image');
  }

  @override
  PostItem rebuild(void Function(PostItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostItemBuilder toBuilder() => new PostItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostItem && id == other.id && image == other.image;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, image.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostItem')
          ..add('id', id)
          ..add('image', image))
        .toString();
  }
}

class PostItemBuilder implements Builder<PostItem, PostItemBuilder> {
  _$PostItem? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  PostItemBuilder();

  PostItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _image = $v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostItem;
  }

  @override
  void update(void Function(PostItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PostItem build() => _build();

  _$PostItem _build() {
    final _$result = _$v ??
        new _$PostItem._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'PostItem', 'id'),
            image: BuiltValueNullFieldError.checkNotNull(
                image, r'PostItem', 'image'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
