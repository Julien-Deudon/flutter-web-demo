import 'package:flutter_web/module/users/data/models/user_model.dart';
import 'package:flutter_web/module/users/data/repository/users_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UsersController extends StateNotifier<AsyncValue<List<User>>> {
  UsersController({required UsersRepository usersRepository})
      : _usersRepository = usersRepository,
        super(const AsyncValue.loading());

  final UsersRepository _usersRepository;

  Future<void> getUsers() async {
    final result = await _usersRepository.getUsers();

    state = result.fold(
      (failure) => AsyncValue.error(failure),
      (users) => AsyncValue.data(users),
    );
  }
}
