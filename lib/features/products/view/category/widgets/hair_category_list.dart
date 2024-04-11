import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_admin/common/widgets/category_gridview.dart';
import 'package:purity_admin/features/products/controller/category/category_controller.dart';
import 'package:purity_admin/features/products/model/category/category_model.dart';

final skinCategory = [
  Category(
      id: 4,
      name: 'Food',
      isDeleted: false,
      categoryType: CategoryType.Skin,
      imageUrl: 'assets/images/logo_light.jpg'),
  Category(
      id: 3,
      name: 'Entertainment',
      categoryType: CategoryType.Skin,
      isDeleted: false,
      imageUrl: 'assets/images/logo_light.jpg'),
];

class HairCatList extends StatelessWidget {
  const HairCatList({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    categoryController.fetchCategoryData(CategoryType.Hair);
    return Obx(() => categoryController.hairCategoriesList.isNotEmpty
        ? CategoryGridView(
            cat: categoryController.hairCategoriesList,
          )
        : CircularProgressIndicator()); // Show loading indicator if data is not yet fetched
  }
}
