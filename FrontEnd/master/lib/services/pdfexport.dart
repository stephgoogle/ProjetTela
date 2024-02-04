import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:mobile/models/pub_pack.dart';
import 'package:pdf/widgets.dart';

Future<Uint8List> makePdf(PackSouscription? souscription) async {
  final pdf = Document();
  final imageLogo = MemoryImage((await rootBundle.load('assets/images/pack.png')).buffer.asUint8List());
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image(imageLogo),
                ),
                Text(
                  "Contrat d'insertion publicitaires",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  )
                )
              ]
            ),
            SizedBox(height: 20),
            Text(
              "Cet contrat prend effet à partir de la date de sa signature",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "Entre: M/Mme/Mle ",
                children: [
                  TextSpan(
                    text: " ${souscription?.name}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " de/du ",
                    
                  ),
                  TextSpan(
                    text: " ${souscription?.company}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " sis à ",
                    
                  ),
                  TextSpan(
                    text: "ABIDJAN ${souscription?.company}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " Tel: ",
                    
                  ),
                  TextSpan(
                    text: "+225 9835271 ${souscription?.company}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " N° CNI: ",
                    
                  ),
                  TextSpan(
                    text: " ${souscription?.cardNumber}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " et: la ",
                    
                  ),
                  TextSpan(
                    text: "Société BSPRO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " représenter par le/la commercial/le ",
                    
                  ),
                  TextSpan(
                    text: " ${souscription?.commercial}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " Tel: ",
                    
                  ),
                  TextSpan(
                    text: "+225 TEL BSPRO ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                 
                ],
                style: TextStyle(
                  fontSize: 16,
                  lineSpacing: 5
                )
              )
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "1. La ",
                children: [
                  TextSpan(
                    text: "Société BSPRO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " s'engage à diffuser sur sa plateforme  ",
                    
                  ),
                  TextSpan(
                    text: "TELA TV",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " la publicité de ",
                    
                  ),
                  TextSpan(
                    text: " ${souscription?.company}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " selon les termes ci-dessous.",
                    
                  ),
                
                ],
                style: TextStyle(
                  fontSize: 16,
                  lineSpacing: 5
                )
              )
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "2. En contre partie, ",
                children: [
                  TextSpan(
                    text: " ${souscription?.company}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " paie à  ",
                    
                  ),
                  TextSpan(
                    text: "BSPRO",
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: " les frais d'insertions publicitaires correspondant aux options choisies par ce dernier.",
                    
                  ),
                 
                
                ],
                style: TextStyle(
                  fontSize: 16,
                  lineSpacing: 5
                )
              )
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(
                text: "3. Les deux parties s'engagent à se conformer à ce présent contrat sauf autres dispositions écrite antérieures convenu de commun accord.",
              
                style: TextStyle(
                  fontSize: 16,
                  lineSpacing: 5
                )
              )
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: Text(
                      "Pack ${souscription?.pack?.name}",
                        style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.3,
                      ),
                    ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Lu et Approuvé",
                        style: TextStyle(
                          fontSize: 16,
                          lineSpacing: 5
                        )
                      )
                    ),
                    RichText(
                      text: TextSpan(
                        text: "Société BSPRO",
                        style: TextStyle(
                          fontSize: 16,
                          lineSpacing: 5,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                  ]
                ),
                Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Lu et Approuvé",
                        style: TextStyle(
                          fontSize: 16,
                          lineSpacing: 5
                        )
                      )
                    ),
                    RichText(
                      text: TextSpan(
                        text: "${souscription?.company}",
                        style: TextStyle(
                          fontSize: 16,
                          lineSpacing: 5,
                          fontWeight: FontWeight.bold
                        )
                      )
                    ),
                  ]
                )
              ]
            )
          ]
          
        );
      }
    )
  );
  return pdf.save();
}