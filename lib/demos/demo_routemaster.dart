import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import '../screens/pantalla_detalle.dart';

class AppRoutemaster extends StatelessWidget {
  AppRoutemaster({super.key});

  final routes = RouteMap(
    routes: {
      '/': (_) => const MaterialPage(child: InicioRoutemaster()),
      '/detalle/:id': (info) => MaterialPage(
        child: PantallaDetalle(
          id: info.pathParameters['id'] ?? 'Sin ID',
          libreriaUsada: 'Routemaster (Librería 6)',
        ),
      ),
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo Routemaster',
      routerDelegate: RoutemasterDelegate(routesBuilder: (_) => routes),
      routeInformationParser: const RoutemasterParser(),
    );
  }
}

class InicioRoutemaster extends StatelessWidget {
  const InicioRoutemaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('1. Demo Routemaster')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Abrir Detalle con Routemaster'),
          onPressed: () {
            // 👉 TU TURNO: Cambia '00000000' por la matrícula del INTEGRANTE 1
            Routemaster.of(context).push('/detalle/00000000');
          },
        ),
      ),
    );
  }
}
