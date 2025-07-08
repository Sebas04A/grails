package grailsantiguo

import grails.testing.web.interceptor.InterceptorUnitTest
import spock.lang.Specification

class WardInterceptorSpec extends Specification implements InterceptorUnitTest<WardInterceptor> {

    def setup() {
    }

    def cleanup() {

    }

    void "Test ward interceptor matching"() {
        when:"A request matches the interceptor"
            withRequest(controller:"ward")

        then:"The interceptor does match"
            interceptor.doesMatch()
    }
}
