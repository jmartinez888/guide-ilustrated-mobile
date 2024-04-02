import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

abstract class AuthorRepository {
  Future<Either<HttpRequestFailure, List<Author>>> getAuthors({
    required int pageKey,
    required int numberOfPostsPerRequest,
  });

  Future<void> getAuthorsSearchGeneral({
    required String query,
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController<dynamic, dynamic> pagingController,
  });

  Future<Either<HttpRequestFailure, Author>> getAuthor(String id);
}
