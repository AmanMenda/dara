import 'package:flutter/material.dart';

Color getRatingColor({
  required double rating
}) {
    if (rating >= 4) return Colors.green;
    if (rating >= 2.5) return Colors.orange;
    return Colors.red;
  }

String getRatingComment({
  required double rating
}) {
  if (rating >= 4) return 'Excellent';
  if (rating >= 3) return 'Bon';
  if (rating >= 2) return 'Médiocre';
  return 'Mauvais';
}