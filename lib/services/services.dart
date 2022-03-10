import 'dart:convert';
import 'dart:io';

import 'package:bwafm/models/models.dart';
import 'package:http/http.dart' as https;
part 'user_services.dart';
part 'food_service.dart';
part 'transaction_services.dart';

String baseUrl = 'http://foodmarket-backend.buildwithangga.id/api/';
