import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dara/services/base.service.dart';
import 'package:flutter/material.dart';

class HistoryService extends BaseService {
  Future<bool> saveProductInHistory() async {
    CollectionReference history = FirebaseFirestore.instance.collection('history');
    
    try {
      await history.add({
        'barcode': '1234567890',
        'productName': 'Smartphone XYZ',
        'brand': 'TechBrand',
        'timeSinceScanned': 'il y a 2 jours',
        'rating': 4.2,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}