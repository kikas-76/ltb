import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DocumentReference? convertCatIdToRef(String? docID) {
  // convert document ID of 'categories" collection into a document reference
  if (docID == null) return null;
  return FirebaseFirestore.instance.collection('categories').doc(docID);
}

int? calculateDaysBetween(
  DateTime startDate,
  DateTime endDate,
) {
  int? calculateDaysBetween(
    DateTime? startDate, // ← ajoute le ?
    DateTime? endDate, // ← ajoute le ?
  ) {
    // Sécurité si pas encore sélectionné
    if (startDate == null || endDate == null) return 0;

    DateTime start = DateTime(startDate.year, startDate.month, startDate.day);
    DateTime end = DateTime(endDate.year, endDate.month, endDate.day);

    Duration difference = end.difference(start);

    if (difference.inDays < 0) return 0;

    return difference.inDays;
  }
}

double? calculateOwnerNet(
  double? basePricePerDay,
  int? days,
) {
// 1. Sécurité anti-crash : si un champ est vide ou à zéro, on renvoie 0
  if (basePricePerDay == null ||
      days == null ||
      days <= 0 ||
      basePricePerDay <= 0) {
    return 0.0;
  }

  // 2. Détermination du taux de réduction (La dégressivité)
  double discountRate = 0.0;
  if (days >= 7) {
    discountRate = 0.20; // -20% pour une semaine ou plus
  } else if (days >= 3) {
    discountRate = 0.10; // -10% pour 3 à 6 jours
  }

  // 3. Calcul du prix brut total (Ce que le locataire va payer)
  double discountedDailyPrice = basePricePerDay * (1 - discountRate);
  double totalGrossRevenue = discountedDailyPrice * days;

  // 4. Calcul de la commission de Louetonbien (10%)
  double platformCommission = totalGrossRevenue * 0.10;

  // 5. Application du plancher de sécurité (1,25 € minimum)
  if (platformCommission < 1.25) {
    platformCommission = 1.25;
  }

  // 6. Calcul final du revenu net du propriétaire
  double netRevenue = totalGrossRevenue - platformCommission;

  // 7. Arrondi strict à 2 décimales pour un affichage propre en euros
  return double.parse(netRevenue.toStringAsFixed(2));
}

String calculateTotalPrice(
  DateTime startDate,
  DateTime endDate,
  double pricePerDay,
) {
  // 01/01/2000 = valeur par défaut = pas de dates sélectionnées
  final defaultDate = DateTime(2000, 1, 1);

  if (startDate.isAtSameMomentAs(defaultDate) ||
      endDate.isAtSameMomentAs(defaultDate)) {
    return '-';
  }

  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final end = DateTime(endDate.year, endDate.month, endDate.day);
  final days = end.difference(start).inDays;

  if (days <= 0) return '-';
  if (days > 7) return 'Max 7 jours';

  double total = days * pricePerDay;

// Appliquer les remises
  if (days >= 7) {
    total = total * 0.80; // -20%
  } else if (days >= 3) {
    total = total * 0.90; // -10%
  }

  return '${total.toStringAsFixed(0)}€';
}

String? formatDateFr(DateTime date) {
  const mois = [
    'janvier',
    'février',
    'mars',
    'avril',
    'mai',
    'juin',
    'juillet',
    'août',
    'septembre',
    'octobre',
    'novembre',
    'décembre'
  ];
  const jours = [
    'lundi',
    'mardi',
    'mercredi',
    'jeudi',
    'vendredi',
    'samedi',
    'dimanche'
  ];

  final jour = jours[date.weekday - 1];
  final num = date.day;
  final m = mois[date.month - 1];

  return '$jour $num $m';
}

String memberSince(DateTime? createdTime) {
  if (createdTime == null) {
    return 'Nouveau membre';
  }

  final months = [
    'janvier',
    'février',
    'mars',
    'avril',
    'mai',
    'juin',
    'juillet',
    'août',
    'septembre',
    'octobre',
    'novembre',
    'décembre'
  ];

  return 'Membre depuis ${months[createdTime.month - 1]} ${createdTime.year}';
}

String? getDiscountLabel(
  DateTime? startDate,
  DateTime? endDate,
) {
  if (startDate == null || endDate == null) return null;

  final defaultDate = DateTime(2000, 1, 1);
  if (startDate.isAtSameMomentAs(defaultDate) ||
      endDate.isAtSameMomentAs(defaultDate)) {
    return null;
  }

  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final end = DateTime(endDate.year, endDate.month, endDate.day);
  final days = end.difference(start).inDays;

  if (days >= 7) return '-20% appliqué';
  if (days >= 3) return '-10% appliqué';
  return null;
}

String? calculatePriceBeforeDiscount(
  DateTime? startDate,
  DateTime? endDate,
  double? pricePerDay,
) {
  if (startDate == null || endDate == null || pricePerDay == null) {
    return null;
  }

  final defaultDate = DateTime(2000, 1, 1);

  if (startDate.isAtSameMomentAs(defaultDate) ||
      endDate.isAtSameMomentAs(defaultDate)) {
    return null;
  }

  final start = DateTime(startDate.year, startDate.month, startDate.day);
  final end = DateTime(endDate.year, endDate.month, endDate.day);
  final days = end.difference(start).inDays;

  if (days <= 0) return null;

  if (days >= 3) {
    return '${(days * pricePerDay).toStringAsFixed(0)}€';
  }

  return null;
}
