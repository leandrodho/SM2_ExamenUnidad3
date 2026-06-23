import 'package:flutter_test/flutter_test.dart';
import 'package:proyecto_safearea/models/report_model.dart';

void main() {
  group('Pruebas Unitarias del Modelo de Reportes (Carpeta lib) - SafeArea', () {
    
    test('1. Debe instanciar un Report correctamente con sus propiedades reales', () {
      final report = Report(
        id: 'test_id_123',
        title: 'Terremoto en plaza central',
        description: 'Muchos ciudadanos heridos',
        location: 'Plaza de Armas, Tacna',
        type: 'emergencia',
        status: 'pendiente',
        userId: 'user_tacna_01',
        images: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isActive: true,
        verifiedBy: const [],
      );

      // Verificamos que el mapeo e instanciación básica funcione
      expect(report.title, 'Terremoto en plaza central');
      expect(report.status, 'pendiente');
      expect(report.type, 'emergencia');
    });

    test('2. Debe cambiar el estado a ACTIVO usando copyWith (Lógica de Aprobación Admin)', () {
      final reportInicial = Report(
        id: 'test_id_456',
        title: 'Robo en mercado',
        description: 'Robo a mano armada',
        location: 'Mercado Central, Tacna',
        type: 'robo',
        status: 'pendiente',
        userId: 'user_tacna_02',
        images: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isActive: true,
        verifiedBy: const [],
      );

      // Simulamos exactamente la acción del Administrador al presionar "Aprobar"
      final reportAprobado = reportInicial.copyWith(status: 'activo');

      expect(reportAprobado.status, 'activo');
      expect(reportAprobado.title, 'Robo en mercado'); 
    });

    test('3. Debe cambiar el estado a EN PROCESO usando copyWith (Lógica de Gestión de Alertas)', () {
      final reportAprobado = Report(
        id: 'test_id_789',
        title: 'Incendio en Colegio',
        description: 'Fuego en el laboratorio',
        location: 'Av. Bolognesi, Tacna',
        type: 'incendio',
        status: 'activo',
        userId: 'user_tacna_03',
        images: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isActive: true,
        verifiedBy: const [],
      );

      // Simulamos el flujo donde el incidente pasa a ser atendido por las autoridades
      final reportEnProceso = reportAprobado.copyWith(status: 'en_proceso');

      expect(reportEnProceso.status, 'en_proceso');
      expect(reportEnProceso.id, 'test_id_789');
    });

  });
}