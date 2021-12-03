class Voucher {
   String? imageUrl;
   String? name;
   String? dateTime;

  Voucher({required this.imageUrl, required this.name, required this.dateTime,});
  // Voucher.fromJson(Map<dynamic, dynamic> json) {
  //   id = json['id'];
  //   title = json['title'];
  //   imageUrl = json['imageUrl'];
  //   date = json['date'];
  // }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['imageUrl'] = this.imageUrl;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['date'] = this.date;
  //   return data;
  // }
}

// class Vouchers {
//   List<Voucher> items = [];

//   Vouchers();

//   Vouchers.fromJsonList(List<dynamic> jsonList) {
//     if (jsonList == null) return;

//     for (var item in jsonList) {
//       final pelicula = new Voucher.fromJson(item);
//       items.add(pelicula);
//     }
//   }
// }