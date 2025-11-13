# TP4 : Docker Engine, Jenkins, CI/CD

**ECOLE NORMALE SUPÉRIEURE DE L'ENSEIGNEMENT TECHNIQUE DE MOHAMMEDIA**
**UNIVERSITÉ HASSAN II DE CASABLANCA**
**Filière d'ingénieur : DEPARTEMENT DE MATHEMATIQUES ET INFORMATIQUE**
**Ingénierie Informatique Big Data Cloud Computing IIBDCC**
**Ingénierie des Infrastructures Big Data et Cloud**

**Réalisé par : TANGARA YOUSSOUF**
**Encadré par : Pr. EL GUEMMAT**
**2025-2026**

## Table des matières
- [Introduction](#introduction)
- [PARTIE 1 – CI/CD (continuous integration / continuous delivery)](#partie-1--cicd-continuous-integration--continuous-delivery)
- [Partie 2: CI/CD (continuous delivery/continuous deployment)](#partie-2-cicd-continuous-deliverycontinuous-deployment)
- [Conclusion](#conclusion)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup and Usage](#setup-and-usage)

## Introduction
Dans un contexte où l'automatisation, l'intégration continue (CI) et le déploiement continu (CD) représentent des piliers fondamentaux de l'ingénierie moderne, l'usage d'outils comme Docker et Jenkins est devenu indispensable dans les systèmes Cloud et Big Data. Ce TP s'inscrit dans cette optique, en mettant en pratique la mise en place d'un pipeline CI/CD complet, allant de la création d'une application conteneurisée à son déploiement automatique via Jenkins. L'objectif principal est d'automatiser les processus de build, test, publication et déploiement d'une image Docker, tout en assurant la traçabilité des modifications via GitHub, dans un environnement reproductible et maîtrisé.

## PARTIE 1 – CI/CD (continuous integration / continuous delivery)

### 1. Installation de Jenkins
- Installer Jenkins sur votre système
- Configurer l'environnement de développement

### 2. Création du projet
- Projet « tp4 » contenant une page web `index.html` affichant « Welcome BDCC »
- Fichier `Dockerfile` pour conteneuriser l'application avec nginx

### 3. Repository GitHub
- Créer un répertoire GitHub nommé `tp4` pour partager le code

### 4. Job Jenkins freestyle (job1tp4)
- Créer et configurer un job Jenkins de type freestyle
- Ajouter des plugins Docker à Jenkins

### 5. Configuration du build
- Générer une image Docker et la publier sur Docker Hub avec le tag `latest`

### 6. Tests et modifications
- Faire des changements dans `index.html` et observer les builds automatiques

## Partie 2: CI/CD (continuous delivery/continuous deployment)

### 1. Job freestyle avec déploiement (job2tp4)
- Créer un job freestyle incluant le déploiement de l'image dans un conteneur Docker

### 2. Pipeline job (job2tp4v2)
- Créer un job pipeline reproduisant les tâches du job freestyle

### 3. Pipeline avec Jenkinsfile (job3tp4)
- Créer un `Jenkinsfile` définissant les stages : Cloning Git, Building image, Test image, Publish Image

### 4. Pipeline complet
- Ajouter le stage de déploiement pour un pipeline à 5 stages

## Conclusion
Ce TP a permis de concevoir et mettre en oeuvre un pipeline CI/CD complet en intégrant Docker, GitHub et Jenkins. Tout au long de ce processus, nous avons automatisé la build, le test, la publication et le déploiement d'une application web au travers de pipelines freestyle et pipelines as code. Cette expérience confirme l'importance cruciale de l'automatisation dans les architectures modernes, notamment en Cloud et Big Data, où rapidité, fiabilité et scalabilité sont des exigences essentielles.

## Project Structure
```
tp4Devops/
├── index.html          # Page web affichant "Welcome BDCC"
├── Dockerfile          # Configuration Docker pour nginx
├── Jenkinsfile         # Pipeline Jenkins avec 5 stages
└── README.md           # Documentation du projet
```

## Prerequisites
- Docker Desktop installé et configuré
- Jenkins installé avec plugins Docker
- Compte Docker Hub pour la publication des images
- Repository GitHub pour le versioning du code

## Setup and Usage

### Construction manuelle
```bash
# Construire l'image Docker
docker build -t youssouftangara/tp4devops:latest .

# Tester l'image
docker run --rm youssouftangara/tp4devops:latest nginx -t

# Publier sur Docker Hub
echo $DOCKERHUB_TOKEN | docker login -u youssouftangara --password-stdin
docker push youssouftangara/tp4devops:latest

# Déployer localement
docker run -d --name tp4devops -p 8082:80 youssouftangara/tp4devops:latest
```

### Pipeline Jenkins
Le `Jenkinsfile` définit un pipeline avec 5 stages :
1. **Cloning Git** : Récupération du code depuis GitHub
2. **Building Image** : Construction de l'image Docker
3. **Test Image** : Validation de la configuration nginx
4. **Publish Image** : Publication sur Docker Hub
5. **Deploy Image** : Déploiement du conteneur

Accédez à l'application déployée sur `http://localhost:8082`