import 'package:flutter/material.dart';
import 'package:purity_admin/features/products/view/products/product_list/product_list.dart';

class ProductHome extends StatefulWidget {
  @override
  _ProductHomeState createState() => _ProductHomeState();
}

class _ProductHomeState extends State<ProductHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(vsync: this, length: 3); // Define the number of tabs
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Purity Palette'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Makeup'),
            Tab(text: 'Skin'),
            Tab(text: 'Hair'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: ProductListScreen()),
          Center(child: ProductListScreen()),
          Center(child: ProductListScreen()),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
