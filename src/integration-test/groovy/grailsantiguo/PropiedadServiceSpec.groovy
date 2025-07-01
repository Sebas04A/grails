package grailsantiguo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PropiedadServiceSpec extends Specification {

    PropiedadService propiedadService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Propiedad(...).save(flush: true, failOnError: true)
        //new Propiedad(...).save(flush: true, failOnError: true)
        //Propiedad propiedad = new Propiedad(...).save(flush: true, failOnError: true)
        //new Propiedad(...).save(flush: true, failOnError: true)
        //new Propiedad(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //propiedad.id
    }

    void "test get"() {
        setupData()

        expect:
        propiedadService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Propiedad> propiedadList = propiedadService.list(max: 2, offset: 2)

        then:
        propiedadList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        propiedadService.count() == 5
    }

    void "test delete"() {
        Long propiedadId = setupData()

        expect:
        propiedadService.count() == 5

        when:
        propiedadService.delete(propiedadId)
        sessionFactory.currentSession.flush()

        then:
        propiedadService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Propiedad propiedad = new Propiedad()
        propiedadService.save(propiedad)

        then:
        propiedad.id != null
    }
}
