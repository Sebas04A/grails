package grailsantiguo

import grails.gorm.services.Service

@Service(Agente)
interface AgenteService {

    Agente get(Serializable id)

    List<Agente> list(Map args)

    Long count()

    void delete(Serializable id)

    Agente save(Agente agente)

}