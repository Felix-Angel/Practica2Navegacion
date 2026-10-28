import 'package:flutter/material.dart';

//import 'demos/demo_routemaster.dart';

import 'demos/demo_fluro.dart';

//import 'demos/demo_qlevar.dart';

/// SELECTOR DE PRUEBAS EN BINAS (Descomenta solo la que vas a probar):
void main() {
  // PRUEBA 1: Routemaster (Librería 6 - Declarativo por URL)
  //runApp(AppRoutemaster());

  // PRUEBA 2: Fluro (Librería 7 - Handlers y Transiciones)
  runApp(const AppFluro());

  // PRUEBA 3: Qlevar Router (Librería 9 - Navegación sin context)
  // runApp(AppQlevar());
}
