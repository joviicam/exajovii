import 'package:exajovii/home/entities/gastos.dart';
import 'package:flutter/material.dart';

class GastoDetails extends StatefulWidget {
  const GastoDetails({
    super.key,
    required this.gasto,
  });
  final Gasto gasto;

  @override
  State<GastoDetails> createState() => _GastoDetailsState();
}

class _GastoDetailsState extends State<GastoDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gasto.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: widget.gasto.cantidad < 500
                    ? Colors.green
                    : widget.gasto.cantidad < 1000
                        ? Colors.orange
                        : Colors.red,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                widget.gasto.cantidad < 500
                    ? 'Gasto bajo'
                    : widget.gasto.cantidad < 1000
                        ? 'Cuidado'
                        : 'Gasto alto',
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Image.asset('assets/default.png'),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${widget.gasto.nombre}: ${widget.gasto.cantidad}',
                    style: const TextStyle(fontSize: 12)),
              ],
            ),
            const SizedBox(height: 8),
            Text('Descripción: ${widget.gasto.descripcion}',
                style: const TextStyle(fontSize: 12)),
            const SizedBox(height: 8),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
