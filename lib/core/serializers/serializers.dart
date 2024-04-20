import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:instagram_clone/features/feed/data/models/comment_model.dart';
import 'package:instagram_clone/features/feed/data/models/post_model.dart';
import 'package:instagram_clone/features/profile/data/models/user_model.dart';
import 'package:instagram_clone/features/chat/data/models/chat_models.dart';
import 'package:instagram_clone/features/chat/domain/entities/chat_entities.dart';

part 'serializers.g.dart';

@SerializersFor([
  UserModel,
  PostModel,
  CommentModel,
  ChatModel,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
