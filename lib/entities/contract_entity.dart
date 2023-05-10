class ContractEntity {
  final String name;
  final num fee;
  final num minPrice;
  final num maxPrice;
  final num time;
  final List<dynamic> profit;

  ContractEntity(
    this.name,
    this.fee,
    this.minPrice,
    this.maxPrice,
    this.time,
    this.profit,
  );

  factory ContractEntity.fromJson(json) => ContractEntity(
        json['name'],
        json['fee'],
        json['min_price'],
        json['max_price'],
        json['time'],
        json['profit'],
      );

  static List<ContractEntity> createListFrom(List<dynamic> list) {
    return list.map((e) => ContractEntity.fromJson(e)).toList();
  }
}
