import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:instagram_clone/features/home/data/models/post_model.dart';
import 'package:instagram_clone/features/profile/data/models/user_model.dart';

part 'serializers.g.dart';

@SerializersFor([
  UserModel,
  PostModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
