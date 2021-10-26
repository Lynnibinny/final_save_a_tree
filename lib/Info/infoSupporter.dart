import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoSupporter extends StatelessWidget {
  double fontBig = 25;
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.lightGreen[200],
            Colors.lightGreen[300],
            Colors.lightGreen[400],
            Colors.lightGreen[500],
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Unterstützer',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color(0x00000000),
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black, //to make the back button black
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          'Getränkehersteller                                ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontBig,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Folgende Fairtrader leisten mit einer Lizenzgebühr von € 0.05/L für den Bio-Tango-Tee «Limette» und «Maracuja» einen Beitrag zum Waldkauf",
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 30,
                  ),
                  Linkify(
                      onOpen: _onOpen,
                      text:
                          "EZA Österreich https://shop.eza.cc/produkte.php?suchstr=Getr%C3%A4nke&x=0&y=0",
                      style: TextStyle(fontSize: 20.0)),
                  Linkify(
                      onOpen: _onOpen,
                      text:
                          "CTM Italien https://www.altromercato.it/it_it/catalogsearch/result/?q=Bebida+Mate#more1",
                      style: TextStyle(fontSize: 20.0)),
                  Linkify(
                      onOpen: _onOpen,
                      text:
                          "Oxfam Belgien https://www.oxfamfairtrade.be/fr/categorie/aliments/page/3/",
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Biberevents                                ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontBig,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Mit diesen Biopunx-Produkten ermöglichen Sie den Kauf von \n62 cm x 62 cm Wald für die Mbyá Guaraní:",
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Linkify(
                          onOpen: _onOpen,
                          text: "https://biberevents.ch/biopunx/",
                          style: TextStyle(fontSize: 20.0))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/MateTee.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          'Siesta Oppi Kanu Shop                                ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: fontBig,
                              fontWeight: FontWeight.bold))),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Für jede Buchung eines Bootes auf dem Schiffenensee und Wohlensee wird Fr. 1.00 an das Waldkauf-Projekt überwiesen.",
                      style: TextStyle(fontSize: 20.0)),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Linkify(
                          onOpen: _onOpen,
                          text:
                              "https://www.kanuvermietung.ch/de/fribourg-saane-schiffenensee/ \n https://www.kanuvermietung.ch/de/bern-aare-wohlensee/",
                          style: TextStyle(fontSize: 20.0))),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Unsere Phylosophie ist es, dass niemand zu klein ist, etwas an eine bessere Welt beizutragen. In den Medien wird viel vom Klimawandel und seinen Folgen gesprochen, dies kann das Gefühl von Überforderung auslösen. Es gibt so viele Probleme auf der Welt, ach wo soll ich helfen und wo ist mein Platz? Vielleicht sollten wir alle ein zwei Anligen suchen und uns für deren Bekämpfung einsetzten. Wir müssen nicht die ganze Welt retten, wir sind ja nicht alleine.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/Butterfly.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  /*ElevatedButton(
                      style: raisedButtonStyle,
                      onPressed: () {
                        print('Tapped');
                      },
                      child: Container(
                        child: AutoSizeText(
                          'Jetzt spenden',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      )),*/
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              //),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onOpen(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch $link';
    }
  }
}
