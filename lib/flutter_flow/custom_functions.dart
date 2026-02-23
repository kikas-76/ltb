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
// 1. On nettoie les dates pour ne garder que l'année, le mois et le jour (on vire les heures)
  // Cela évite les bugs si une résa commence à 14h et finit à 10h le lendemain
  DateTime start = DateTime(startDate.year, startDate.month, startDate.day);
  DateTime end = DateTime(endDate.year, endDate.month, endDate.day);

  // 2. On calcule la différence
  Duration difference = end.difference(start);

  // 3. Sécurité : Si c'est négatif, on renvoie 0
  if (difference.inDays < 0) {
    return 0;
  }

  // 4. On renvoie le nombre de jours
  return difference.inDays;
}

int? calculDuration(
  DateTime startDate,
  DateTime endDate,
) {
  // calcul la différence entre deux dates que je te fournis, en nombre de jour
  int? calculDuration(DateTime startDate, DateTime endDate) {
    int daysBetween = calculateDaysBetween(startDate, endDate) ?? 0;
    return daysBetween;
  }
}
