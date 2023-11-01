import 'package:riverpod/riverpod.dart';
import 'services.dart';
import 'package:project_1/model/user.dart';
final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});

