import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:purity_admin/common/widgets/category_gridview.dart';
import 'package:purity_admin/features/products/controller/category/category_controller.dart';
import 'package:purity_admin/features/products/view/category/category.dart';

class SkinCatList extends StatelessWidget {
  const SkinCatList({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryController categoryController = Get.put(CategoryController());
    categoryController.fetchCategoryDataskin();
    return Obx(() => categoryController.skinCategoriesList.isNotEmpty
        ? CategoryGridView(
            cat: categoryController.skinCategoriesList,
          )
        : CategoryGridView(cat: skinCategory));
  }
}
