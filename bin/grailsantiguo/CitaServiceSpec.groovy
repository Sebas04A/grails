package grailsantiguo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class CitaServiceSpec extends Specification {

    CitaService citaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Cita(...).save(flush: true, failOnError: true)
        //new Cita(...).save(flush: true, failOnError: true)
        //Cita cita = new Cita(...).save(flush: true, failOnError: true)
        //new Cita(...).save(flush: true, failOnError: true)
        //new Cita(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //cita.id
    }

    void "test get"() {
        setupData()

        expect:
        citaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Cita> citaList = citaService.list(max: 2, offset: 2)

        then:
        citaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        citaService.count() == 5
    }

    void "test delete"() {
        Long citaId = setupData()

        expect:
        citaService.count() == 5

        when:
        citaService.delete(citaId)
        sessionFactory.currentSession.flush()

        then:
        citaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Cita cita = new Cita()
        citaService.save(cita)

        then:
        cita.id != null
    }
}
