import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purity_admin/features/products/controller/category/category_controller.dart';
import 'package:purity_admin/features/products/model/category/category_model.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key, this.cat});
  final cat;
  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = Get.put(CategoryController());
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 20.0, // Spacing between columns
        mainAxisSpacing: 20.0, // Spacing between rows
        childAspectRatio: 1.0, // Aspect ratio of each grid item
      ),
      itemBuilder: (context, index) {
        final category = cat[index];
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Use category properties to display data
              Image.network(
                category
                    .imageUrl, // Assuming imageUrl property is available in CategoryType
                width: MediaQuery.of(context).size.width * 0.3,
                height: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(category.name),
                    IconButton(
                      onPressed: () {
                        print(
                            'catId is ${category.id} name is ${category.name}');
                        categoryController.deleteCategory(category.id);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ), // Assuming name property is available in CategoryType
              // Add other widgets as needed
            ],
          ),
        );
      },
      itemCount: cat.length,
    );
  }
}
