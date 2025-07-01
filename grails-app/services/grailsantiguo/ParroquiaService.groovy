package grailsantiguo

import grails.gorm.services.Service

@Service(Parroquia)
interface ParroquiaService {

    Parroquia get(Serializable id)

    List<Parroquia> list(Map args)

    Long count()

    void delete(Serializable id)

    Parroquia save(Parroquia parroquia)

}