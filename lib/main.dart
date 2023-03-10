

import 'package:flutter/material.dart';
import 'package:mero_gahana/app/routes.dart';
import 'package:mero_gahana/helper/objectbox.dart';
import 'package:mero_gahana/state/objectbox_state.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  // ObjectBoxState.objectBoxInstance = await ObjectBoxInstance.init();

  runApp(const MyApp(),
  );
}
