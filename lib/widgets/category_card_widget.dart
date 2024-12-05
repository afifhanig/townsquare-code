import 'package:flutter/material.dart';
import 'package:townsquare_app/model/category_model.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 3, right: 3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? Color(0xFFBAA1C8) : Color(0xFFEEE1F5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            category.categoryName,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
