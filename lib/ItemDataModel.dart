class ItemDataModel {
  int? id;
  String? name;
  String? address;
  String? category;
  String? imageUrl;
  int? rating;
  int? oldPrice;
  int? discountPrice;

  ItemDataModel(
      {this.id,
      this.name,
      this.address,
      this.category,
      this.imageUrl,
      this.rating,
      this.oldPrice,
      this.discountPrice});

  ItemDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    category = json['category'];
    imageUrl = json['imageUrl'];
    rating = json['rating'];
    oldPrice = json['oldPrice'];
    discountPrice = json['discountPrice'];
  }
}
