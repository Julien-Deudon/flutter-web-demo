import 'package:flutter_web/core/providers/global_provider_binding.dart';
import 'package:flutter_web/module/users/data/datasource/users_remote_datasource.dart';
import 'package:flutter_web/module/users/data/models/user_model.dart';
import 'package:flutter_web/module/users/data/repository/users_repository.dart';
import 'package:flutter_web/module/users/presentation/controller/users_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// remote datasource
final _usersRemoteDatasourceProvider = Provider(
  (ref) => UsersRemoteDataSource(
    dio: ref.read(dioProvider),
  ),
);

// repository
final _usersRepositoryProvider = Provider(
  (ref) => UsersRepository(
    usersRemoteDataSource: ref.read(_usersRemoteDatasourceProvider),
  ),
);

// controllers
final userControllerProvider =
    StateNotifierProvider<UsersController, AsyncValue<List<User>>>(
  (ref) => UsersController(
    usersRepository: ref.read(_usersRepositoryProvider),
  )..getUsers(),
);
