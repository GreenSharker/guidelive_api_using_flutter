class ProductMeta {
  final int id;
  final String title; // 상품명
  final String myrealtrip_title; // 마이리얼트립 상품명
  final String triple_title; // 트리플 상품명
  final String nolbal_title; // 놀이의 발견 상품명
  final String frip_title; // 프립 상품명
  final List<dynamic>? guides; // 배치된 가이드들
  final String? required_time; // 일정 총 소요시간
  final String created;
  final String updated;

  ProductMeta({
    this.id = 0,
    required this.title,
    required this.myrealtrip_title,
    required this.triple_title,
    required this.nolbal_title,
    required this.frip_title,
    this.guides,
    this.required_time = null,
    required this.created,
    required this.updated,
  });

  factory ProductMeta.fromJson(Map<String, dynamic> json) {
    return ProductMeta(
      id: json["id"],
      title: json["title"],
      myrealtrip_title: json["myrealtrip_title"],
      triple_title: json["triple_title"],
      nolbal_title: json["nolbal_title"],
      frip_title: json["frip_title"],
      guides: json["guides"],
      required_time: json["required_time"],
      created: json["created"],
      updated: json["updated"],
    );
  }
}
