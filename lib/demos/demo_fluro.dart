import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../screens/pantalla_detalle.dart';

class AppFluro extends StatefulWidget {
  const AppFluro({super.key});

  @override
  State<AppFluro> createState() => _AppFluroState();
}

class _AppFluroState extends State<AppFluro> {
  final FluroRouter router = FluroRouter();

  @override
  void initState() {
    super.initState();
    _configurarRutas();
  }

  void _configurarRutas() {
    router.define(
      '/',
      handler: Handler(handlerFunc: (context, params) => const InicioFluro()),
    );

    router.define(
      '/detalle/:id',
      transitionType: TransitionType.inFromRight, // Animación lateral
      handler: Handler(
        handlerFunc: (context, params) {
          final id = params['id']?.first ?? 'Sin ID';

          // 👉 PASO 5: Recupera la carrera del Query Parameter y se la pasa a PantallaDetalle
          final carrera = params['carrera']?.first ?? 'Sin Carrera';
          return PantallaDetalle(
            id: id,
            libreriaUsada: 'Fluro (Librería 7)',
            carrera: carrera,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Fluro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/',
      onGenerateRoute: router.generator,
    );
  }
}

// 👉 PASO 1: Ahora es un StatefulWidget para usar el controlador
class InicioFluro extends StatefulWidget {
  const InicioFluro({super.key});

  @override
  State<InicioFluro> createState() => _InicioFluroState();
}

class _InicioFluroState extends State<InicioFluro> {
  // 👉 PASO 1: Controlador para capturar el texto
  final TextEditingController _matriculaController = TextEditingController();

  @override
  void dispose() {
    _matriculaController.dispose(); // Libera la memoria
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2. Demo Fluro')),
      // 👉 PASO 2: SingleChildScrollView para que el teclado no cause overflow
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 👉 PASO 2: Widget TextField interactivo
              TextField(
                controller: _matriculaController,
                decoration: const InputDecoration(
                  labelText: 'Escribe tu Número de Control',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.badge),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Abrir Detalle con Fluro'),
                onPressed: () {
                  final matricula = _matriculaController.text.trim();

                  // 👉 PASO 3: Validación con SnackBar si está vacío
                  if (matricula.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('⚠️ Por favor escribe tu matrícula'),
                      ),
                    );
                    return; // Detiene la navegación
                  }

                  // 👉 PASO 4: Navega dinámicamente con lo que escribió el usuario + Query Parameter
                  Navigator.pushNamed(
                    context,
                    '/detalle/$matricula?carrera=Ingenieria en Sistemas',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
