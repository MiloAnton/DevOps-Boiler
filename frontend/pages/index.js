import axios from 'axios';
import { useState, useEffect } from 'react';
import classNames from 'classnames';

export default function Home() {
  const [cars, setCars] = useState([]);
  const [changingId, setChangingId] = useState(null); // ID de la voiture en cours de changement

  useEffect(() => {
    async function fetchCars() {
      const response = await axios.get(`http://localhost:3001/cars`);
      setCars(response.data);
    }
    fetchCars();
  }, []);

  const toggleAvailability = async (id) => {
    try {
      setChangingId(id); // Activer l'animation pour la voiture en cours de changement

      const response = await axios.put(`http://localhost:3001/cars/${id}/toggle`);
      setCars((prevCars) =>
        prevCars.map((car) =>
          car.id === id ? { ...car, available: response.data.available } : car
        )
      );

      // Retirer l'animation après un léger délai pour que l'effet visuel se termine
      setTimeout(() => setChangingId(null), 400);
    } catch (error) {
      console.error('Erreur lors de la mise à jour de la disponibilité', error);
    }
  };

  return (
    <div className="container">
      <h1>Liste des voitures</h1>
      <ul>
        {cars.map((car) => (
          <li key={car.id}>
            <span>{car.name}</span>
            <span
              className={classNames('status', car.available ? 'available' : 'unavailable', {
                'status-changing': changingId === car.id,
              })}
            >
              {car.available ? 'Disponible' : 'Indisponible'}
            </span>
            <button onClick={() => toggleAvailability(car.id)}>
              Changer la disponibilité
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}
