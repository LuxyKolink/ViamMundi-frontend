import 'package:geolocator/geolocator.dart';

Future<bool> obtenerGps() async {
  //Verificar si la ubicación del dispositivo está habilitada
  bool bGpsHabilitado = await Geolocator.isLocationServiceEnabled();
  if (!bGpsHabilitado) {
    return Future.error('Por favor habilite el servicio de ubicación. ');
  }
  //Validar permiso para utilizar los servicios de localización
  LocationPermission bGpsPermiso = await Geolocator.checkPermission();
  if (bGpsPermiso == LocationPermission.denied) {
    bGpsPermiso = await Geolocator.requestPermission();
    if (bGpsPermiso == LocationPermission.denied) {
      return false;
    }
  }

  if (bGpsPermiso == LocationPermission.deniedForever) {
    return false;
  }
  //En este punto los permisos están habilitados y se puede consultar la ubicación
  return true;
}
