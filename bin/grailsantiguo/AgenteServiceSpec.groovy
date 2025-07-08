package grailsantiguo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class AgenteServiceSpec extends Specification {

    AgenteService agenteService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Agente(...).save(flush: true, failOnError: true)
        //new Agente(...).save(flush: true, failOnError: true)
        //Agente agente = new Agente(...).save(flush: true, failOnError: true)
        //new Agente(...).save(flush: true, failOnError: true)
        //new Agente(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //agente.id
    }

    void "test get"() {
        setupData()

        expect:
        agenteService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Agente> agenteList = agenteService.list(max: 2, offset: 2)

        then:
        agenteList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        agenteService.count() == 5
    }

    void "test delete"() {
        Long agenteId = setupData()

        expect:
        agenteService.count() == 5

        when:
        agenteService.delete(agenteId)
        sessionFactory.currentSession.flush()

        then:
        agenteService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Agente agente = new Agente()
        agenteService.save(agente)

        then:
        agente.id != null
    }
}
