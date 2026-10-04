import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/mock_data.dart';

final authProvider = NotifierProvider<AuthNotifier, MockUser?>(() {
  return AuthNotifier();
});

class AuthNotifier extends Notifier<MockUser?> {
  @override
  MockUser? build() => null;

  void loginAsStudent() {
    state = MockData.currentStudent;
  }

  void loginAsAdmin() {
    state = MockData.currentAdmin;
  }

  void logout() {
    state = null;
  }
}
