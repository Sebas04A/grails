package grailsantiguo

import grails.gorm.services.Service

@Service(Propietario)
interface PropietarioService {

    Propietario get(Serializable id)

    List<Propietario> list(Map args)

    Long count()

    void delete(Serializable id)

    Propietario save(Propietario propietario)

}