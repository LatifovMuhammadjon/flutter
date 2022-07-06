class CurrencyModel {
  int? id;
  String? code,
      ccy,
      ccyNmRu,
      ccyNmUz,
      ccyNmUzc,
      ccyNmEn,
      nominal,
      rate,
      diff,
      date;
  CurrencyModel({
    this.id,
    this.code,
    this.ccy,
    this.ccyNmRu,
    this.ccyNmUz,
    this.ccyNmUzc,
    this.ccyNmEn,
    this.nominal,
    this.rate,
    this.diff,
    this.date,
  });
  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        id: json['id'] as int?,
        code: json['Code'] as String?,
        ccy: json['Ccy'] as String?,
        ccyNmRu: json['CcyNm_RU'] as String?,
        ccyNmUz: json['CcyNm_UZ'] as String?,
        ccyNmUzc: json['CcyNm_UZC'] as String?,
        ccyNmEn: json['CcyNm_EN'] as String?,
        nominal: json['Nominal'] as String?,
        rate: json['Rate'] as String?,
        diff: json['Diff'] as String?,
        date: json['Date'] as String?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        "id": id,
        "Code": code,
        "Ccy": ccy,
        "CcyNm_RU": ccyNmRu,
        "CcyNm_UZ": ccyNmUz,
        "CcyNm_UZC": ccyNmUzc,
        "CcyNm_EN": ccyNmEn,
        "Nominal": nominal,
        "Rate": rate,
        "Diff": diff,
        "Date": date
      };
}
