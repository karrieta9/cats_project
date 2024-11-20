import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final Map<dynamic, dynamic> data;
  DetailPage({required this.data});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final foto = 'https://cdn2.thecatapi.com/images/MJWtDz75E.jpg';

    

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.data['name']),
      // ),
      body: Stack(
        children: [
          cuerpo(size, foto),
          goBack(context),
        ],
      ),
    );
  }

  Widget cuerpo(Size size, String foto) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          padding: const EdgeInsets.all(20.0),
          height: size.height * 0.4,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: const AssetImage('assets/img/cat_step.png'),
              fadeInDuration: const Duration(milliseconds: 200),
              fit: BoxFit.cover,
              image: NetworkImage(foto),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.data['name'],
                  style: const TextStyle(
                      color: Color(0xfffa7c5d),
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.data['description'],
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Color(0xff9c9c9c)),
                ),
                const SizedBox(height: 20.0),
                textos('Country of Origin:',
                    '${widget.data['origin']} - ${widget.data['country_code']}'),
                textos('Temperament:', widget.data['temperament']),
                textos('Intelligence:', '${widget.data['intelligence']}'),
                textos('Life Span:', '${widget.data['life_span']}'),
                textos('Energy Level:', '${widget.data['energy_level']}'),
                textos('Weight:',
                    'Imperial ${widget.data['weight']['imperial']} | Metric ${widget.data['weight']['metric']}'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget textos(String leading, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Wrap(
        spacing: 5.0, // Espaciado horizontal entre elementos
        runSpacing: 0.0, // Espaciado vertical entre líneas (si es necesario)
        children: [
          Text(
            leading,
            style: const TextStyle(color: Color(0xfffa7c5d)),
          ),
          Text(
            text,
            maxLines:
                2, // Cambia este valor si quieres limitar el texto a más líneas
            overflow: TextOverflow
                .ellipsis, // Si aún no cabe, muestra puntos suspensivos
            style: const TextStyle(color: Color(0xff9c9c9c)),
          ),
        ],
      ),
    );
  }

  Widget goBack(BuildContext context) {
    return SafeArea(
      child: Tooltip(
          message: 'Volver',
          child: GestureDetector(
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                Navigator.pushNamed(context, 'home');
              }
            },
            child: Container(
              margin: const EdgeInsets.only(left: 30.0, top: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: const SizedBox(
                width: 50.0,
                height: 50.0,
                child: Icon(Icons.chevron_left_outlined, color: Color(0xfffa7c5d)),
              ),
            ),
          )),
    );
  }
}
