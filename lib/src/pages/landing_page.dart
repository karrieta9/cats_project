import 'package:flutter/material.dart';
import 'package:cats_project/src/pages/detail_page.dart';
import 'package:cats_project/src/providers/cats_provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final catsProvider = CatsProvider();
  List cats = [];
  List filteredCats = [];
  bool _cargando = true;


  @override
  void initState() {
    super.initState();
    obtener();
  }

  void obtener() async {
    _cargando = true;
    setState(() {});

    cats = await catsProvider.getCats();
    filteredCats = cats;
    _cargando = false;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
          child: _cargando
              ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Loading ...',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xfffa7c5d)),
                    backgroundColor: Colors.grey
                  )
                ],
              )
              : Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    const SafeArea(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Text(
                            'Catbreeds',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        // controller: searchController,
                        onChanged: (value) => _filterCats(value),
                        decoration: InputDecoration(
                          hintText: 'Find catbreed',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xfffa7c5d),
                          ),
                          fillColor: Colors.white, // Fondo blanco
                          filled: true, // Rellenar el fondo
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none, // Sin borde
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none, // Sin borde al enfocar
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide:
                                BorderSide.none, // Sin borde por defecto
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 15.0),
                        ),
                        style: const TextStyle(
                            color: Colors.black), // Color del texto
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: filteredCats.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CardCat(infoCat: filteredCats[index]);
                        },
                      ),
                    ),
                  ],
                )),
    );
  }

  void _filterCats(String query) {
    final results = cats
        .where((cat) => cat['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredCats = results;
    });
  }
}

class CardCat extends StatefulWidget {
  final Map infoCat;
  const CardCat({Key? key, required this.infoCat}) :  super(key: key);  

  @override
  State<CardCat> createState() => CardCatState();
}

class CardCatState extends State<CardCat> {

  @override
  Widget build(BuildContext context) {
    // String fotoCat = 
    // // 'https://cdn2.thecatapi.com/images/MJWtDz75E.jpg';
    // 'https://cdn2.thecatapi.com/images/${widget.infoCat['reference_image_id']}.jpg';
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(data: widget.infoCat)));
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Colors.white,
              elevation: 6,
              child: SizedBox(
                height: 150,
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                            // color: Colors.white,
                            height: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: const FadeInImage(
                                  placeholder: AssetImage(
                                      'assets/img/footstep.png'),
                                  fadeInDuration:
                                      Duration(milliseconds: 200),
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/img/cat_shape.png'))
                                  // image: imageProvider(fotoCat)),      
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.infoCat['name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              widget.infoCat['origin'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff737373),
                                  fontWeight: FontWeight.w500),
                            ),
                            const Divider(
                              color: Color(0xfffa7c5d),
                              // indent: 10,
                              endIndent: 10,
                            ),
                            Text(
                              'Intelligence : ${widget.infoCat['intelligence']}',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff737373),
                                  fontWeight: FontWeight.w300),
                            ),
                            Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                children: const [
                                  Text(
                                    'See more',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xfffa7c5d),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_outlined,
                                    color: Color(0xfffa7c5d),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))),
    );
  }

ImageProvider<Object> imageProvider(String fotoCat) {
  try {
    // Intenta cargar la imagen usando NetworkImage
    return NetworkImage(fotoCat);
  } catch (e) {
    // Si hay un error, devuelve una imagen de respaldo
    return const AssetImage('assets/img/footstep.png');
  }
}
}
