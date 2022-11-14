import 'package:shared_preferences/shared_preferences.dart';

class Datos {
  static late SharedPreferences _datos;

  static String _nombre = '';
  static String _nombreu = '';
  static String _numero = '';
  static String _contrasena = '';
  static String _contrasenau = '';
  static String _infante = '';
  static String _numeroi = '';
  static String _numeroExtra1 = '';
  static String _numeroExtra2 = '';
  static String _numeroExtra3 = '';
  static String _numeroExtra4 = '';
  static int _numeroContactos = 0;
  // static List<String> _nombcon = [];
  static int _pagina = 0;

  static Future init() async {
    _datos = await SharedPreferences.getInstance();
  }

  //nombre
  static String get nombre {
    return _datos.getString('nombre') ?? _nombre;
  }

  static set nombre(String nombre) {
    _nombre = nombre;
    _datos.setString('nombre', nombre);
  }

  //Nombreu
  static String get nombreu {
    return _datos.getString('nombreu') ?? _nombreu;
  }

  static set nombreu(String nombreu) {
    _nombreu = nombreu;
    _datos.setString('nombreu', nombreu);
  }

  //numero
  static String get numero {
    return _datos.getString('numero') ?? _numero;
  }

  static set numero(String numero) {
    _numero = numero;
    _datos.setString('numero', numero);
  }

  //contraseña
  static String get contrasena {
    return _datos.getString('contrasena') ?? _contrasena;
  }

  static set contrasena(String contrasena) {
    _contrasena = contrasena;
    _datos.setString('contrasena', contrasena);
  }

  //Contraseñau
  static String get contrasenau {
    return _datos.getString('contrasenau') ?? _contrasenau;
  }

  static set contrasenau(String contrasenau) {
    _contrasenau = contrasenau;
    _datos.setString('contrasenau', contrasenau);
  }

  // infante
  static String get infante {
    return _datos.getString('infante') ?? _infante;
  }

  static set infante(String infante) {
    _infante = infante;
    _datos.setString('infante', infante);
  }

  //numeroi
  static String get numeroi {
    return _datos.getString('numeroi') ?? _numeroi;
  }

  static set numeroi(String numeroi) {
    _numeroi = numeroi;
    _datos.setString('numeroi', numeroi);
  }

  //pagina
  static int get pagina {
    return _datos.getInt('pagina') ?? _pagina;
  }

  static set pagina(int pagina) {
    _pagina = pagina;
    _datos.setInt('pagina', pagina);
  }

  //lista de numeros
  static String get numeroExtra1 {
    return _datos.getString('numeroExtra1') ?? _numeroExtra1;
  }

  static set numeroExtra1(String numeroExtra1) {
    _numeroExtra1 = numeroExtra1;
    _datos.setString('numeroExtra1', numeroExtra1);
  }

  static String get numeroExtra2 {
    return _datos.getString('numeroExtra2') ?? _numeroExtra2;
  }

  static set numeroExtra2(String numeroExtra2) {
    _numeroExtra2 = numeroExtra2;
    _datos.setString('numeroExtra2', numeroExtra2);
  }

  static String get numeroExtra3 {
    return _datos.getString('numeroExtra3') ?? _numeroExtra3;
  }

  static set numeroExtra3(String numeroExtra3) {
    _numeroExtra3 = numeroExtra3;
    _datos.setString('numeroExtra3', numeroExtra3);
  }

  static String get numeroExtra4 {
    return _datos.getString('numeroExtra4') ?? _numeroExtra4;
  }

  static set numeroExtra4(String numeroExtra4) {
    _numeroExtra4 = numeroExtra4;
    _datos.setString('numeroExtra4', numeroExtra4);
  }

  // static String get numeroe1 {
  //   return _datos.getString('numeroe1') ?? _numeroe1;
  // }

  // static set numeroe1(String numeroe) {
  //   _numeroe1 = numeroe;
  //   _datos.setString('numeroe1', numeroe1);
  // }

  // static String get numeroe2 {
  //   return _datos.getString('numeroe2') ?? _numeroe2;
  // }

  // static set numeroe2(String numeroe) {
  //   _numeroe2 = numeroe;
  //   _datos.setString('numeroe2', numeroe2);
  // }

  // static String get numeroe3 {
  //   return _datos.getString('numeroe3') ?? _numeroe3;
  // }

  // static set numeroe3(String numeroe) {
  //   _numeroe3 = numeroe;
  //   _datos.setString('numeroe3', numeroe3);
  // }

  // static String get numeroe4 {
  //   return _datos.getString('numeroe4') ?? _numeroe4;
  // }

  // static set numeroe4(String numeroe) {
  //   _numeroe4 = numeroe;
  //   _datos.setString('numeroe4', numeroe4);
  // }

  //numeroContactos
  static int get numeroContactos {
    return _datos.getInt('numeroContactos') ?? _numeroContactos;
  }

  static set numeroContactos(int numeroContactos) {
    _numeroContactos = numeroContactos;
    _datos.setInt('numeroContactos', numeroContactos);
  }
}
