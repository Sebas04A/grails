package grailsantiguo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ParroquiaServiceSpec extends Specification {

    ParroquiaService parroquiaService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Parroquia(...).save(flush: true, failOnError: true)
        //new Parroquia(...).save(flush: true, failOnError: true)
        //Parroquia parroquia = new Parroquia(...).save(flush: true, failOnError: true)
        //new Parroquia(...).save(flush: true, failOnError: true)
        //new Parroquia(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //parroquia.id
    }

    void "test get"() {
        setupData()

        expect:
        parroquiaService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Parroquia> parroquiaList = parroquiaService.list(max: 2, offset: 2)

        then:
        parroquiaList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        parroquiaService.count() == 5
    }

    void "test delete"() {
        Long parroquiaId = setupData()

        expect:
        parroquiaService.count() == 5

        when:
        parroquiaService.delete(parroquiaId)
        sessionFactory.currentSession.flush()

        then:
        parroquiaService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Parroquia parroquia = new Parroquia()
        parroquiaService.save(parroquia)

        then:
        parroquia.id != null
    }
}
