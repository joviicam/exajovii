import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GastoCreate extends StatefulWidget {
  const GastoCreate({super.key});

  @override
  _GastoCreateState createState() => _GastoCreateState();
}

class _GastoCreateState extends State<GastoCreate> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _descriptionController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      try {
        // Guardar datos en Firestore
        await FirebaseFirestore.instance.collection('gastos').add({
          'nombre': _nombreController.text,
          'cantidad': double.parse(_cantidadController.text),
          'descripcion': _descriptionController.text,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Gasto guardado exitosamente')),
        );

        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al guardar: $e')),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear gasto'),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre del gasto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la descripción';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _cantidadController,
                decoration: const InputDecoration(labelText: 'Canntidad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese la cantidad';
                  }
                  final pricePattern = RegExp(r'^\d+(\.\d{1,2})?$');
                  if (!pricePattern.hasMatch(value)) {
                    return 'Ingrese un precio válido (ej: 200 o 200.00)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text('Guardar Gasto'),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// componente de la lista de restaurantes
