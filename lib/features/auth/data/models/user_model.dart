class UserModel {
  int? id;
  String? name;
  String? image;

  UserModel({this.id, this.name, this.image});

  static UserModel userModel = UserModel(
    id: 1,
    name: 'Haitham Essam',
    image:
        'https://www.shutterstock.com/image-photo/handsome-happy-african-american-bearded-600nw-2460702995.jpg',
  );
}
