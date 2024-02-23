import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';

import '../../../constant/static_decoration.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: appBlackColor,
          ),
        ),
        title: Text(
          "Politique de Confidentialité - Placealouer par Arsenic",
          maxLines: 2,
          style: AppTextStyle.normalRegularBold20.copyWith(
            color: appBlackColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text("Date de la dernière mise à jour : 25/01/2024"),
          height20,
          height20,
          Text(
              "La présente Politique de Confidentialité régit la collecte, l'utilisation et la protection des informations personnelles des utilisateurs de l'application \"Placealouer\" fournie par l'entreprise Arsenic, dont le siège social est situé au 2 Rue Decamps. En utilisant l'application, l'utilisateur reconnaît avoir pris connaissance et accepté les termes de cette politique."),
          height20,
          Text("1. Collecte des Informations Personnelles"),
          height20,
          Text("1.1 Informations Fournies par l'Utilisateur"),
          height20,
          Text(
              "Lors de l'inscription et de l'utilisation de l'application, l'utilisateur peut être amené à fournir des informations personnelles telles que le nom, l'adresse e-mail, le numéro de téléphone, et d'autres informations nécessaires à l'utilisation des services offerts par Placealouer."),
          height20,
          Text("1.2 Données Collectées Automatiquement"),
          height20,
          Text(
              "Certaines informations techniques, telles que les adresses IP, les informations de connexion, le type de navigateur, et d'autres données similaires, peuvent être collectées automatiquement lors de l'utilisation de l'application."),
          height20,
          Text("2. Utilisation des Informations Personnelles"),
          height20,
          Text("2.1 Fourniture des Services"),
          height20,
          Text(
              "Les informations personnelles collectées sont utilisées pour fournir les services offerts par Placealouer, notamment la création et la gestion des comptes utilisateur, la publication d'annonces, la facilitation des transactions et la communication entre les utilisateurs."),
          height20,
          Text("2.2 Communication avec l'Utilisateur"),
          height20,
          Text(
              "Les informations personnelles peuvent être utilisées pour communiquer avec les utilisateurs, notamment pour les informer de mises à jour, de promotions, de modifications des conditions d'utilisation ou pour répondre à leurs demandes et questions."),
          height20,
          Text("3. Protection des Informations Personnelles"),
          height20,
          Text(
              "Arsenic met en place des mesures de sécurité appropriées pour protéger les informations personnelles des utilisateurs contre tout accès non autorisé, altération, divulgation ou destruction."),
          height20,
          Text("4. Partage des Informations Personnelles"),
          height20,
          Text(
              "Arsenic peut partager les informations personnelles avec des tiers dans les cas suivants :"),
          height20,
          Text("4.1 Transactions Financières"),
          height20,
          Text(
              "Les informations nécessaires à la réalisation des transactions financières peuvent être partagées avec les parties concernées, y compris les prestataires de services de paiement."),
          height20,
          Text("4.2 Respect des Lois et Réglementations"),
          height20,
          Text(
              "Arsenic peut partager des informations personnelles pour se conformer aux lois et réglementations en vigueur, répondre à des procédures judiciaires, protéger les droits et la sécurité d'Arsenic, de ses utilisateurs et du public."),
          height20,
          Text("5. Cookies et Technologies Similaires"),
          height20,
          Text(
              "Placealouer peut utiliser des cookies et d'autres technologies similaires pour améliorer l'expérience de l'utilisateur, analyser les tendances, administrer le site, suivre les mouvements des utilisateurs autour du site, et recueillir des informations démographiques sur notre base d'utilisateurs dans son ensemble."),
          height20,
          Text("6. Droits des Utilisateurs"),
          height20,
          Text(
              "Les utilisateurs ont le droit d'accéder, de rectifier, de supprimer ou de limiter l'utilisation de leurs informations personnelles. Ils peuvent exercer ces droits en contactant Arsenic via la section \"Aide\" de l'application."),
          height20,
          Text("7. Modifications de la Politique de Confidentialité"),
          height20,
          Text(
              "Arsenic se réserve le droit de modifier cette Politique de Confidentialité à tout moment. Les utilisateurs seront informés de toute modification via l'application. L'utilisation continue de Placealouer après une modification constitue une acceptation des nouvelles conditions."),
          height20,
          Text("8. Contact"),
          height20,
          Text(
              "Pour toute question concernant cette Politique de Confidentialité, veuillez nous contacter à l'adresse suivante : antoine.dillenschneider@placealouer.fr"),
          height20,
          Text(
              "En acceptant cette Politique de Confidentialité, l'utilisateur reconnaît avoir lu et compris l'ensemble des dispositions qui la composent."),
        ],
      ),
    );
  }
}
