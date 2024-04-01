import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purity_admin/features/products/controller/category/category_controller.dart';
import 'package:purity_admin/features/products/model/category/category_model.dart';
import 'package:purity_admin/features/products/view/category/category.dart';
import 'package:purity_admin/features/products/view/category/widgets/radiobutton_category.dart';
import 'package:purity_admin/utils/constants/colors.dart';
import 'package:purity_admin/utils/constants/sizes.dart';

// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, no_leading_underscores_for_local_identifiers, unused_import
class AddCategory extends StatelessWidget {
  const AddCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final _nameEditingController = TextEditingController();
    final ImagePicker _picker = ImagePicker();
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Center(
              child: Obx(
                () => GestureDetector(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: SColors.backgroundPurple,
                        image: categoryController.selectedImage.value.path == ''
                            ? null
                            : DecorationImage(
                                image: FileImage(
                                    categoryController.selectedImage.value),
                                fit: BoxFit.cover,
                              ),
                      ),
                      child: categoryController.selectedImage.value.path == ''
                          ? const Icon(
                              Icons.add,
                              size: 100,
                            )
                          : null,
                    ),
                    onTap: () {
                      categoryController.imagePicker();
                    }),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RadioButton(
                    title: 'Makeup',
                    type: CategoryType.Makeup,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  RadioButton(title: 'Skin', type: CategoryType.Skin),
                  SizedBox(
                    width: 10,
                  ),
                  RadioButton(title: 'Hair', type: CategoryType.Hair)
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  maxLength: 16,
                  controller: _nameEditingController,
                  decoration: const InputDecoration(
                    hintText: 'Category name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            //Buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: OutlinedButton(
                            onPressed: () {
                              Get.off(AddCategory());
                            },
                            child: Text('Cancel'))),
                    Padding(padding: EdgeInsets.all(SSizes.defaultSpace)),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Get category name from text field
                          final categoryName = _nameEditingController.text;
                          // Get image URL from the selected image file
                          final imagePath =
                              categoryController.selectedImage.value.path;
                          print('imagepath add $imagePath');
                          // You need to upload the image to a storage service (e.g., Firebase Storage) and get the URL
                          // Save category data to Firestore
                          categoryController.saveCategoryToFirestore(
                              categoryName, imagePath);
                          Get.offAll(() => CategoryHome());
                        },
                        child: const Text('Add Category'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
