import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class QuickounceFirebaseUser {
  QuickounceFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

QuickounceFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<QuickounceFirebaseUser> quickounceFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<QuickounceFirebaseUser>(
            (user) => currentUser = QuickounceFirebaseUser(user));
