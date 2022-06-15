package com.testinium;

import com.intuit.karate.junit5.Karate;

class APITest {

    @Karate.Test
    Karate testUsers() {
        return Karate.run("APITest").relativeTo(getClass());
    }

}
