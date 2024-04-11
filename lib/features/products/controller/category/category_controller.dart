import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:purity_admin/features/products/model/category/category_model.dart';

class CategoryController extends GetxController {
  var selectedCategory = CategoryType.Makeup.obs;
  var categories = <CategoryType>[].obs;
  RxList hairCategoriesList = [].obs;
  Rx<File> selectedImage = File('').obs; // Store the selected image file
  Rx<CategoryType> selectedType = CategoryType.Hair.obs;
  void setSelectedCategory(CategoryType category) {
    selectedCategory.value = category;
  }

  void addCategory(CategoryType category) {
    categories.add(category);
  }

  Future imagePicker() async {
    try {
      final imagePick =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePick == null) {
        return;
      }
      final imageTemp = File(imagePick.path);
      selectedImage.value = imageTemp;
    } on PlatformException catch (e) {
      return e;
    }
  }

  // Save category data to Firebase Firestore

  Future<void> saveCategoryToFirestore(
      String categoryName, String imageFile) async {
    try {
// Upload image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('category_images')
          .child('${DateTime.now().millisecondsSinceEpoch}');

      final uploadTask = storageRef.putFile(File(imageFile));
      final snapshot = await uploadTask.whenComplete(() => null);
      final imageUrl = await snapshot.ref.getDownloadURL();

      // Generate a unique ID for the category
      String categoryId =
          FirebaseFirestore.instance.collection('categories').doc().id;

      await FirebaseFirestore.instance
          .collection('categories')
          .doc(categoryId)
          .set({
        'id': categoryId,
        'name': categoryName,
        'categoryType': selectedCategory.value.toString().split('.').last,
        'imageUrl': imageUrl,
      });
      print('Category saved to Firestore successfully!');
    } catch (e) {
      print('Error saving category to Firestore: $e');
    }
  }

  Future<void> fetchCategoryData(CategoryType selectedType) async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot =
          await db.collection('categories').get();

      final List<Category> fetchedcatlist = querySnapshot.docs
          .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
          .where((category) => category.categoryType == selectedType)
          .toList();
      hairCategoriesList.assignAll(fetchedcatlist);

      print(
          'haircatlist$hairCategoriesList'); // Return true to indicate successful data fetching
      print('Hair category data fetched successfully!');
    } catch (e) {
      print('Error fetching hair category data: $e');
    }
  }

  // Method to delete a category
  Future<void> deleteCategory(int id) async {
    try {
      print("deleted Id is ${id.toString()}");
      await FirebaseFirestore.instance
          .collection('categories')
          .doc(id.toString())
          .delete();
      // Remove the deleted category from the list
      //hairCategoriesList.remove(category);
      print('Category deleted successfully!');
    } catch (e) {
      print('Error deleting category: $e');
    }
  }
}
