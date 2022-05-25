import 'package:flutter/material.dart';

class Product {
  int id;
  String title; // 상품 제목
  String start; // 초 단위 이하 절사한 Date형
  String end; // 일정(종료 시점)
  Status status; // 상태
  String cancellation_reason; // 여행 취소 사유
  DateTime created;
  DateTime updated;

  Product({
    required this.id,
    required this.title,
    required this.start,
    required this.end,
    required this.status,
    required this.cancellation_reason,
    required this.created,
    required this.updated,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      title: json["title"],
      start: json["start"],
      end: json["end"],
      status: json["status"],
      cancellation_reason: json["cancellation_reason"],
      created: json["created"],
      updated: json["updated"],
    );
  }
}

enum Status {
  IN_USE,
  CANCELED,
}
