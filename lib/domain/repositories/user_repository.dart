abstract class UserRepository {
//   Future<User> findUserById(String id);
//   Future<void> saveUser(User user);
  Future<String?> authenticate(String username, String password);
}
