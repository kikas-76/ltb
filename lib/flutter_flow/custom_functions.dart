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
  double? calculateOwnerNet(
    double? basePricePerDay,
    DateTime? startDate,
    DateTime? endDate,
  ) {
    // 1. Sécurité anti-crash
    if (basePricePerDay == null ||
        startDate == null ||
        endDate == null ||
        basePricePerDay <= 0) {
      return 0.0;
    }

    // 2. Calcul du nombre de jours
    int days = endDate.difference(startDate).inDays;
    if (days <= 0) return 0.0;

    // 3. Détermination du taux de réduction
    double discountRate = 0.0;
    if (days >= 7) {
      discountRate = 0.20;
    } else if (days >= 3) {
      discountRate = 0.10;
    }

    // 4. Calcul du prix brut total
    double discountedDailyPrice = basePricePerDay * (1 - discountRate);
    double totalGrossRevenue = discountedDailyPrice * days;

    // 5. Commission plateforme (10%, min 1.25€)
    double platformCommission = totalGrossRevenue * 0.10;
    if (platformCommission < 1.25) {
      platformCommission = 1.25;
    }

    // 6. Revenu net
    return double.parse(
        (totalGrossRevenue - platformCommission).toStringAsFixed(2));
  }
}

double? calculateTotalPriceFromDates(
  double? basePricePerDay,
  DateTime? startDate,
  DateTime? endDate,
) {
  double? calculateOwnerNetFromDates(
    double? basePricePerDay,
    DateTime? startDate,
    DateTime? endDate,
  ) {
    if (basePricePerDay == null ||
        startDate == null ||
        endDate == null ||
        basePricePerDay <= 0) {
      return 0.0;
    }

    int days = endDate.difference(startDate).inDays;
    if (days <= 0) return 0.0;

    double discountRate = 0.0;
    if (days >= 7) {
      discountRate = 0.20;
    } else if (days >= 3) {
      discountRate = 0.10;
    }

    double discountedDailyPrice = basePricePerDay * (1 - discountRate);
    double totalGrossRevenue = discountedDailyPrice * days;

    double platformCommission = totalGrossRevenue * 0.10;
    if (platformCommission < 1.25) {
      platformCommission = 1.25;
    }

    return double.parse(
        (totalGrossRevenue - platformCommission).toStringAsFixed(2));
  }
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

double? calculatePayout(double? totalPrice) {
  String? calculatePayout(
    double? totalPrice,
  ) {
    if (totalPrice == null || totalPrice <= 0) {
      return '0';
    }

    double commission = totalPrice * 0.10;
    if (commission < 1.25) {
      commission = 1.25;
    }

    double payout = totalPrice - commission;
    return payout.toStringAsFixed(2);
  }
}

String? testCalcul(
  double? price,
  DateTime? start,
  DateTime? end,
) {
  String? testCalcul2(
    double? price,
    DateTime? start,
    DateTime? end,
  ) {
    try {
      if (price == null) return 'price null';
      if (start == null) return 'start null';
      if (end == null) return 'end null';
      int days = end.difference(start).inDays;
      return 'price=$price days=$days';
    } catch (e) {
      return 'ERROR: ${e.toString()}';
    }
  }
}
