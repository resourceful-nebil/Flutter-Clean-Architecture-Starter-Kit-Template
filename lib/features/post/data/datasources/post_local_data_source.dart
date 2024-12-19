import 'dart:convert';
import '../../../../core/databases/cache/cache_helper.dart';
import '../../../../core/errors/expentions.dart';
import '../models/post_model.dart';

class PostLocalDataSource {
  final CacheHelper cache;
  final String key = "CachedPost";
  PostLocalDataSource({required this.cache});

  cachePost(PostModel? postToCache) {
    if (postToCache != null) {
      cache.saveData(
        key: key,
        value: json.encode(
          postToCache.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }

  Future<PostModel> getLastPost() {
    final jsonString = cache.getDataString(key: key);

    if (jsonString != null) {
      return Future.value(PostModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: "No Internet Connection");
    }
  }
}
