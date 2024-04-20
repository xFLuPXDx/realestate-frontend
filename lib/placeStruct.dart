class Places {
  int? count;
  List<Result>? result;

  Places({this.count, this.result});

  Places.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? realestateId;
  String? realestateName;
  String? realestateLocation;
  String? realestateAddress;
  String? realestateArea;
  String? rooms;
  String? bathrooms;
  String? balconys;
  List<String>? realestateImagesIds;

  Result(
      {this.realestateId,
      this.realestateName,
      this.realestateLocation,
      this.realestateAddress,
      this.realestateArea,
      this.rooms,
      this.bathrooms,
      this.balconys,
      this.realestateImagesIds});

  Result.fromJson(Map<String, dynamic> json) {
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