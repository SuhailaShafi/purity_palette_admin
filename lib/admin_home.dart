import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:purity_admin/features/products/view/category/category.dart';
import 'package:purity_admin/features/products/view/category/widgets/add_category.dart';
import 'package:purity_admin/features/products/view/product_home.dart';
import 'package:purity_admin/utils/constants/colors.dart';
import 'package:purity_admin/utils/helpers/helper_function.dart';

class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkmode = SHelperFunction.isDarkMode(context);
    return Scaffold(
      floatingActionButton: Obx(
        () => Container(
          width: 100,
          child: FloatingActionButton(
            onPressed: () {
              {
                _navigateToSelectedPage(context, controller.selected.value);
              }
            },
            child: _buildFabIcon(controller.selected.value),
            backgroundColor: SColors.primary,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selected.value,
          onDestinationSelected: (index) => controller.selected.value = index,
          indicatorColor: darkmode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          backgroundColor: darkmode
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Products'),
            NavigationDestination(
                icon: Icon(Iconsax.category), label: 'Category'),
            NavigationDestination(icon: Icon(Iconsax.barcode), label: 'Brands'),
            NavigationDestination(
                icon: Icon(Iconsax.percentage_circle), label: 'Offers'),
            NavigationDestination(icon: Icon(Iconsax.receipt), label: 'Orders'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selected.value]),
    );
  }

  void _navigateToSelectedPage(BuildContext context, int selectedIndex) {
    switch (selectedIndex) {
      case 0: //products
      //Get.to(() => AddCategory());
      case 1: // Category
        Get.to(() => const AddCategory());
        break;
      case 2: // Brands
        //Get.to(AddCategory());
        break;
      default: // Products
        //Get.to(AddCategory());
        break;
    }
  }

  Widget _buildFabIcon(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const Row(
          children: [
            Icon(Iconsax.add),
            Flexible(
              child: Text('Add Product',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle() // Adjust font size as needed
                  ),
            ),
          ],
        );
      case 1: // Category
        return const Row(
          children: [
            Icon(Iconsax.add),
            Flexible(
              child: Text('Add Category',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle() // Adjust font size as needed
                  ),
            ),
          ],
        );
      case 2: // Brands
        return const Row(
          children: [
            Icon(Iconsax.add),
            Flexible(
              child: Text('Add Brand',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle() // Adjust font size as needed
                  ),
            ),
          ],
        );
      case 3:
        return const Row(
          children: [
            Icon(Iconsax.add),
            Flexible(
              child: Text('Add Offer',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle() // Adjust font size as needed
                  ),
            ),
          ],
        );
      case 4:
        return const Row(
          children: [
            Icon(Iconsax.tag),
            Flexible(
              child: Text('Sales Report',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle() // Adjust font size as needed
                  ),
            ),
          ],
        );
      default: // Products
        return const Icon(Icons.add);
    }
  }
}

class NavigationController extends GetxController {
  final Rx<int> selected = 0.obs;
  final screens = [
    ProductHome(),
    const CategoryHome(),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    )
  ];
}
