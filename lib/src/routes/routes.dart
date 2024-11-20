import 'package:cats_project/src/pages/detail_page.dart';
import 'package:cats_project/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cats_project/src/pages/landing_page.dart';


Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'landing': (BuildContext context) => LandingPage(),
    // 'detail': (BuildContext context) => DetailPage(),
    // 'consulta_notas_profesor': (BuildContext context) => ConsultaNotasProfesorPages(),
    // 'consulta_semaforo': (BuildContext context) => ConsultaSemaforoPages(),
    // 'consulta_horario': (BuildContext context) => ConsultaHorarioPages(),
    // 'consulta_semestre': (BuildContext context) => ConsultaSemestrePages(),
    // 'consulta_programa': (BuildContext context) => ConsultaProgramaPages(),
    // 'carnet': (BuildContext context) => Carnet(),
    // 'perfil': (BuildContext context) => PerfilPage(),
    // 'inicio': (BuildContext context) => InicioPage(),
    // 'biblioteca': (BuildContext context) => Biblioteca(),
    // 'barra_page': (BuildContext context) => BarraPage(),
    // 'bloque_page': (BuildContext context) => BloquePage(),
    // 'consulta_resumen': (BuildContext context) => ConsultaResumenPages()
  };
}
