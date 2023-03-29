class Valve {
  String id;
  String valveNum;
  String tierId;
  String areaCode;
  String standCode;
  String location;
  String drainTierNum;
  String bleedTierNum;
  String valveType;
  String tierCode;
  String fullDescription;

  Valve(
      {this.id,
      this.valveNum,
      this.tierId,
      this.areaCode,
      this.standCode,
      this.location,
      this.drainTierNum,
      this.bleedTierNum,
      this.valveType,
      this.tierCode,
      this.fullDescription});

  Valve.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    valveNum = json['ValveNum'];
    tierId = json['TierId'];
    areaCode = json['AreaCode'];
    standCode = json['StandCode'];
    location = json['Location'];
    drainTierNum = json['DrainTierNum'];
    bleedTierNum = json['BleedTierNum'];
    valveType = json['ValveType'];
    tierCode = json['TierCode'];
    fullDescription = json['FullDescription'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['ValveNum'] = this.valveNum;
    data['TierId'] = this.tierId;
    data['AreaCode'] = this.areaCode;
    data['StandCode'] = this.standCode;
    data['Location'] = this.location;
    data['DrainTierNum'] = this.drainTierNum;
    data['BleedTierNum'] = this.bleedTierNum;
    data['ValveType'] = this.valveType;
    data['TierCode'] = this.tierCode;
    data['FullDescription'] = this.fullDescription;
    return data;
  }
}