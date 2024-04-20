class Places {
  String? realestateId;
  String? realestateName;
  String? realestateLocation;
  String? realestateAddress;
  String? realestateArea;
  String? rooms;
  String? bathrooms;
  String? balconys;
  List<String>? realestateImagesIds;

  Places(
      {this.realestateId,
      this.realestateName,
      this.realestateLocation,
      this.realestateAddress,
      this.realestateArea,
      this.rooms,
      this.bathrooms,
      this.balconys,
      this.realestateImagesIds});

  Places.fromJson(Map<String, dynamic> json) {
    realestateId = json['realestate_Id'];
    realestateName = json['realestate_name'];
    realestateLocation = json['realestate_location'];
    realestateAddress = json['realestate_address'];
    realestateArea = json['realestate_area'];
    rooms = json['rooms'];
    bathrooms = json['bathrooms'];
    balconys = json['balconys'];
    realestateImagesIds = json['realestate_images_ids'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['realestate_Id'] = this.realestateId;
    data['realestate_name'] = this.realestateName;
    data['realestate_location'] = this.realestateLocation;
    data['realestate_address'] = this.realestateAddress;
    data['realestate_area'] = this.realestateArea;
    data['rooms'] = this.rooms;
    data['bathrooms'] = this.bathrooms;
    data['balconys'] = this.balconys;
    data['realestate_images_ids'] = this.realestateImagesIds;
    return data;
  }
}