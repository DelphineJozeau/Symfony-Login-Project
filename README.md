# Test Technique - Système d'Authentification Symfony

Application web développée avec Symfony 7 et Docker, proposant un système complet d'inscription et de connexion avec validation dynamique des mots de passe.

## Fonctionnalités

-  **Inscription utilisateur** avec validation en temps réel du mot de passe
-  **Connexion/Déconnexion** sécurisée
-  **Validation dynamique du mot de passe** en JavaScript :
  - Minimum 8 caractères
  - Au moins une majuscule
  - Au moins un chiffre
  - Au moins un caractère spécial
-  **Hashage sécurisé** des mots de passe
-  **Environnement Dockerisé** pour un déploiement facile

##  Technologies utilisées

- **Backend** : PHP 8.3, Symfony 7.3
- **Base de données** : MariaDB
- **Frontend** : HTML, CSS, JavaScript (Vanilla)
- **Serveur web** : Nginx
- **Containerisation** : Docker & Docker Compose

##  Prérequis

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installé et en cours d'exécution
- [Docker Compose](https://docs.docker.com/compose/) (inclus avec Docker Desktop)
- Git

##  Installation

### 1. Cloner le repository
```bash
git clone git@github.com:DelphineJozeau/Symfony-Login-Project.git
cd Symfony-Login-Project

2. Lancer les containers Docker
docker compose up -d --build

Cette commande va :
Construire les images Docker
Installer les dépendances PHP via Composer
Démarrer les services (PHP, Nginx, MariaDB, PhpMyAdmin)

3. Créer la base de données (si première installation)
# Entrer dans le container PHP
docker compose exec php bash

# Créer la base de données (si elle n'existe pas déjà)
php bin/console doctrine:database:create --if-not-exists

# Exécuter les migrations
php bin/console doctrine:migrations:migrate --no-interaction

# Sortir du container
exit

Accéder à l'application
Une fois les containers démarrés, l'application est accessible via :

Application principale : http://localhost:8080
Page d'accueil : http://localhost:8080/home
Inscription : http://localhost:8080/register
Connexion : http://localhost:8080/login
PhpMyAdmin : http://localhost:8081 (root/root)

Si le port 8080 ou 8081 est déjà utilisé, modifiez les ports dans docker-compose.yaml

Commandes Docker utiles:
# Démarrer les containers
docker compose up -d
# Arrêter les containers
docker compose down
# Voir les logs
docker compose logs -f
# Entrer dans le container PHP
docker compose exec php bash
# Redémarrer les containers
docker compose restart
# Reconstruire les images
docker compose up -d --build



### Utilisation :

Accéder à la page http://localhost:8080/home

Créer un compte :
Bouton register
http://localhost:8080/register

Remplissez le formulaire : avant de remplir le formulaire, rechargez la page.

Email : Votre adresse email
Mot de passe : Doit respecter les 4 critères de sécurité


Les indicateurs visuels deviennent verts lorsque les critères sont respectés
Cliquez sur "Register"
Vous êtes automatiquement connecté et redirigé vers la page d'accueil

Se connecter :

Accédez à http://localhost:8080/login
Entrez vos identifiants
Vous êtes redirigé vers la page d'accueil connecté
