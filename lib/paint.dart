import 'package:EduVerso/canvas.dart';
import 'package:EduVerso/client.dart';
import 'package:flutter/material.dart';

class PaintPage extends StatefulWidget {
  PaintPage({Key? key}) : super(key: key);

  @override
  State<PaintPage> createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  final List<Offset> points = [];
  final GlobalKey key = GlobalKey();
  late Sockets socket;

  @override
  void initState() {
    super.initState();
    socket = Sockets();

    Future.delayed(const Duration(seconds: 5)).then(
      (_) => socket.clearCanvas().listen((event) {
        points.clear();
      }),
    );
  }

  void _addPointsForCurrentFrame(Offset globalPosition) {
    final RenderBox? renderBox =
        key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final Offset offset = renderBox.globalToLocal(globalPosition);
      socket.emitPaint(offset.dx, offset.dy);
    } else {
      final Offset? offset = renderBox?.globalToLocal(globalPosition);
      if (offset != null) {
        socket.emitPaint(offset.dx, offset.dy);
      }
    }
  }

  void _finishLine() {
    socket.emitEndLine();
  }

  void _clearCanvas() {
    socket.emitClearCanvas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EduVerso'),
      ),
      body: Center(
        child: Container(
          key: key,
          color: Colors.grey[200],
          height: MediaQuery.of(context).size.height - 200,
          width: MediaQuery.of(context).size.width - 50,
          child: GestureDetector(
            onPanDown: (details) {
              _addPointsForCurrentFrame(details.globalPosition);
            },
            onPanUpdate: (details) {
              _addPointsForCurrentFrame(details.globalPosition);
            },
            onPanEnd: (_) {
              _finishLine();
            },
            child: StreamBuilder<Offset>(
              stream: socket.receivedPaint(),
              builder: (BuildContext context, AsyncSnapshot<Offset> snapshot) {
                if (snapshot.hasData) {
                  // Convertir Offset? a Offset, utilizando el operador '??' para proporcionar un valor predeterminado en caso de que sea nulo.
                  Offset offset = snapshot.data ?? Offset.zero;
                  points.add(offset);
                }

                return CustomPaint(
                  painter: Painter(offsets: points, drawColor: Colors.red),
                );
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _clearCanvas,
        tooltip: 'Borrar',
        child: Icon(Icons.delete),
      ),
    );
  }
}
