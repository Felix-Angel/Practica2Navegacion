import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../screens/pantalla_detalle.dart';

class AppQlevar extends StatelessWidget {
  AppQlevar({super.key});

  final List<QRoute> routes = [
    QRoute(path: '/', builder: () => const InicioQlevar()),
    QRoute(
      path: '/detalle/:id',
      builder: () => PantallaDetalle(
        id: QR.params['id'].toString(),
        libreriaUsada: 'Qlevar Router (Librería 9)',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo Qlevar Router',
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: QRouterDelegate(routes),
    );
  }
}

class InicioQlevar extends StatelessWidget {
  const InicioQlevar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3. Demo Qlevar Router')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Abrir Detalle con Qlevar'),
          onPressed: () {
            // 👉 TU TURNO: Escribe QR.to(...) con la matrícula del INTEGRANTE 1 (¡SIN USAR context!)
            QR.to('/detalle/00000000');
          },
        ),
      ),
    );
  }
}
