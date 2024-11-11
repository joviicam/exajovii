//home donde se objtiene de la database
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exajovii/home/entities/gastos.dart';
import 'package:exajovii/home/list_gastos_data.dart';
import 'package:flutter/material.dart';

// AIzaSyC2Mr1BQcT0VrQYpZQxqV_xNi_6jfhgX3I
class GastosScreen extends StatefulWidget {
  const GastosScreen({super.key});

  @override
  State<GastosScreen> createState() => _GastosScreenState();
}

class _GastosScreenState extends State<GastosScreen> {
  final db = FirebaseFirestore.instance;
  List<Gasto> gastos = [];
  bool loading = true;

  @override
  initState() {
    super.initState();
    //loadRestaurants();
    db.collection("gastos").snapshots().listen((event) {
      gastos = [];
      for (var doc in event.docs) {
        final restaurant = Gasto(
          doc.data()["nombre"],
          doc.data()["cantidad"],
          doc.data()["descripcion"],
        );
        gastos.add(restaurant);
      }
      if (mounted) {
        setState(() {
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: gastos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListGastosData(gasto: gastos[index]);
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.amber,
        onPressed: () => Navigator.pushNamed(context, '/create'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
