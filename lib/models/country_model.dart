class CountryModel {
  CountryModel({
    this.countryId,
    this.countryName,
    this.countryCode,
    this.phoneCode,
    this.isoCode3,
    this.status,
    this.image,
  });


  @override
  String toString() {
    return 'CountryModel{countryId: $countryId, countryName: $countryName, countryCode: $countryCode, phoneCode: $phoneCode, isoCode3: $isoCode3, status: $status, image: $image}';
  }

  CountryModel.fromJson(dynamic json) {
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryCode = json['country_code'];
    phoneCode = json['phone_code'];
    isoCode3 = json['iso_code_3'];
    status = json['status'];
    image = json['image'];
  }
  String? countryId;
  String? countryName;
  String? countryCode;
  String? phoneCode;
  String? isoCode3;
  String? status;
  String? image;
  CountryModel copyWith({
    String? countryId,
    String? countryName,
    String? countryCode,
    String? phoneCode,
    String? isoCode3,
    String? status,
    String? image,
  }) =>
      CountryModel(
        countryId: countryId ?? this.countryId,
        countryName: countryName ?? this.countryName,
        countryCode: countryCode ?? this.countryCode,
        phoneCode: phoneCode ?? this.phoneCode,
        isoCode3: isoCode3 ?? this.isoCode3,
        status: status ?? this.status,
        image: image ?? this.image,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = countryId;
    map['country_name'] = countryName;
    map['country_code'] = countryCode;
    map['phone_code'] = phoneCode;
    map['iso_code_3'] = isoCode3;
    map['status'] = status;
    map['image'] = image;
    return map;
  }
}
