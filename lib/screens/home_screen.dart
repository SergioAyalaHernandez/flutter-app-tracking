import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return Padding(
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
                    Text('Despacho número:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Quicksand')),
                    SizedBox(height: 4),
                    Container(
                        height: 2,
                        width: 90,
                        color: Color.fromARGB(255, 1, 14, 124)),
                    SizedBox(height: 4),
                    Text(despachoNumero,
                        style: TextStyle(fontSize: 16, fontFamily: 'Quicksand')),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showForm(context, despachoNumero);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 1, 14, 124),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: Text("Add", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showForm(BuildContext context, String despachoNumero) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Permite ajustar el tamaño según el teclado
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, top: 20),
        child: ReceperForm(despachoNumero: despachoNumero),
      ),
    );
  }
}

class ReceperForm extends StatelessWidget {
  final String despachoNumero;

  const ReceperForm({super.key, required this.despachoNumero});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Se ajusta al contenido
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Agregar Información',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 14, 124)),
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
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Cerrar formulario
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 1, 14, 124),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Center(
              child: Text("Guardar", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
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
              borderRadius: BorderRadius.circular(10)),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }
}
