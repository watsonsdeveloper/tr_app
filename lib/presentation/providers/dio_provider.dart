import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tr_app/utils/dio_extension.dart';

var dioProvider = Provider<Dio>((ref) => DioExtension());
