#ifndef __Logic_IAApproachMultiDir_H
#define __Logic_IAApproachMultiDir_H

#include "Logic/Entity/Component.h"

namespace Logic 
{
	class CIAApproachMultiDir : public IComponent
	{
		DEC_FACTORY(CIAApproachMultiDir);

	public:

		CIAApproachMultiDir() : IComponent() {}

		virtual ~CIAApproachMultiDir();
		
		/**
		Inicializaci�n del componente, utilizando la informaci�n extra�da de
		la entidad le�da del mapa (Maps::CEntity). Se accede a los atributos 
		necesarios como la c�mara gr�fica y se leen atributos del mapa.

		@param entity Entidad a la que pertenece el componente.
		@param map Mapa L�gico en el que se registrar� el objeto.
		@param entityInfo Informaci�n de construcci�n del objeto le�do del
			fichero de disco.
		@return Cierto si la inicializaci�n ha sido satisfactoria.
		
		@remarks ESTE M�TODO NO DEBE SER MODIFICADO POR EL USUARIO
		*/
		virtual bool OnSpawn(const Map::CEntity *entityInfo);

		/**
		M�todo que activa el componente; invocado cuando se activa
		el mapa donde est� la entidad a la que pertenece el componente.

		@return true si todo ha ido correctamente.
		*/
		virtual bool activate();

		/**
		M�todo que desactiva el componente; invocado cuando se
		desactiva el mapa donde est� la entidad a la que pertenece el
		componente. Se invocar� siempre, independientemente de si estamos
		activados o no.
		*/
		virtual void deactivate();

		/**
		M�todo llamado en cada frame que actualiza el estado del componente.

		@param msecs Milisegundos transcurridos desde el �ltimo tick.
		*/
		virtual void onTick(unsigned int msecs);

		virtual bool onAwake();

		/**
		M�todo virtual que elige que mensajes son aceptados.

		@param message Mensaje a chequear.
		@return true si el mensaje es aceptado.
		*/
		virtual bool accept(const std::shared_ptr<Logic::IMessage> &message);

		/**
		M�todo virtual que procesa un mensaje.

		@param message Mensaje a procesar.
		*/
		virtual void process(const std::shared_ptr<Logic::IMessage> &message);

		/**
		Metodo que sirve para setear el entityInfo y el map en donde sera respawneada. No pongo solo la posicion, sino mas bien
		el entityInfo entero, porque puede ocurrir que queramos setear por ejemplo, la vida que tenga un enemigo, dado
		que los enemigos se haran mas fuertes. 

		@param map Mapa Logic en el que se registrara la entidad
		@param entity Informacion de construccion de la entidad leida del fichero
		@return Cierto si el respawn ha sido satisfatorio
		**/
		virtual bool respawn(const Map::CEntity* entityInfo);

		Vector3 getDirection(){return _direction;}

		float getDistance(){return _direction.length();}

		int getMinDistSlowdown(){return _minDistSlowdown;}

		bool canMove() const { return _canMove;}

		Vector3 calculateVelocity(unsigned int msecs, float &velMax);


	protected:

		CEntity *_target;
		float gravedad;
		int rangoDestino;
		float _accelMov;
		float _velMov;
		Vector3 _direction;
		Vector3 _velFinal;
		int _minDistSlowdown;
		bool _canMove;
		bool _runningAway;

	}; // class Controller

	REG_FACTORY(CIAApproachMultiDir);

} // namespace Logic

#endif // __Logic_Controller_H