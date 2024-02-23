import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placealouer/constant/app_colors.dart';
import 'package:placealouer/constant/app_style.dart';
import 'package:placealouer/constant/static_decoration.dart';

class CguScreen extends StatelessWidget {
  const CguScreen({super.key});

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
          "Conditions Générales d'Utilisation (CGU) - Placealouer par Arsenic",
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
              "Les présentes Conditions Générales d'Utilisation (CGU) régissent l'utilisation de l'application \"Placealouer\" fournie par l'entreprise Arsenic, dont le siège social est situé au 2 Rue Decamps. L'utilisation de l'application implique l'acceptation sans réserve des présentes CGU."),
          height20,
          Text("1. Acceptation des Conditions d'Utilisation"),
          height20,
          Text(
              "En utilisant l'application Placealouer, l'utilisateur reconnaît avoir pris connaissance et accepté l'ensemble des dispositions des présentes CGU."),
          height20,
          Text("2. Inscription et Compte Utilisateur"),
          height20,
          Text("2.1 Eligibilité"),
          height20,
          Text(
              "L'utilisation de Placealouer est réservée aux personnes majeures et capables juridiquement. En créant un compte, l'utilisateur garantit qu'il remplit ces conditions."),
          height20,
          Text("2.2 Création de Compte"),
          height20,
          Text(
              "L'inscription sur Placealouer nécessite la création d'un compte utilisateur. Les informations fournies lors de l'inscription doivent être exactes, complètes et régulièrement mises à jour."),
          height20,
          Text("2.3 Identifiants de Connexion"),
          height20,
          Text(
              "L'utilisateur est responsable de la confidentialité de ses identifiants de connexion. Toute utilisation de l'application avec ces identifiants est réputée être effectuée par l'utilisateur lui-même."),
          height20,
          Text("3. Utilisation de l'Application"),
          height20,
          Text("3.1 Respect des Lois et Règlements"),
          height20,
          Text(
              "L'utilisateur s'engage à utiliser Placealouer conformément aux lois et réglementations en vigueur."),
          height20,
          Text("3.2 Comportement de l'Utilisateur"),
          height20,
          Text(
              "L'utilisateur s'engage à adopter un comportement respectueux envers les autres utilisateurs. Tout comportement contraire aux bonnes pratiques, aux droits d'autrui ou aux présentes CGU pourra entraîner la suspension ou la suppression du compte."),
          height20,
          Text("4. Annonces et Transactions"),
          height20,
          Text("4.1 Création d'Annonces"),
          height20,
          Text(
              "Les utilisateurs peuvent créer des annonces pour la location de garages et de places de parking. Arsenic se réserve le droit de modérer et de supprimer toute annonce ne respectant pas les présentes CGU."),
          height20,
          Text("4.2 Transactions Financières"),
          height20,
          Text(
              "Les transactions financières liées à la location sont réalisées directement entre les parties concernées. Arsenic n'intervient pas dans ces transactions mais peut prélever des frais de service, conformément aux conditions détaillées dans les Conditions Générales de Vente (CGV)."),
          height20,
          Text("5. Responsabilités et Garanties"),
          height20,
          Text(
              "L'utilisateur est seul responsable de l'utilisation de Placealouer. Arsenic ne garantit pas la disponibilité continue de l'application ni l'exactitude des informations fournies par les utilisateurs."),
          height20,
          Text("6. Propriété Intellectuelle"),
          height20,
          Text(
              "Tous les droits de propriété intellectuelle liés à Placealouer appartiennent à Arsenic. Aucune reproduction, distribution ou utilisation non autorisée du contenu de l'application n'est permise."),
          height20,
          Text("7. Modification des CGU"),
          height20,
          Text(
              "Arsenic se réserve le droit de modifier les présentes CGU à tout moment. Les utilisateurs seront informés de toute modification via l'application. L'utilisation continue de Placealouer après une modification constitue une acceptation des nouvelles conditions."),
          height20,
          Text("8. Protection des Données Personnelles"),
          height20,
          Text(
              "La collecte, le traitement et l'utilisation des données personnelles des utilisateurs sont régis par la politique de confidentialité d'Arsenic."),
          height20,
          Text("9. Litiges et Droit Applicable"),
          height20,
          Text(
              "En cas de litige, les parties s'efforceront de résoudre le différend à l'amiable. À défaut, les tribunaux compétents seront ceux du lieu du siège social d'Arsenic. Les présentes CGU sont régies par le droit en vigueur au lieu du siège social d'Arsenic."),
          height20,
          Text(
              "En acceptant ces CGU, l'utilisateur reconnaît avoir lu et compris l'ensemble des dispositions qui les composent."),
        ],
      ),
    );
  }
}
