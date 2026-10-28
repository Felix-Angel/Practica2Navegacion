import 'package:flutter/material.dart';

class PantallaDetalle extends StatelessWidget {
  final String id;
  final String libreriaUsada;
  final String? carrera; // Para el reto de la bina

  const PantallaDetalle({
    super.key,
    required this.id,
    required this.libreriaUsada,
    this.carrera,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalle - $libreriaUsada')),
      // 👉 SingleChildScrollView permite desplazamiento y previene el error de desbordamiento (RenderFlex overflowed)
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.school, size: 80, color: Colors.indigo),
              const SizedBox(height: 16),
              Text(
                'Librería: $libreriaUsada',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Parámetro recibido (Matrícula):',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 6),
              Text(
                id,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              if (carrera != null) ...[
                const SizedBox(height: 14),
                const Text(
                  'Carrera (Reto de la Bina):',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  carrera!,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
              const SizedBox(height: 28),
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).maybePop(),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Regresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
