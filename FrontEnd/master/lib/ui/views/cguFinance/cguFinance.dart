import 'package:flutter/material.dart';
import 'package:mobile/ui/views/cguFinance/cguFinanceViewModel.dart';
import 'package:stacked/stacked.dart';

class ConditionGeneralDUtilisationSFinance extends StatefulWidget {
  const ConditionGeneralDUtilisationSFinance({super.key});

  @override
  State<ConditionGeneralDUtilisationSFinance> createState() =>
      _ConditionGeneralDUtilisationSFinanceState();
}

class _ConditionGeneralDUtilisationSFinanceState
    extends State<ConditionGeneralDUtilisationSFinance> {
  String title = "L'APPLICATION ET LES CONDITIONS GENERALES D'UTILISATION";
  bool lapp_vu = true;
  String lapp = "I- L' APPLICATION";
  String lapp_body =
      """TELA est une application 3 en 1 qui comporte les services:
- TELA immobilier: c'est un espace de location de logements et de bureaux.
- TELA finance: c'est un espace de collecte de frais des abonnés et de paiement de ces
derniers.
- TELA TV: une web TV qui comporte six chaînes (publicité, divertissement, sport, film
et musique).
Tous les abonné(e)s de la plateforme sont considérés comme des employés rémunérés
par TELA.""";
  bool cgu_vu = true;
  String cgu = "II- les CGU (Conditions Générales d'utilisation)";
  bool immo_vu = true;
  String immo = "A- TELA Immobilier";
  String immo_ar1_t = "Article 1";
  String immo_ar1 =
      """Le démarcheur ou la demarcheuse est celui ou celle qui, après s'être inscrit et payé son
abonnement peut émettre des photos sur la plateforme dans le but d'être rémunéré
chaque fois que ses photos seront consultées.""";
  String immo_ar2_t = "Article 2";
  String immo_ar2 =
      """Le visiteur est celui qui pour effectuer la recherche d'un logement ou d'un bureau paye
des visites avant de consulter les photos de la plateforme.""";
  String immo_ar3_t = "Article 3";
  String immo_ar3 =
      """Le démarcheur ou la demarcheuse s'abonne selon les types d'abonnements suivants:
- abonnement basic (5000 FCFA)
- abonnement medium (15.000 FCFA)
- abonnement premium (30.000 FCFA).""";
  String immo_ar4_t = "Article 4";
  String immo_ar4 =
      """Ces trois types d'abonnements sont rémunérés respectivement selon les taux suivants:
- abonnement basic : 10 % du montant de la visite
- abonnement médium: 18% du montant de la visite
- abonnement prémium : 25% du montant de la visite.""";
  String immo_ar5_t = "Article 5";
  String immo_ar5 =
      """La configuration des photos à télécharger par le démarcheur ou la demarcheuse:
Il ou elle doit émettre 10 photos de 10 maisons tout standing confondus (la façade de la
maison, ou de l'immeuble pour ce qui est des appartements, le salon, les chambres,
salles d'eau, la véranda, le balcon, la cour et l'arrière, la piscine s’il y' a lieu).
Le démarcheur ou la démarcheuse doit donner les caractéristiques de chaques maison
( localisation géographique avec Google maps et description normale, nombre de
pièces, nombre de salles d'eau, niveau d'étage pour les immeubles, le budget et les
conditions relatives au cautionnement.""";
  String immo_ar6_t = "Article 6";
  String immo_ar6 = """La rémunération du démarcheur ou de la démarcheuse :
Les soldes sont actualisés chaque 05 du mois suivant un exercice.
( Un exercice correspond à un mois d'activité)""";
  String immo_ar7_t = "Article 7";
  String immo_ar7 = """Les reclamations:
Elles sont recevables du 05 au 07 du mois suivant un exercice.
( On entend par exercice chaque période du mois allant du 1er au 28, au 30, 31 en
fonction du nombre du jours du mois.)""";
  String immo_ar8_t = "Article 8";
  String immo_ar8 =
      """Pour être rémunéré les mois suivants, le démarcheur ou la démarcheuse devra se
réabonner entre le 24 et le 26 pour le mois de février et entre le 26 et 28 pour les autres
mois.""";
  String immo_ar9_t = "Articles 9";
  String immo_ar9 =
      """Une fois les délais de réabonnement passés, le démarcheur ou la démarcheuse a deux
options :
- soit attendre le prochain mois pour se réabonner
- soit payer une pénalité de 50%
Exemple : pour un abonnement de type basic
5000 + 2500 = 7500 F""";
  String immo_ar10_t = "Article 10";
  String immo_ar10 =
      """Les dates de réabonnement mentionnées ci-dessus ne concernent pas le premier mois
d'abonnement vu que le ou la démarcheuse n’a pas perçu son solde du premier mois.""";
  String immo_ar11_t = "Article 11";
  String immo_ar11 =
      """Le visiteur, pour consulter les logements ou bureaux disponibles sur la plateforme devra
payer:
2 000 F CFA pour consulter les photo de 05 maisons
3 000 F CFA pour consulter les photos de 10 maisons
5 000 F CFA pour consulter les photos de 20 maisons.""";
  bool fin_vu = true;
  String fin = "B- TELA FINANCE";
  String fin_ar1_t = "Article 1";
  String fin_ar1 =
      """Pour disposer d'un espace personnel sur TELA Finance, l'abonné(e) devra remplir tous
les formalités relatives aux conditions d'abonnement ( nom, prénom(s), telephone(s),
photo de profil, photocopie de la carte nationale d’identité -CNI- ou du passeport)""";
  String fin_ar2_t = "Article 2";
  String fin_ar2 =
      """L'abonné(e) dispose d'un espace personnel et confidentiel pour accéder, à son espace
personnel.""";
  String fin_ar3_t = "Article 3";
  String fin_ar3 = """L'abonné(e) dispose sur son espace personnel:
-d'un compte courant pour sa rémunération
- d'un compte épargne pour son réabonnement.""";
  String fin_ar4_t = "Article 4";
  String fin_ar4 = """Les retraits:
L'abonné(e) peut à tout moment effectuer des retraits de son propre espace personnel
via mobile money ou carte bancaire.""";
  String fin_ar5_t = "Article 5";
  String fin_ar5 = """Les retraits sont soumis au taux de 3%.""";
  String fin_ar6_t = "Article 6";
  String fin_ar6 =
      """L'abonné(e) ne peut débiter son espace personnel de l'entièreté des fonds. Un montant
de 5000 FCFA devra être toujours disponible dans son espace personnel en guise de
frais de traitement de cet espace.""";
  String fin_ar7_t = "Article 7";
  String fin_ar7 = """Les dépôts:
L'abonné(e) peut si il ou elle le souhaite, effectuer un dépôt dans son espace personnel
dans le but d'acheter un service sur la plateforme.""";
  String fin_ar8_t = "Article 8";
  String fin_ar8 =
      """La demande de relevé est soumise à des frais : 500 FCFA""";
  String fin_ar9_t = "Articles 9";
  String fin_ar9 =
      """La mise à jour du solde peut connaître un retard de 24h au maximum""";
  String fin_ar10_t = "Article 10";
  String fin_ar10 =
      """Les déplacements de fonds effectués par l'abonné(e) entre son compte courant et son
compte d'épargne ne sont soumis à aucun frais.""";
  String fin_ar11_t = "Article 11";
  String fin_ar11 = """La fermeture de l'espace personnel :
L'abonné(e) peut de plein droit demander la fermeture de son espace personnel.
Dans ce cas, il devra adresser un message au service client de TELA qui prendra des
dispositions pour la fermeture de cet espace dans un delais de 10 jours ouvrables après
réception de sa requête.""";
  bool tv_vu = true;
  String tv = "C- TELA TV";
  String tv_ar1_t = "Article 1";
  String tv_ar1 = """Les insertions publicitaires:
Celles-ci sont payables directement sur la plateforme.""";
  String tv_ar2_t = "Article 2";
  String tv_ar2 = """Les pass TV
Ceux-ci sont payables directement sur la plateforme.
Leur montant varie en fonction de l'émission.""";
  String tv_ar3_t = "Article 3";
  String tv_ar3 = """La remise des gains des téléspectateurs :
Pour recevoir son gain ou ses gains le téléspectateur devra s'abonner gratuitement afin
d'obtenir son espace personnel sur TELA finance.""";
  String tv_ar4_t = "Article 4";
  String tv_ar4 =
      """Après abonnement, le téléspectateur verra son espace personnel crédité du montant de
son gain 24h plutard.""";
  String tv_ar5_t = "Article 5";
  String tv_ar5 =
      """Le téléspectateur verra son compte courant crédité de 80% du montant de son gain et
son compte épargne crédité de 20% du montant de son gain.""";
  bool ex_vu = true;
  String ex = "D- LES EXCEPTIONS";
  String ex_ar1_t = "Article 1";
  String ex_ar1 =
      """Les frais sur les retraits peuvent varier selon les taux proposés à nous, par notre
prestataire.""";
  String ex_ar2_t = "Article 2";
  String ex_ar2 =
      """Les pourcentages sur les types d'abonnement peuvent connaître des modifications.""";
  String ex_ar3_t = "Article 3";
  String ex_ar3 =
      """Les pass visiteurs peuvent aussi connaître des modifications.""";
  String ex_ar4_t = "Article 4";
  String ex_ar4 =
      """En cas d'application des trois articles susmentionnés, les abonnés et les visiteurs
seront tenus au préalable informé.""";

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return ViewModelBuilder<cguFinanceViewModel>.reactive(
      viewModelBuilder: () => cguFinanceViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('CGU', style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            elevation: 5,
          ),
          backgroundColor: Colors.white,
          body: SizedBox(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      /// TITLE
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),

                      /// lapp
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxWidth: mediaQuery.size.width * 0.7),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  title,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () => setState(() {
                                      lapp_vu = !lapp_vu;
                                    }),
                                icon: Icon(
                                  lapp_vu
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 24,
                                )),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: lapp_vu,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lapp_body,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                      /// cgu
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                  maxWidth: mediaQuery.size.width * 0.7),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  cgu,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: () => setState(() {
                                      cgu_vu = !cgu_vu;
                                    }),
                                icon: Icon(
                                  cgu_vu
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  size: 24,
                                )),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: cgu_vu,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              /// immo
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth:
                                              mediaQuery.size.width * 0.7),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () => setState(() {
                                              immo_vu = !immo_vu;
                                            }),
                                        icon: Icon(
                                          immo_vu
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          size: 24,
                                        )),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: immo_vu,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      // ar1
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar1_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar1,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar2_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar2,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar3_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar3,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar4_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar4,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar5_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar5,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar6_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar6,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar7_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar7,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar8_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar8,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar9_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar9,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar10_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar10,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar11_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          immo_ar11,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /// fin
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth:
                                              mediaQuery.size.width * 0.7),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () => setState(() {
                                              fin_vu = !fin_vu;
                                            }),
                                        icon: Icon(
                                          fin_vu
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          size: 24,
                                        )),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: fin_vu,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      // ar1
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar1_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar1,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar3
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar2_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar2,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar3_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar3,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar4
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar4_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar4,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar5
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar5_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar5,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar6
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar6_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar6,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar7
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar7_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar7,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar8
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar8_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar8,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),

                                      // ar9
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar9_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar9,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),

                                      // ar10
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar10_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar10,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),

                                      // a11
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar11_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fin_ar11,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /// tv
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth:
                                              mediaQuery.size.width * 0.7),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () => setState(() {
                                              tv_vu = !tv_vu;
                                            }),
                                        icon: Icon(
                                          tv_vu
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          size: 24,
                                        )),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: tv_vu,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      // ar1
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar1_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar1,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar2_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar2,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar3
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar3_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar3,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar4
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar4_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar4,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar5
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar5_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          tv_ar5,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              /// exceptions
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth:
                                              mediaQuery.size.width * 0.7),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () => setState(() {
                                              ex_vu = !ex_vu;
                                            }),
                                        icon: Icon(
                                          ex_vu
                                              ? Icons.keyboard_arrow_up
                                              : Icons.keyboard_arrow_down,
                                          size: 24,
                                        )),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: ex_vu,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      // ar1
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex_ar1_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex_ar1,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex_ar2_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex_ar2,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar1
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex_ar3_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex_ar3,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      // ar2
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex_ar4_t,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ex_ar4,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
