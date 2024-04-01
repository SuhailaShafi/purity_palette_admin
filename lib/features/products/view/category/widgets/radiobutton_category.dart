import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:purity_admin/features/products/controller/category/category_controller.dart';
import 'package:purity_admin/features/products/model/category/category_model.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButton({
    required this.title,
    required this.type,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    return Row(
      children: [
        Obx(() => Radio<CategoryType>(
              value: type,
              groupValue: categoryController.selectedCategory.value,
              onChanged: (value) {
                if (value != null) {
                  categoryController.setSelectedCategory(value);
                }
              },
            )),
        Text(title)
      ],
    );
  }
}
