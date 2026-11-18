
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // دالة رفع صورة البروفيل وإرجاع رابط الـ URL
  Future<String?> uploadProfileImage(File imageFile) async {
    try {
      String uid = _auth.currentUser!.uid;
      
      // 1. تحديد مسار الحفظ في التخزين (مثلاً: profile_images/uid.jpg)
      Reference ref = _storage.ref().child('profile_images').child('$uid.jpg');

      // 2. رفع الملف
      UploadTask uploadTask = ref.putFile(imageFile);

      // 3. انتظار اكتمال الرفع
      TaskSnapshot snapshot = await uploadTask;

      // 4. جلب الرابط المباشر للصورة (Download URL)
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('خطأ أثناء رفع الصورة: $e');
      return null;
    }
  }
}