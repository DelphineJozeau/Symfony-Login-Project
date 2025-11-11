# Test Technique - Système d'Authentification Symfony

Application web développée avec Symfony 7 et Docker, proposant un système complet d'inscription et de connexion avec validation dynamique des mots de passe.

##  Fonctionnalités

- ✅ **Inscription utilisateur** avec validation en temps réel du mot de passe
- ✅ **Connexion/Déconnexion** sécurisée
- ✅ **Validation dynamique du mot de passe** en Vue.js 3 :
  - Minimum 8 caractères
  - Au moins une majuscule
  - Au moins un chiffre
  - Au moins un caractère spécial
- ✅ **Hashage sécurisé** des mots de passe
- ✅ **Environnement Dockerisé** pour un déploiement facile

##  Technologies utilisées

- **Backend** : PHP 8.3, Symfony 7.3
- **Base de données** : MariaDB
- **Frontend** : HTML, CSS, Vue.js 3, Bootstrap 5
- **Build tools** : Webpack Encore, npm
- **Serveur web** : Nginx
- **Containerisation** : Docker & Docker Compose

##  Prérequis

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installé et en cours d'exécution
- [Docker Compose](https://docs.docker.com/compose/) (inclus avec Docker Desktop)
- Git

## 🔧 Installation

### 1. Cloner le repository
```bash
git clone git@github.com:DelphineJozeau/Symfony-Login-Project.git
cd Symfony-Login-Project
```

### 2. Lancer les containers Docker
```bash
docker compose up -d --build
```

Cette commande va :
- Construire les images Docker
- Installer les dépendances PHP via Composer
- Démarrer les services (PHP, Nginx, MariaDB, PhpMyAdmin)

### 3. Installer Node.js dans le container (première installation)
```bash
# Entrer dans le container PHP
docker compose exec php bash

# Installer Node.js
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs

# Installer les dépendances npm
npm install

# Les dépendances incluent Bootstrap 5 pour le design

# Compiler les assets (Vue.js)
npm run dev

# Sortir du container
exit
```

### 4. Créer la base de données (si première installation)
```bash
# Entrer dans le container PHP
docker compose exec php bash

# Créer la base de données (si elle n'existe pas déjà)
php bin/console doctrine:database:create --if-not-exists

# Exécuter les migrations
php bin/console doctrine:migrations:migrate --no-interaction

# Sortir du container
exit
```

##  Accéder à l'application

Une fois les containers démarrés, l'application est accessible via :

- **Application principale** : [http://localhost:8080](http://localhost:8080)
- **Page d'accueil** : [http://localhost:8080/home](http://localhost:8080/home)
- **Inscription** : [http://localhost:8080/register](http://localhost:8080/register)
- **Connexion** : [http://localhost:8080/login](http://localhost:8080/login)
- **PhpMyAdmin** : [http://localhost:8081](http://localhost:8081) (root/root)

 **Note** : Si vous utilisez AdBlock, désactivez-le pour ce site car il peut bloquer certains fichiers JavaScript.

##  Utilisation

### Créer un compte

1. Accédez à [http://localhost:8080/register](http://localhost:8080/register)
2. Remplissez le formulaire :
   - **Email** : Votre adresse email
   - **Mot de passe** : Doit respecter les 4 critères de sécurité
3. Les indicateurs visuels deviennent verts ✅ lorsque les critères sont respectés (validation en temps réel avec Vue.js)
4. Cliquez sur "Register"
5. Vous êtes automatiquement connecté et redirigé vers la page d'accueil

### Se connecter

1. Accédez à [http://localhost:8080/login](http://localhost:8080/login)
2. Entrez vos identifiants
3. Vous êtes redirigé vers la page d'accueil connecté

### Se déconnecter

Cliquez sur le bouton "Logout" sur la page d'accueil

## 🗂️ Structure du projet
```
app/
├── assets/               # Sources frontend (Vue.js)
│   ├── app.js            # Point d'entrée JavaScript
│   ├── components/       # Composants Vue.js
│   │   └── PasswordValidator.vue
│   └── styles/           # Fichiers CSS
├── config/               # Configuration Symfony
├── migrations/           # Migrations de base de données
├── public/
│   └── build/           # Assets compilés par Webpack
├── src/
│   ├── Controller/      # Contrôleurs (Registration, Security, Home)
│   ├── Entity/          # Entités Doctrine (User)
│   ├── Form/            # Formulaires (RegistrationFormType)
│   ├── Repository/      # Repositories Doctrine
│   └── Security/        # Authenticator personnalisé
├── templates/           # Templates Twig
│   ├── home/           # Page d'accueil
│   ├── registration/   # Page d'inscription
│   └── security/       # Page de connexion
├── docker-compose.yaml  # Configuration Docker Compose
├── Dockerfile           # Image Docker PHP personnalisée
├── nginx.conf           # Configuration Nginx
├── php.ini              # Configuration PHP
├── webpack.config.js    # Configuration Webpack Encore
└── package.json         # Dépendances npm
```

##  Commandes Docker utiles
```bash
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
```

## 💻 Commandes de développement

### Compiler les assets
```bash
# Entrer dans le container
docker compose exec php bash

# Mode développement (compile une fois)
npm run dev

# Mode watch (recompile automatiquement à chaque modification)
npm run watch

# Mode production (optimisé et minifié)
npm run build
```

## 🎨 Vue.js - Composants

Le projet utilise **Vue.js 3** avec **Webpack Encore** pour la validation dynamique du mot de passe.

### Composant PasswordValidator

Composant Vue réutilisable qui :
- Affiche un champ de saisie de mot de passe
- Valide en temps réel les critères de sécurité
- Émet un événement au parent pour activer/désactiver le bouton submit
- Utilise des styles inline pour une intégration simple

**Fichier** : `assets/components/PasswordValidator.vue`

##  Base de données

##  Sécurité

- Les mots de passe sont **hashés** avec l'algorithme bcrypt
- Validation côté serveur ET côté client
- Protection CSRF sur les formulaires
- Vérification d'unicité des emails
- Aucun mot de passe en clair stocké


##  Notes

- L'environnement est configuré en mode **développement**
- Les logs Symfony sont disponibles dans `var/log/`
- Le profiler Symfony est accessible via la barre de débogage
- Les assets sont compilés avec Webpack Encore


##  Date

Octobre 2024