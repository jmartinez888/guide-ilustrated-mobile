import 'package:infinite_scroll_pagination/src/core/paging_controller.dart';
import 'package:species/src/data/services/remote/author_api.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';
import 'package:species/src/domain/repositories/author/author_repository.dart';

class AuthorRepositoryImpl extends AuthorRepository {
  final AuthorApi _authorApi;

  AuthorRepositoryImpl({required AuthorApi authorApi}) : _authorApi = authorApi;

  @override
  Future<Either<HttpRequestFailure, List<Author>>> getAuthors({
    required int pageKey,
    required int numberOfPostsPerRequest,
  }) {
    return _authorApi.getAuthors(
      pageKey: pageKey,
      numberOfPostsPerRequest: numberOfPostsPerRequest,
    );
  }

  @override
  Future<Either<HttpRequestFailure, Author>> getAuthor(String id) {
    return _authorApi.getAuthor(id);
  }

  @override
  Future<void> getAuthorsSearchGeneral({
    required String query,
    required int pageKey,
    required int numberOfPostsPerRequest,
    required PagingController pagingController,
  }) {
    return _authorApi.getAuthorsSearchGeneral(
      query: query,
      pageKey: pageKey,
      numberOfPostsPerRequest: numberOfPostsPerRequest,
      pagingController: pagingController,
    );
  }
}
