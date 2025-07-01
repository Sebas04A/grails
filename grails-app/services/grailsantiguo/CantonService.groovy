package grailsantiguo

import grails.gorm.services.Service

@Service(Canton)
interface CantonService {

    Canton get(Serializable id)

    List<Canton> list(Map args)

    Long count()

    void delete(Serializable id)

    Canton save(Canton canton)

}