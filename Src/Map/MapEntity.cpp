/**
@file Entity.cpp

Contiene la implementaci�n de la clase que representa una entidad leida 
del fichero del mapa.

@author David Llans� Garc�a
@date Agosto, 2010
*/
#include "MapEntity.h"

#include <cassert>
#include <iostream>
#include <sstream>
#include <string>
namespace Map {
	
	CEntity::CEntity(CEntity *entity)
	{
		_type = entity->getType();
		_name = entity->getName();
		_attributes = *entity->getAttributeList();
	}

	typedef std::pair<std::string, std::string> TSSPar;

	void CEntity::setAttribute(const std::string &attr, const std::string &value)
	{
		TSSPar elem(attr,value);
		if(_attributes.count(attr))
			_attributes.erase(attr);
		_attributes.insert(elem);

	} // setAttribute

	//--------------------------------------------------------

	bool CEntity::hasAttribute(const std::string &attr) const
	{
		// Casos especiales
		if(!attr.compare("name"))
			return true;
		if(!attr.compare("type"))
			return true;
		if(_attributes.count(attr))
			return true;
		return false;

	} // hasAttribute

	//--------------------------------------------------------

	const std::string &CEntity::getStringAttribute(const std::string &attr) const
	{
		// Casos especiales
		if(!attr.compare("name"))
			return _name;
		if(!attr.compare("type"))
			return _type;
		return (*_attributes.find(attr)).second;

	} // getStringAttribute

	//--------------------------------------------------------

	int CEntity::getIntAttribute(const std::string &attr) const
	{
		return atoi((*_attributes.find(attr)).second.c_str());

	} // getIntAttribute

	//--------------------------------------------------------

	float CEntity::getFloatAttribute(const std::string &attr) const
	{
		return (float)atof((*_attributes.find(attr)).second.c_str());

	} // getFloatAttribute

	//--------------------------------------------------------

	double CEntity::getDoubleAttribute(const std::string &attr) const
	{
		return atof((*_attributes.find(attr)).second.c_str());

	} // getDoubleAttribute

	//--------------------------------------------------------

	bool CEntity::getBoolAttribute(const std::string &attr) const
	{
		if(!(*_attributes.find(attr)).second.compare("true"))
			return true;
		else if(!(*_attributes.find(attr)).second.compare("false"))
			return false;
		throw new std::exception("Leido archivo booleano que no es ni true ni false.");

	} // getBoolAttribute

	//--------------------------------------------------------

	const Vector3 CEntity::getVector3Attribute(const std::string &attr) const
	{
		// Recuperamos la cadena  "x y z"

		std::string position = (*_attributes.find(attr)).second;

		int space1 = position.find(',');
		float x = (float)atof(position.substr(0,space1).c_str());
		int space2 = position.find(',',space1+1);
		float y = (float)atof(position.substr(space1+1,space2-(space1+1)).c_str());
		float z = (float)atof(position.substr(space2+1,position.size()-(space2+1)).c_str());

		return Vector3(x,y,z);

	} // getVector3Attribute

	std::vector<std::string> CEntity::getVectorSTLAttribute(const std::string &attr) const
	{
		std::string vec = (*_attributes.find(attr)).second;
		std::istringstream iss(vec);
		std::vector<std::string> vectorFinal;
		std::string token;
		
		while(std::getline(iss, token, ',')) 
		{
			vectorFinal.push_back(token);
		}

		/*
		Para usarlo:

		std::vector<std::string> vec;
		if(entityInfo->hasAttribute("array"))
		{
			vec = entityInfo->getVectorSTLAttribute("array");
		}
		*/

		return vectorFinal;
	}

	void CEntity::mergeArchetype(CEntity *archetype)
	{
		//TAttrList list = archetype->getAttributeList();
		TAttrList::iterator it = archetype->getAttributeList()->begin();//archetype->getAttributeList().begin();
		TAttrList::iterator end = archetype->getAttributeList()->end();//archetype->getAttributeList().cend();

		for(; it != end; ++it)
		{
			TAttrList::iterator find =_attributes.find(it->first);
			
			if(find == _attributes.end())//Si NO encontramos el atributo del arquetipo en nuestros atributos nos lo quedamos
			{
				//Insertamos la pareja <atributo, valor> proveniente del arquetipo
				_attributes.insert(std::pair<std::string, std::string> (it->first, it->second));
			}
		}

	}//mergeArchetype

} // namespace Map
