# Eliyah Market 🚀

**Eliyah Market** est une plateforme e-commerce multi-vendeurs complète et premium, conçue pour connecter les clients, les boutiques et les services de livraison. Construite avec Flutter, elle offre une expérience fluide et unifiée sur Android, iOS et Web.

## 🌟 Modules Principaux

Eliyah Market n'est pas qu'une simple application ; c'est un écosystème complet comprenant plusieurs modules :

- 🛒 **eCommerce** : Une marketplace polyvalente pour tous types de produits (mode, électronique, etc.).
- 🍔 **Livraison de Repas** : Commandes en temps réel et suivi depuis vos restaurants favoris.
- 🍏 **Épicerie** : Produits de première nécessité et frais livrés directement depuis les marchés locaux.
- 💊 **Pharmacie** : Livraison rapide et sécurisée de médicaments et produits de santé.
- 📦 **Service de Colis** : Solutions de coursiers et de livraison point à point efficaces.

## 👥 Rôles et Fonctionnalités

Le système est structuré autour de plusieurs profils utilisateurs, chacun ayant des rôles et des permissions spécifiques pour une gestion optimale de la plateforme :

### 👑 1. Administrateur (Admin)
Le super-utilisateur qui a le contrôle total sur l'ensemble de la plateforme et de l'écosystème Eliyah Market.
- **Tableau de bord global** : Vue d'ensemble des statistiques (ventes, commandes, utilisateurs, revenus, livreurs).
- **Gestion des utilisateurs** : Ajout, modification, suspension ou suppression de clients, vendeurs et livreurs.
- **Gestion des boutiques et vendeurs** : Approbation des nouvelles boutiques, gestion des commissions, des plans d'abonnement et des paiements.
- **Gestion du catalogue global** : Validation ou importation en masse des produits, gestion des catégories, sous-catégories, marques et attributs.
- **Configurations du système** : Paramétrage des zones de couverture (polygones), méthodes de paiement, devises, taxes, langues et notifications (SMS/Push/Email).
- **Rapports et analyses** : Export des données financières, rapports de ventes et analyses détaillées.
- **Marketing et promotions** : Création de bannières, coupons de réduction, notifications push de masse et campagnes promotionnelles globales.
- **Gestion des livreurs** : Validation des inscriptions, attribution manuelle de commandes (si nécessaire), et gestion des paiements des coursiers.

### 🛡️ 2. Employé Administrateur (Admin Employee)
Un membre de l'équipe d'administration avec des accès restreints définis avec précision par l'Administrateur principal.
- **Rôles et permissions personnalisés** : Accès limité à des sections spécifiques selon son métier (ex: uniquement le support client, les finances ou le marketing).
- **Gestion des commandes** : Suivi, annulation ou modification du statut des commandes en cas d'intervention nécessaire.
- **Support et assistance** : Réponse aux requêtes des clients et des vendeurs (système de tickets ou chat).
- **Modération** : Vérification et modération des avis clients, des produits soumis et des fiches d'inscription.

### 🏪 3. Vendeur / Propriétaire de Boutique (Seller)
Le gérant d'une boutique, d'une pharmacie, d'une épicerie ou d'un restaurant sur la plateforme.
- **Tableau de bord de la boutique** : Suivi des performances, des commandes en cours, de l'état des stocks et des revenus de sa propre boutique.
- **Gestion du catalogue** : Ajout, modification, importation de produits, gestion des prix, des variantes (tailles, couleurs, etc.) et des add-ons (pour la restauration).
- **Traitement des commandes** : Tableau Kanban pour la gestion des commandes (En attente, Accepté, En préparation, Prêt pour la livraison, Livré).
- **Gestion des promotions** : Création de coupons de réduction ou de soldes spécifiques à ses propres clients.
- **Profil de la boutique** : Personnalisation des horaires d'ouverture, du logo, de l'image de couverture, et activation/désactivation temporaire.
- **Suivi financier** : Résumé des gains, suivi de la balance et demande de retraits (payouts) vers son propre compte bancaire ou mobile money.

