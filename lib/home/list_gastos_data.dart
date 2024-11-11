import 'package:exajovii/home/entities/gastos.dart';
import 'package:exajovii/home/gasto_details_screen.dart';
import 'package:flutter/material.dart';

class ListGastosData extends StatelessWidget {
  const ListGastosData({
    super.key,
    required this.gasto,
  });

  final Gasto gasto;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GastoDetails(gasto: gasto),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.money),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '\$${gasto.cantidad.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(gasto.descripcion),
              ],
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: gasto.cantidad < 500
                  ? Colors.green
                  : gasto.cantidad < 1000
                      ? Colors.orange
                      : Colors.red,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              gasto.cantidad < 500
                  ? 'Gasto bajo'
                  : gasto.cantidad < 1000
                      ? 'Cuidado'
                      : 'Gasto alto',
              style: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
