package grailsantiguo

import grails.gorm.services.Service

@Service(Propiedad)
interface PropiedadService {

    Propiedad get(Serializable id)

    List<Propiedad> list(Map args)

    Long count()

    void delete(Serializable id)

    Propiedad save(Propiedad propiedad)

}