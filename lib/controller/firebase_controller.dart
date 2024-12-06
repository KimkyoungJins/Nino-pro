import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:no_smoking/controller/user_controller.dart';

class FirebaseController extends GetxController {
  static FirebaseController get to => Get.find();

  final store = FirebaseFirestore.instance;

  Future<bool> onJoin(Map<String, dynamic> data) async {
    await store.collection('user').doc(data['id']).set(data);

    return true;
  }

  Future<bool> onLogin(String id, String pw) async {
    final doc = await store.collection('user').doc(id).get();

    if(doc.exists) {
      final user = doc.data()!;
      if(user['id'] == id && user['pw'] == pw) {
        UserController.to.userid.value = user['id'];
        UserController.to.user.value = user;
        return true;
      }
    }

    return false;
  }

  Future<dynamic> getChallenge() async {
    final uid = UserController.to.userid.value;

    final doc = await store.collection('challenge').doc(uid).get();

    if(doc.exists) {
      return doc.data()!;
    } else {
      return {};
    }
  }

  Future<bool> setChallenge(Map<String, dynamic> data) async {
    final uid = UserController.to.userid.value;

    final doc = await store.collection('challenge').doc(uid).get();

    if(doc.exists) {
      return false;
    } else {
      await store.collection('challenge').doc(uid).set(data);
      return true;
    }
  }

  Future<bool> deleteChallenge() async {
    final uid = UserController.to.userid.value;

    await store.collection('challenge').doc(uid).delete();

    return true;
  }
}