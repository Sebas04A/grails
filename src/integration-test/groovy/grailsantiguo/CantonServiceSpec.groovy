package grailsantiguo

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class CantonServiceSpec extends Specification {

    CantonService cantonService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new Canton(...).save(flush: true, failOnError: true)
        //new Canton(...).save(flush: true, failOnError: true)
        //Canton canton = new Canton(...).save(flush: true, failOnError: true)
        //new Canton(...).save(flush: true, failOnError: true)
        //new Canton(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //canton.id
    }

    void "test get"() {
        setupData()

        expect:
        cantonService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<Canton> cantonList = cantonService.list(max: 2, offset: 2)

        then:
        cantonList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        cantonService.count() == 5
    }

    void "test delete"() {
        Long cantonId = setupData()

        expect:
        cantonService.count() == 5

        when:
        cantonService.delete(cantonId)
        sessionFactory.currentSession.flush()

        then:
        cantonService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        Canton canton = new Canton()
        cantonService.save(canton)

        then:
        canton.id != null
    }
}
