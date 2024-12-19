import '../../domain/entities/post_entitiy.dart';

class PostModel extends PostEntity {
  PostModel();

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}
