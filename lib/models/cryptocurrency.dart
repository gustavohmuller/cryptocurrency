class Cryptocurrency {
  final String uuid;
  final String iconUrl;
  final String name;
  final String symbol;
  final double price;
  final double change;

  Cryptocurrency({
    required this.uuid,
    required this.iconUrl,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
  });
  
  Cryptocurrency.fromMap(Map<String, dynamic> map)
      : uuid = map["uuid"],
        iconUrl = map["iconUrl"],
        name = map["name"],
        symbol = map["symbol"],
        price = double.parse(map["price"]),
        change = double.parse(map["change"]);
}
