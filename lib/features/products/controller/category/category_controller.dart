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
  RxList skinCategoriesList = [].obs;
  RxList makeupCategoriesList = [].obs;
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
      print('imagefile..................... $imageFile');
// Upload image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('category_images')
          .child('${DateTime.now().millisecondsSinceEpoch}');
      print('imagefile.....................storage ref ');
      final uploadTask = storageRef.putFile(File(imageFile));
      print('imagefile..................... upload task');
      final snapshot = await uploadTask.whenComplete(() => null);
      print('imagefile..................... snapshot');
      final imageUrl = await snapshot.ref.getDownloadURL();
      print('imagefile..................... $imageUrl');

      await FirebaseFirestore.instance.collection('categories').add({
        'name': categoryName,
        'categoryType': selectedCategory.value.toString().split('.').last,
        'imageUrl': imageUrl,
      });
      print('Category saved to Firestore successfully!');
    } catch (e) {
      print('Error saving category to Firestore: $e');
    }
  }

  Future<void> fetchCategoryData() async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot =
          await db.collection('categories').get();

      final List<Category> fetchedcatlist = querySnapshot.docs
          .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
          .where((category) => category.categoryType == CategoryType.Hair)
          .toList();
      hairCategoriesList.assignAll(fetchedcatlist);

      print(
          'haircatlist$hairCategoriesList'); // Return true to indicate successful data fetching
      print('Hair category data fetched successfully!');
    } catch (e) {
      print('Error fetching hair category data: $e');
    }
  }

  Future<void> fetchCategoryDataskin() async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot =
          await db.collection('categories').get();

      final List<Category> fetchedcatlist = querySnapshot.docs
          .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
          .where((category) => category.categoryType == CategoryType.Skin)
          .toList();
      skinCategoriesList.assignAll(fetchedcatlist);

      print(
          'skincatlist$hairCategoriesList'); // Return true to indicate successful data fetching
      print('skin category data fetched successfully!');
    } catch (e) {
      print('Error fetching skin category data: $e');
    }
  }

  Future<void> fetchCategoryDatamakeup() async {
    try {
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final QuerySnapshot querySnapshot =
          await db.collection('categories').get();

      final List<Category> fetchedcatlist = querySnapshot.docs
          .map((doc) => Category.fromJson(doc.data() as Map<String, dynamic>))
          .where((category) => category.categoryType == CategoryType.Makeup)
          .toList();
      makeupCategoriesList.assignAll(fetchedcatlist);

      print(
          'makeupcatlist$hairCategoriesList'); // Return true to indicate successful data fetching
      print('makeup category data fetched successfully!');
    } catch (e) {
      print('Error fetching makeup category data: $e');
    }
  }
}
