// class AdminModel {
//   String? id;
//   String? image;
//   String? fullName;
//   // String? age;
//   // String? gender;
//   // String? category;
//   // String? position;
//   String? aboutTrip;
//   //String? startTime;
//   //String? endTime;
// //String? patients;
//   // String? experience;
//   //int? rating;
//   List wishList;

//   AdminModel({
//     this.id,
//     this.image,
//     required this.fullName,
//     // required this.age,
//     //  required this.gender,
//     //  required this.category,
//     // required this.position,
//     //  required this.startTime,
//     //required this.endTime,
//     this.aboutTrip,
//     //  this.patients,
//     // this.experience,
//     // this.rating,
//     required this.wishList,
//   });

//   factory AdminModel.fromJson(String id, Map<String, dynamic> json) {
//     return AdminModel(
//       id: id,
//       image: json['image'],
//       fullName: json['fullName'],
//       //  age: json['age'],
//       //  gender: json['gender'],
//       //  category: json['category'],
//       // position: json['position'],
//       // startTime: json['startTime'],
//       // endTime: json['endTime'],
//       aboutTrip: json['aboutDoctor'],
//       // patients: json['patients'],
//       // experience: json['experience'],
//       //rating: json['rating'],
//       wishList: List<String>.from(json['wishlist']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'image': image,
//       'fullName': fullName,
//       // 'age': age,
//       //'gender': gender,
//       // 'category': category,
//       //'position': position,
//       // 'startTime': startTime,
//       //'endTime': endTime,
//       'aboutDoctor': aboutTrip,
//       // 'patients': patients,
//       // 'experience': experience,
//       // 'rating': rating,
//       'wishlist': wishList
//     };
//   }
// }

// class AdminModel {
//   String? id;
//   String? fullName;
//   String? location;
//   String? duration;
//   String? transportation;
//   String? aboutTrip;
//   List? wishList;
//   List? image;

//   AdminModel({
//     this.id,
//     this.image,
//     required this.fullName,
//     this.location,
//     this.duration,
//     this.transportation,
//     this.aboutTrip,
//     this.wishList,
//   });

//   factory AdminModel.fromJson(String id, Map<String, dynamic> json) {
//     return AdminModel(
//       id: id,
//       image: List<String>.from(json['image']),
//       fullName: json['fullName'],
//       duration: json['duration'],
//       transportation: json['transportation'],
//       location: json['location'],
//       aboutTrip: json['aboutTrip'],
//       wishList: List<String>.from(json['wishlist']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'image': image,
//       'fullName': fullName,
//       'location': location,
//       'duration': duration,
//       'transportation': transportation,
//       'aboutTrip': aboutTrip,
//       'wishlist': wishList
//     };
//   }
// }
class AdminModel {
  String? id;
  String? fullName;
  String? location;
  String? duration;
  String? transportation;
  String? aboutTrip;
  List<String>? wishList;
  List<String>? image;

  AdminModel({
    this.id,
    this.image,
    required this.fullName,
    this.location,
    this.duration,
    this.transportation,
    this.aboutTrip,
    this.wishList,
  });

  factory AdminModel.fromJson(String id, Map<String, dynamic> json) {
    return AdminModel(
      id: id,
      image: (json['image'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      fullName: json['fullName'] as String?,
      duration: json['duration'] as String?,
      transportation: json['transportation'] as String?,
      location: json['location'] as String?,
      aboutTrip: json['aboutTrip'] as String?,
      wishList: (json['wishlist'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'fullName': fullName,
      'location': location,
      'duration': duration,
      'transportation': transportation,
      'aboutTrip': aboutTrip,
      'wishlist': wishList,
    };
  }
}
