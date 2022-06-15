Feature: Spotify UI Test

  Background:
    * configure driver = {type:'chromedriver' , executable:'src/test/resources/chromedriver.exe'}
    * def bekle = function(pause){ java.lang.Thread.sleep(pause*1000) }
    * def baseUrl = 'https://open.spotify.com/'
    * def email = 'testenes45@gmail.com'
    * def password = 'Testinium1548'


  Scenario: Spotify UI Test Scenario
    Given driver baseUrl
    * maximize()
    When waitFor('{}Oturum aç').click()
    And waitFor('input[id=login-username]').input(email)
    And waitFor('input[id=login-password]').input(password)
    And waitFor('{}Oturum Aç').click()
    And match waitFor('.odcjv30UQnjaTv4sylc0').enabled == true
    And waitFor("button[class=IPVjkkhh06nan7aZK7Bx]").click()
    And waitFor('.o4KVKZmeHsoRZ2Ltl078').click()
    And waitFor('input[data-testid=playlist-edit-details-name-input]').input('MentorLabs Challenge')
    And waitFor('button[data-testid=playlist-edit-details-save-button]').click()
    And waitFor('input[role=searchbox]').input('Daft Punk')
    And waitFor('button[data-testid=add-to-playlist-button]').click()
    And bekle(3)






