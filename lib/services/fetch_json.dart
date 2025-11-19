import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class FetchJson {
  Future<Map<String, dynamic>?> fetchJson(String url) async {
    try {
      final response = await Dio().get(url);

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          return response.data;
        } else {
          return jsonDecode(response.data);
        }
      }
    } catch (e) {
      Text(e.toString());
    }

    return null;
  }
}
