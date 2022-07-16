import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keymo_flutter/model/user.dart';

final userProvider = StateProvider<User>((ref) => User(keywordList: []));
