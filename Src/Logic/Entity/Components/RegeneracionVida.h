/**
@author Cesar Manuel Paz Guzman
@date Mayo, 2015
*/

#ifndef __Logic__RegeneracionVida__H
#define __Logic__RegeneracionVida__H

#include "Logic/Entity/Component.h"

//declaración de la clase
namespace Logic 
{

	class CRegeneracionVida : public IComponent
	{
		DEC_FACTORY(CRegeneracionVida);
	public:

		/**
		Constructor por defecto; en la clase base no hace nada.
		*/
		CRegeneracionVida() : IComponent(){}
		
		virtual ~CRegeneracionVida();
		/**
		Inicialización del componente usando la descripción de la entidad que hay en 
		el fichero de mapa.
		*/
		virtual bool OnSpawn(const Map::CEntity *entityInfo);

		virtual bool respawn(const Map::CEntity *entityInfo);

		virtual void onTick(unsigned int msecs);

		virtual bool activate();

		virtual void deactivate();

		/**
		Este componente sólo acepta mensajes de tipo HABILIDAD.
		*/
		virtual bool accept(const std::shared_ptr<Logic::IMessage> &message);

		/**
		Al recibir un mensaje de tipo HABILIDAD mira si el tipo de habilidad es el de aumentar salto, y de ser asi aumento el salto y la dispierto
		*/
		virtual void process(const std::shared_ptr<Logic::IMessage> &message);

	protected:

		//Vida que aumentar en cada cogida de habilidad
		float _lifeToAument;

		//Tiempo que se ejecuta cada ciclo de regeneracion. 
		unsigned int _timeToAument;

		unsigned int _totalTimeToCiclo;

		unsigned int _timeStamp;
	}; 

	REG_FACTORY(CRegeneracionVida);

} // namespace Logic

#endif 
