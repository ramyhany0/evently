import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/User.dart';

class FirebaseHandler {
  static CollectionReference<User> getUserCollection() {
    var collection = FirebaseFirestore.instance
        .collection('users')
        .withConverter(
          fromFirestore: (snapshot, options) {
            Map<String, dynamic>? data = snapshot.data();
            return User.fromFirebase(data!);
          },
          toFirestore: (user, options) {
            return user.toFirestore();
          },
        );
    return collection;
  }

  static Future<void> addUser(User user) async {
    var collection = getUserCollection();
    var document = collection.doc(user.id);
    document.set(user);
  }

  static Future<User?> getUser(String userId) async {
    var collection = getUserCollection();
    var document = collection.doc(userId);
    var snapshot = await document.get();
    return snapshot.data();
  }
}
