class UserModel {
  final String uid;
  final String name;
  final String email;
  final String profileImage;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profileImage = '',
  });

  // تحويل البيانات القادمة من فايربيز (Map) إلى كائن UserModel
  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      uid: documentId,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profileImage'] ?? '',
    );
  }

  // تحويل كائن UserModel إلى Map ليتم حفظه في فايربيز
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'profileImage': profileImage,
    };
  }
}