class PaymentType {
  String? code, titleEn, titleFr;
  String? descriptionEn, descriptionFr;
  int? id, minAmount;

  PaymentType({this.id, this.code, this.titleEn, this.titleFr, this.descriptionEn, this.descriptionFr, this.minAmount});

  factory PaymentType.fromJson(Map<String, dynamic> json) {
    return PaymentType(
      id: json["id"],
      code: json["code"],
      titleEn: json["title_en"],
      titleFr: json["title_fr"],
      descriptionEn: json["description_en"],
      descriptionFr: json["description_fr"],
      minAmount: json["min_amount"],      
    );
  }

}
