import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InfoSupporter extends StatelessWidget {
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
                  Text('Die Unterstützer von Save A Tree',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Die Mbyá sagen: 'Wir sind nicht arm, wenn wir nicht haben, was wir nicht brauchen. Wir sind arm, wenn wir keinen Wald haben, denn wir sind Teil des Waldes und der Wald ein Teil von uns.'\nDie folgenden Unterstützer tragen mit ihren Produkten dazu bei, dass die Mbyá ihren Wald behalten dürfen:\nBiberevents\nMit folgenden Biopunx-Produkten ermöglichen Sie den Kauf von 62 cm x 62 cm Wald für die Mbyá Guaraní:\nBio-Tango-Tee «Limette» und «Maracuja» 50 cL\nBio-Mate-Tee «Minze» und «Roiboos» 33 cL\n125 g und 500 g Mate-Tee sin palo Biopunx\nhttps://biberevents.ch/biopunx/\nFolgende Fairtrader leisten mit einer Lizenzgebühr von € 0.05/L für den Bio-Tango-Tee «Limette» und «Maracuja» einen Beitrag zum Waldkauf\nEZA Österreich https://shop.eza.cc/produkte.php?suchstr=Getr%C3%A4nke&x=0&y=0\nCTM Italien  https://www.altromercato.it/it_it/catalogsearch/result/?q=Bebida+Mate#more1\nOxfam Belgienhttps://www.oxfamfairtrade.be/fr/categorie/aliments/page/3/\nSiesta Oppi Kanu Shop\nFür jede Buchung eines Bootes auf dem Schiffenensee und Wohlensee wird Fr. 1.00 an das Waldkauf-Projekt überwiesen.\nhttps://www.kanuvermietung.ch/de/fribourg-saane-schiffenensee/\nhttps://www.kanuvermietung.ch/de/bern-aare-wohlensee/",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 450.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                        image: AssetImage('assets/harpe.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
}
