// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:purity_admin/features/products/model/category/category_model.dart';
import 'package:purity_admin/features/products/view/category/widgets/hair_category_list.dart';
import 'package:purity_admin/features/products/view/category/widgets/makeup_category_list.dart';
import 'package:purity_admin/features/products/view/category/widgets/skin_category_list.dart';
import 'package:purity_admin/utils/constants/colors.dart';

final makeupCategories = [
  Category(
      id: 1,
      name: 'Lipstick',
      categoryType: CategoryType.Makeup,
      isDeleted: false,
      imageUrl: 'assets/images/logo_light.jpg'),
  Category(
      id: 2,
      name: 'Primer',
      categoryType: CategoryType.Makeup,
      isDeleted: false,
      imageUrl: 'assets/images/logo_light.jpg'),
];

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

class CategoryHome extends StatefulWidget {
  const CategoryHome({super.key});

  @override
  State<CategoryHome> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  int indexTypeColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SColors.primary,
        title: topBar(),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          tabs: const [
            Tab(
              child: Text(
                'Makeup',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Tab(
              child: Text(
                'Skin',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Tab(
              text: 'Hair',
            ),
          ],
        ),
      ),
      extendBody: true,
      backgroundColor: SColors.backgroundWhite,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  MakeuppCatList(),
                  SkinCatList(),
                  HairCatList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding topBar() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Category',
            //style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
