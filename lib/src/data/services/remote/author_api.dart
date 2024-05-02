import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:species/src/data/mappers/author_mapper.dart';
import 'package:species/src/data/models/classes/author_iiap/author_iiap.dart';
import 'package:species/src/domain/either.dart';
import 'package:species/src/domain/entities/author/author.dart';
import 'package:species/src/domain/failures/http_request/http_request_failure.dart';

class AuthorApi {
  final String _baseUrl;
  final AuthorMapper _authorMapper;

  AuthorApi({
    required String baseUrl,
    required AuthorMapper authorMapper,
  })  : _baseUrl = baseUrl,
        _authorMapper = authorMapper;

  Future<Either<HttpRequestFailure, List<Author>>> getAuthors({
    required int pageKey,
    required int numberOfPostsPerRequest,
  }) async {
    try {
      final response = await get(
          Uri.parse('$_baseUrl/authors/$pageKey/$numberOfPostsPerRequest'));
      if (response.statusCode == 200) {
        final responseList = jsonDecode(response.body);
        final authorsIiap = getAuthorIiapList(responseList['autores']);

        final authors = authorsIiap
            .map((author) => _authorMapper.authorIiapToAuthor(author))
            .toList();
        return Either.right(authors);
      } else {
        return Either.left(HttpRequestFailureNotFound());
      }
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(HttpRequestFailure.network());
      }
      return Either.left(HttpRequestFailure.unknown());
    }
  }

  Future<void> getAuthorsSearchGeneral(
      {required String query,
      required int pageKey,
      required int numberOfPostsPerRequest,
      required PagingController pagingController}) async {
    try {
      final response = await get(Uri.parse(
          '$_baseUrl/authors/search/$query/$pageKey/$numberOfPostsPerRequest'));
      final responseList = jsonDecode(response.body);
      final authorsIiap = getAuthorIiapList(responseList['authors']);

      final authors = authorsIiap
          .map((author) => _authorMapper.authorIiapToAuthor(author))
          .toList();

      final isLastPage = authors.length < numberOfPostsPerRequest;
      if (isLastPage) {
        pagingController.appendLastPage(authors);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(authors, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  Future<Either<HttpRequestFailure, Author>> getAuthor(String id) async {
    try {
      final response = await get(Uri.parse('$_baseUrl/authors/$id'));
      if (response.statusCode != 200) {
        return Either.left(HttpRequestFailure.notFound());
      }
      final responseBody = jsonDecode(response.body) as Map<String, dynamic>;
      final authorIiap = AuthorIiap.fromJson(responseBody);
      final author = _authorMapper.authorIiapToAuthor(authorIiap);
      return Either.right(author);
    } catch (e) {
      if (e is SocketException || e is ClientException) {
        return Either.left(HttpRequestFailure.network());
      }
      return Either.left(HttpRequestFailure.unknown());
    }
  }
}