### 🧑‍💼 4. Employé de Boutique (Seller Employee)
Le personnel du vendeur (ex: caissier, cuisinier, préparateur de commandes) avec un rôle ciblé pour les opérations quotidiennes de la boutique.
- **Accès restreint côté boutique** : Permissions définies strictement par le Propriétaire de la Boutique (ex: gère le statut des plats mais n'a pas accès aux revenus globaux).
- **Traitement logistique** : Validation et mise à jour des étapes de préparation d'une commande (ex: faire passer de "Acceptée" à "Prête pour le retrait" pour alerter le livreur).
- **Mise à jour rapide des stocks** : Désactivation rapide ("Out of Stock") d'un produit ou d'un supplément pour éviter les commandes impossibles à honorer si le produit vient à manquer.

### 🛍️ 5. Client (Customer)
L'utilisateur final qui effectue des achats ou réserve des courses depuis l'Application Mobile ou le Web.
- **Exploration et recherche** : Filtres avancés par module (Food, Grocery, etc.), par catégorie, note, ou distance.
- **Panier intelligent** : Fonctionnalités de panier avec gestion des adresses de livraison multiples et estimation des frais de livraison.
- **Suivi en temps réel** : Suivi GPS sur carte de la position du livreur et notifications push synchronisées avec l'état de la commande.
- **Paiements flexibles** : Intégration de passerelles de paiement sécurisées locales/internationales, Mobile Money, carte de crédit ou "Cash on Delivery".
- **Fidélité et portefeuille (Wallet)** : Système de points de fidélité, cashbacks, et portefeuille virtuel pour des paiements rapides.
- **Interactions** : Messagerie intégrée (Chat in-app) pour communiquer avec le vendeur ou le livreur, et système d'évaluation détaillé.

### 🛵 6. Livreur (Delivery Man)
Le coursier (indépendant ou employé de la plateforme) responsable de l'acheminement des commandes.
- **Gestion des courses** : Réception de notifications pour accepter ou refuser les nouvelles requêtes de livraison proches.
- **Navigation optimisée** : Intégration directe avec Google Maps pour le guidage vers le point de retrait (boutique) et le point de dépôt (client).
- **Tableau de bord logistique** : Suivi des courses terminées, distance parcourue et temps passé.
- **Suivi des revenus & Wallet** : Calcul des gains par course, gestion du "cash in hand" (argent collecté sur les commandes payées à la livraison) et demandes de retrait.
- **Statut de présence** : Bouton ON/OFF pour indiquer sa disponibilité pour recevoir de nouvelles livraisons.

## 🛠️ Stack Technologique

- **Frontend / Application** : [Flutter](https://flutter.dev/) (Dart)
- **Gestion des États** : [GetX](https://pub.dev/packages/get)
- **Paiements et SMS** : Plugins d'intégration de partenaires de paiement et d'envoi de SMS (OTP).
- **Cartographie et Localisation** : Google Maps SDK (Geocoding, Distance Matrix, Directions).
- **Notifications Temps Réel** : Firebase Cloud Messaging (FCM).

## 📱 Plateformes Supportées

| Plateforme | Statut |
| :--- | :--- |
| **Android** | ✅ Prêt (APK & AAB - Applications Client, Vendeur et Livreur) |
| **iOS** | ✅ Prêt (Requis : Xcode - Applications Client, Vendeur et Livreur) |
| **Web** | ✅ Prêt (PWA optimisée et réactive) |

## 🚀 Guide de Démarrage (Développeurs)

### Prérequis

- Flutter SDK (version compatible requise pour le projet)
- Dart SDK
- Android Studio ou VS Code avec les extensions Flutter installées.

### Installation

1. **Cloner le dépôt du projet** :
   ```bash
   git clone <url-du-depot>
   ```

2. **Accéder au répertoire racine** :
   ```bash
   cd eliyah-app
   ```

3. **Installer les dépendances** :
   ```bash
   flutter pub get
   ```

4. **Lancer l'application** :
   ```bash
   flutter run
   ```

## 🏗️ Commandes de Build Utiles

- **APK Android (Pour tests)** : `flutter build apk --release`
- **App Bundle Android (Pour Play Store)** : `flutter build appbundle --release`
- **Build Web** : `flutter build web --release`
- **Build iOS (Archive pour App Store)** : `flutter build ios --release`

---

Développé pour **Eliyah Market** - *Simplifier vos achats au quotidien.*
