import 'package:api_handling/data/source.dart';

abstract class ArticleRepository {
  Future<List<Articles>> getArticles();
}
