import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Despachos",  style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 1, 14, 124),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _RecipesCard(context, 'INT-12345678'),
          _RecipesCard(context, 'INT-87654321'),
          _RecipesCard(context, 'INT-56781234'),
        ],
      ),
    );
  }

  Widget _RecipesCard(BuildContext context, String despachoNumero) {
    return GestureDetector(
      onTap: () {
        // Navegar a la nueva pantalla en lugar de abrir un modal
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ReceperFormScreen(despachoNumero: despachoNumero),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/a.png',
                    width: 20,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Despacho número:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        height: 2,
                        width: 90,
                        color: Color.fromARGB(255, 1, 14, 124),
                      ),
                      SizedBox(height: 4),
                      Text(
                        despachoNumero,
                        style: TextStyle(fontSize: 16, fontFamily: 'Quicksand'),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 1, 14, 124))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReceperFormScreen extends StatelessWidget {
  final String despachoNumero;

  const ReceperFormScreen({super.key, required this.despachoNumero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalles del Despacho",  style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 1, 14, 124),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Agregar Información',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 14, 124),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Despacho: $despachoNumero",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildTextField(label: 'Nombre de la receta'),
            _buildTextField(label: 'Descripción', isMultiline: true),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Cerrar pantalla
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 1, 14, 124),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text("Guardar", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, bool isMultiline = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        maxLines: isMultiline ? 4 : 1,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
