import 'package:flutter/material.dart';

class ProductMetaForm extends StatelessWidget {
  const ProductMetaForm({
    Key? key,
    this.title = "",
    this.guides = "",
    required this.onChangedTitle,
    required this.onChangedGuides,
    required this.onSaveButton,
  }) : super(key: key);

  final String title; // 상품메타명
  final String guides; // 선택된 가이드들

  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedGuides;
  final VoidCallback onSaveButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitle(),
        const SizedBox(height: 10),
        _buildGuides(),
        const SizedBox(height: 10),
        _buildSaveButton(),
      ],
    );
  }

  Widget _buildTitle() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "상품메타명",
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "상품메타명이 비었습니다.";
        }
        return null;
      },
      onChanged: onChangedTitle,
    );
  }

  Widget _buildGuides() {
    return TextFormField(
      decoration: InputDecoration(labelText: "가이드 선택"),
      onChanged: onChangedGuides,
    );
  }

  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSaveButton,
        child: const Text("저장"),
      ),
    );
  }
}
