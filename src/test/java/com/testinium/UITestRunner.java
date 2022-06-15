package com.testinium;

import com.intuit.karate.junit5.Karate;

class UITestRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("UITest").relativeTo(getClass());
    }    

}
