import 'package:dartz/dartz.dart';
import 'package:flutter_web/module/posts/data/tools/failures.dart';
import 'package:flutter_web/module/users/data/datasource/users_remote_datasource.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';

class UsersRepository {
  UsersRepository({required UsersRemoteDataSource usersRemoteDataSource})
      : _usersRemoteDataSource = usersRemoteDataSource;

  final UsersRemoteDataSource _usersRemoteDataSource;

  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final result = await _usersRemoteDataSource.getUsers();

      return Right(result);
    } catch (e) {
      return Left(UsersFailure());
    }
  }
}
