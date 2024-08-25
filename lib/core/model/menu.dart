import 'package:flutter/material.dart';

class ProductCategory {
  final String label;
  final IconData icon;
  final String? banner;

  ProductCategory({
    required this.label,
    required this.icon,
    this.banner,
  });
}

List<ProductCategory> financialProducts = [
  ProductCategory(
    label: 'Urun',
    icon: Icons.new_releases,
    banner: "0",
  ),
  ProductCategory(
    label: 'Pembiayaan Porsi Haji',
    icon: Icons.attach_money,
  ),
  ProductCategory(
    label: 'Financial Check Up',
    icon: Icons.pie_chart,
  ),
  ProductCategory(
    label: 'Asuransi Mobil',
    icon: Icons.directions_car,
  ),
  ProductCategory(
    label: 'Asuransi Properti',
    icon: Icons.home,
  ),
];

List<ProductCategory> selectedCategories = [
  ProductCategory(
    label: 'Hobi',
    icon: Icons.palette,
    banner: "New",
  ),
  ProductCategory(
    label: 'Merchandise',
    icon: Icons.shopping_cart,
  ),
  ProductCategory(
    label: 'Gaya Hidup Sehat',
    icon: Icons.favorite,
  ),
  ProductCategory(
    label: 'Konseling & Rohani',
    icon: Icons.people,
  ),
  ProductCategory(
    label: 'Self Development',
    icon: Icons.book,
  ),
  ProductCategory(
    label: 'Perencanaan Keuangan',
    icon: Icons.money,
  ),
  ProductCategory(
    label: 'Konsultasi Medis',
    icon: Icons.medical_services,
  ),
  ProductCategory(
    label: 'Lihat Semua',
    icon: Icons.list,
  ),
];

List<ProductCategory> menuButtomNavigation = [
  ProductCategory(
    label: 'Beranda',
    icon: Icons.home,
  ),
  ProductCategory(
    label: 'Cari',
    icon: Icons.search,
  ),
  ProductCategory(
    label: 'Keranjang',
    icon: Icons.shopping_bag,
  ),
  ProductCategory(
    label: 'Konseling & Rohani',
    icon: Icons.people,
  ),
  ProductCategory(
    label: 'Self Development',
    icon: Icons.book,
  ),
  ProductCategory(
    label: 'Perencanaan Keuangan',
    icon: Icons.money,
  ),
  ProductCategory(
    label: 'Konsultasi Medis',
    icon: Icons.medical_services,
  ),
  ProductCategory(
    label: 'Lihat Semua',
    icon: Icons.list,
  ),
];
