import 'package:flutter/foundation.dart';

class CarItem {
  final String title;
  final double price;
  final String path;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;

  CarItem(
      {required this.title,
      required this.price,
      required this.path,
      required this.color,
      required this.gearbox,
      required this.fuel,
      required this.brand});
}

CarsList allCars = CarsList(cars: [
  CarItem(
      title: 'Datsun-Go',
      price: 20,
      color: 'Orange',
      gearbox: '4',
      fuel: '4L',
      brand: 'Honda',
      path: 'assets/datsun-go.jpg'),
  CarItem(
      title: 'Hyundai Creta',
      price: 22,
      color: 'Black',
      gearbox: '6',
      fuel: '19L',
      brand: 'Hyundai',
      path: 'assets/hyundai_creta.jpg'),
  CarItem(
      title: 'Kia Sonet',
      price: 25,
      color: 'Red',
      gearbox: '5',
      fuel: '6L',
      brand: 'Mercedes',
      path: 'assets/kia_sonet.jpg'),
  CarItem(
      title: 'Maruti Dzire',
      price: 19,
      color: 'Grey',
      gearbox: '5',
      fuel: '6L',
      brand: 'Audi',
      path: 'assets/maruti-dzire.jpg'),
  CarItem(
      title: 'Alto K10',
      price: 18,
      color: 'White',
      gearbox: '6',
      fuel: '10L',
      brand: 'Jaguar',
      path: 'assets/maruti_suzuki_alto_k10.jpg'),
  CarItem(
      title: 'Maruti suzuki Brezza',
      price: 24,
      color: 'Grey',
      gearbox: '6',
      fuel: '6L',
      brand: 'BMW',
      path: 'assets/maruti_suzuki_brezza.jpg'),
  CarItem(
      title: 'Maruti Suzuki Eeco',
      price: 15,
      color: 'Grey',
      gearbox: '6',
      fuel: '6L',
      brand: 'BMW',
      path: 'assets/maruti_suzuki_eeco.jpg'),
  CarItem(
      title: 'Toyota Urban Cruiser',
      price: 30,
      color: 'Grey',
      gearbox: '6',
      fuel: '6L',
      brand: 'BMW',
      path: 'assets/toyota_urban_cruiser_hyryder.jpg'),
  CarItem(
      title: 'Maruti suzuki swift',
      price: 18,
      color: 'Grey',
      gearbox: '6',
      fuel: '6L',
      brand: 'BMW',
      path: 'assets/maruti_suzuki_swift.jpg'),
  CarItem(
      title: 'Renault Kwid-zw',
      price: 21,
      color: 'Grey',
      gearbox: '6',
      fuel: '6L',
      brand: 'BMW',
      path: 'assets/renauit_kwid-zw.jpg'),
]);

class CarsList {
  List<CarItem> cars;

  CarsList({required this.cars});
}
