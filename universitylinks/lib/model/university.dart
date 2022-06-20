class University {
  late List<String>? domains;
  late List<String>? webPages;
  late String? stateProvince;
  late String? name;
  late String? country;
  late String? alphaTwoCode;

  University(
      {this.domains,
      this.webPages,
      this.stateProvince,
      this.name,
      this.country,
      this.alphaTwoCode});

  University.fromJson(Map<String, dynamic> json) {
    domains = json['domains'].cast<String>();
    webPages = json['web_pages'].cast<String>();
    stateProvince = json['state-province'];
    name = json['name'];
    country = json['country'];
    alphaTwoCode = json['alpha_two_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domains'] = this.domains;
    data['web_pages'] = this.webPages;
    data['state-province'] = this.stateProvince;
    data['name'] = this.name;
    data['country'] = this.country;
    data['alpha_two_code'] = this.alphaTwoCode;
    return data;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "name:$name";
  }
}
