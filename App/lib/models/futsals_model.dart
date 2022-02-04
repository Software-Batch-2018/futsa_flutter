class FutsalModel {
  String? id;
  String? futsalName;
  String? address;
  String? imageLink;
  int? pricePerHour;
  int? contact;
  List<String>? reviews;
  int? ratings;

  FutsalModel(
      {this.id,
      this.futsalName,
      this.address,
      this.imageLink,
      this.pricePerHour,
      this.contact,
      this.ratings,
      this.reviews});
}
