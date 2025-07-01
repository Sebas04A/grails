package grailsantiguo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class PropietarioServiceSpec extends Specification {

    PropietarioService propietarioService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Propietario(...).save(flush: true, failOnError: true)
        //new Propietario(...).save(flush: true, failOnError: true)
        //Propietario propietario = new Propietario(...).save(flush: true, failOnError: true)
        //new Propietario(...).save(flush: true, failOnError: true)
        //new Propietario(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //propietario.id
    }

    void "test get"() {
        setupData()

        expect:
        propietarioService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Propietario> propietarioList = propietarioService.list(max: 2, offset: 2)

        then:
        propietarioList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        propietarioService.count() == 5
    }

    void "test delete"() {
        Long propietarioId = setupData()

        expect:
        propietarioService.count() == 5

        when:
        propietarioService.delete(propietarioId)
        sessionFactory.currentSession.flush()

        then:
        propietarioService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Propietario propietario = new Propietario()
        propietarioService.save(propietario)

        then:
        propietario.id != null
    }
}
