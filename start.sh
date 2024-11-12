#!/bin/bash

echo "Choisissez l'option de lancement pour les services Docker:"
echo "1 - API seule"
echo "2 - Base de données seule"
echo "3 - Frontend seul"
echo "4 - Tous les services ensemble"
echo "5 - Arrêter tous les services"

read -p "Entrez votre choix (1-5): " choice

if [[ $choice -ne 5 ]]; then
  read -p "Souhaitez-vous lancer en mode détaché ? (y/n): " detached
  if [[ "$detached" == "y" ]]; then
    detached_flag="-d"
  else
    detached_flag=""
  fi
fi

case $choice in
  1)
    echo "Démarrage de l'API seule..."
    docker-compose --profile api up $detached_flag
    ;;
  2)
    echo "Démarrage de la base de données seule..."
    docker-compose --profile db up $detached_flag
    ;;
  3)
    echo "Démarrage du frontend seul..."
    docker-compose --profile front up $detached_flag
    ;;
  4)
    echo "Démarrage de tous les services..."
    docker-compose --profile full up $detached_flag
    ;;
  5)
    echo "Arrêt de tous les services..."
    docker-compose down
    ;;
  *)
    echo "Option invalide. Veuillez choisir un nombre entre 1 et 5."
    ;;
esac
