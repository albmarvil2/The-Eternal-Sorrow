/**
@author Cesar Manuel Paz Guzman
@date Mayo, 2015
*/

#ifndef __Logic__AumentarTiempoReto__H
#define __Logic__AumentarTiempoReto__H

#include "Logic/Entity/Component.h"

//declaraci�n de la clase
namespace Logic 
{

	class CAumentarTiempoReto : public IComponent
	{
		DEC_FACTORY(CAumentarTiempoReto);
	public:

		/**
		Constructor por defecto; en la clase base no hace nada.
		*/
		CAumentarTiempoReto() : IComponent(){}
		
		virtual ~CAumentarTiempoReto();
		/**
		Inicializaci�n del componente usando la descripci�n de la entidad que hay en 
		el fichero de mapa.
		*/
		virtual bool OnSpawn(const Map::CEntity *entityInfo);

		virtual bool respawn(const Map::CEntity *entityInfo);

		virtual void onTick(unsigned int msecs);

		virtual bool activate();

		virtual void deactivate();

		/**
		Este componente s�lo acepta mensajes de tipo HABILIDAD.
		*/
		virtual bool accept(const std::shared_ptr<Logic::IMessage> &message);

		/**
		Al recibir un mensaje de tipo HABILIDAD mira si el tipo de habilidad es el de aumentar salto, y de ser asi aumento el salto y la dispierto
		*/
		virtual void process(const std::shared_ptr<Logic::IMessage> &message);

	}; 

	REG_FACTORY(CAumentarTiempoReto);

} // namespace Logic

#endif 