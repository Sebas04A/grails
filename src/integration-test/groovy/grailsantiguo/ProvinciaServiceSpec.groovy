package grailsantiguo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ProvinciaServiceSpec extends Specification {

    ProvinciaService provinciaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Provincia(...).save(flush: true, failOnError: true)
        //new Provincia(...).save(flush: true, failOnError: true)
        //Provincia provincia = new Provincia(...).save(flush: true, failOnError: true)
        //new Provincia(...).save(flush: true, failOnError: true)
        //new Provincia(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //provincia.id
    }

    void "test get"() {
        setupData()

        expect:
        provinciaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Provincia> provinciaList = provinciaService.list(max: 2, offset: 2)

        then:
        provinciaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        provinciaService.count() == 5
    }

    void "test delete"() {
        Long provinciaId = setupData()

        expect:
        provinciaService.count() == 5

        when:
        provinciaService.delete(provinciaId)
        sessionFactory.currentSession.flush()

        then:
        provinciaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Provincia provincia = new Provincia()
        provinciaService.save(provincia)

        then:
        provincia.id != null
    }
}
