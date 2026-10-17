
import 'package:flutter_test/flutter_test.dart';
import 'package:loteria_dh/logica/baraja.dart';
import 'package:loteria_dh/logica/tabla.dart';
import 'package:loteria_dh/logica/motor_juego.dart';

void main() {
  test('detecta ganador al completar una fila', () {
    final cartas =
        Baraja.crearBarajaCompleta().cartasRestantes;

    final tabla = Tabla.desdeFilas([
      cartas.sublist(0, 4),
      cartas.sublist(4, 8),
      cartas.sublist(8, 12),
      cartas.sublist(12, 16),
    ]);

    final baraja = Baraja.desdeCartas([
      cartas[3],
      cartas[2],
      cartas[1],
      cartas[0],
    ]);

    final juego = MotorJuego(
      baraja: baraja,
      tabla: tabla,
    );

    juego.cantarYMarcar();
    juego.cantarYMarcar();
    juego.cantarYMarcar();
    juego.cantarYMarcar();

    expect(juego.haGanado, true);
  });

  test('no declara ganador con solo dos cartas', () {
    final cartas =
        Baraja.crearBarajaCompleta().cartasRestantes;

    final tabla = Tabla.desdeFilas([
      cartas.sublist(0, 4),
      cartas.sublist(4, 8),
      cartas.sublist(8, 12),
      cartas.sublist(12, 16),
    ]);

    final baraja = Baraja.desdeCartas([
      cartas[1],
      cartas[0],
    ]);

    final juego = MotorJuego(
      baraja: baraja,
      tabla: tabla,
    );

    juego.cantarYMarcar();
    juego.cantarYMarcar();

    expect(juego.haGanado, false);
  });
}
