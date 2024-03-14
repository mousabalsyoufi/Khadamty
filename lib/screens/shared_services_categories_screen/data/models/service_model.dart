import 'package:faciltateur_de_vies/constants/enums/categories_type.dart';
import 'package:faciltateur_de_vies/services/category_services.dart';
import 'package:flutter/material.dart';

class Service {
  final Color color;
  final String title;
  final String description;
  final double oldPrice;
  final double newPrice;
  final String image;
  final CategoryType categoryType;

  Service({
    required this.categoryType,
    required this.color,
    required this.title,
    required this.description,
    required this.oldPrice,
    required this.newPrice,
    required this.image});
}

List<Service> userServices = [

  Service(
      categoryType: CategoryType.home,
      color: CategoryService.getBasicColor(CategoryType.home),
          title: 'Household',
          description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
          oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),
  Service(
      categoryType: CategoryType.home,
      color: CategoryService.getBasicColor(CategoryType.home),
          title: 'Laundry',
          description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
          oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),

  Service(
      categoryType: CategoryType.family,
      color: CategoryService.getBasicColor(CategoryType.family),
      title: 'Laundry',
      description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
      oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),


  Service(
      categoryType: CategoryType.courses,
      color: CategoryService.getBasicColor(CategoryType.courses),
      title: 'Laundry',
      description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
      oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),


  Service(
      categoryType: CategoryType.outSide,
      color: CategoryService.getBasicColor(CategoryType.outSide),
      title: 'Laundry',
      description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
      oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),

  Service(
      categoryType: CategoryType.outSide,
      color: CategoryService.getBasicColor(CategoryType.outSide),
      title: 'Laundry',
      description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
      oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),

  Service(
      categoryType: CategoryType.offers,
      color: CategoryService.getBasicColor(CategoryType.offers),
      title: 'Laundry',
      description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
      oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),


  Service(
      categoryType: CategoryType.offers,
      color: CategoryService.getBasicColor(CategoryType.offers),
      title: 'Laundry',
      description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
      oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),


  Service(
      categoryType: CategoryType.offers,
      color: CategoryService.getBasicColor(CategoryType.offers),
      title: 'Laundry',
      description: "Maintenance of surfaces and floors, maintenance of sanitary facilities, cleaning of windows, emptying garbage cans, maintenance of household appliances, dishes.",
      oldPrice: 30.90, newPrice: 29.70,
      image:'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80'),




];