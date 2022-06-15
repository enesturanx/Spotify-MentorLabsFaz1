Feature: Spotify API Test
Background:
  * def URL = 'https://api.spotify.com/v1'
  * def userID = '31tmoih46ye73dm2z4vr45oapk7a'
  * def authID = 'Bearer BQC-INQJa3QH2NWsb0etIa7cHnrMLn-0zh1AzkMoaO-lJuu_ynKY18Px8pBgE8_-ua5mWw8DrCqIWxgbd7RMqjh1cWJCDJkLxbLRS4G9hog6ekLCNuPWS-SJUPU3ku-9guqfCuNo8EWMO2Mc94cvMg3jTtKPAOLMRDYYI9_MqNpzzmR1ZNZXnPx0SXby77h3fBuzWS02uarYn0A_VptFECOw26sXa-DCl396Pzua9TVUC8nLe7P5XFjmTNtusOPmwQ'
  * def random = function(max){ return Math.floor(Math.random() * max) + 1 }
  @ignore
  @AddPl
  Scenario: Add Playlist
    * def requestBody =
    """
    {
  "name": "Spotify Challenge",
  "description": "This playlist is for challenge",
  "public": false
    }
    """

    Given url URL
    And path '/users/'+userID+'/playlists'
    And header Authorization = authID
    And header Content-Type = 'application/json'
    And request requestBody
    When method post
    Then status 201
    And def playlistID = response.id


  @ignore
  @Search
  Scenario: Search song
    Given url URL
    And path '/search'
    And header Authorization = authID
    And header Content-Type = 'application/json'
    And param q = 'Bohemian Rhapsody'
    And param type = 'track'
    When method get
    Then status 200
    And def songUri = response.tracks.items[random(response.tracks.items.length)].uri
    * def count = response.tracks.items.length
    And print songUri


  Scenario: Add song to playlist
    * def postPl = callonce read('APITest.feature@AddPl')
    * def plId = postPl.playlistID

    * def postSearch = callonce read('APITest.feature@Search')
    * def songUri = postSearch.songUri

    Given url URL
    And path '/playlists/'+plId+'/tracks'
    And header Authorization = authID
    And header Content-Type = 'application/json'
    And request {"uris": [#(songUri)]}
    When method post
    Then status 201


