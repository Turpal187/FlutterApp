import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';

class GoogleCalendarApi
{
  static final _accountCredentials = new ServiceAccountCredentials.fromJson({

    "type": "service_account",
    "project_id": "flutter-admin-panel-332220",
    "private_key_id": "f954f4f292821e55387dbe0c4e0918275fa72f30",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEugIBADANBgkqhkiG9w0BAQEFAASCBKQwggSgAgEAAoIBAQCYX2ljtb7KPRxn\nzgRdPwVzyAeBoAfO2cK/r/W6i1zJgLs5XGCpi3w8Li/38j9dKvK2rVFcikUYuXyB\nxrDzoKsueeHSB3tzcNhO+lQwNMSG1ZujdrI71TS1VfyeFUMJNoLLJTmOVs8Wl7I4\npF8TtEU02kAVk1oTEhGNMUhYs44dd56YW5SuMLnJ7smguEWvotUWS20UZcuNn8qN\nQTGC0GgNoj9uWe4zKjduKTYfwqxAg04p2bMi0vtJIPC/1G8Ic84eUXdySllvktB1\nTYlrGV+L7WaIYGv8/dch0Upnba+xZ2ID8ZQE9S6trwZ9fAu0i1tegoOEMmaRi2QA\nfh06hsx5AgMBAAECgf8WoEBEOgV9d3+uB6QTSo3nc+YeembLq+lu3eGqSl8+sVBP\nE07+GKYNQll+DfN/WuTxhIk07ydpcjBQVtymr8OloxvaUm3+0AEUS34tjRYWw6i0\nQdJLjIzdEAiT9H5bQpwE1400ZivsbRaJ3aQUwaUeyfliX14wSuFQVDCoLnaB4iA+\nhhcuDE26Jx4MzCU42iBhB9R9mO9gglogkTdBC0hossB9F0suhjrXuSTSg49sQtCu\n9gdHFEr3gDE6JQzAPUBT1N8e4/DekLKMSaWhNPpvNgUwFDD1xiVUpQVzJKN8aSbV\nitQovE6MJn8xNrfYljWNIMoe4ClBWc1SZPV8t18CgYEAzyzLEhQ6gNVOTTtISwNz\nO+nt9wl3eK6NqLgq4qdqaBxvRtCayfCHacks3JS3ATitnZSzWSX6gqIUeOhZoNt4\n7Wkr5wBJ1G+DmnouedTzDZaxHnRZ8DEj/D+DcIOk9rEmOVTa7HX+9h+0xo8lOCGV\ndYeMVptGtkX9NB56+4V1FbMCgYEAvEhOqh3i/xx12yOIo3njXbO5qPwG4BRb0lCU\nbkS5Qa1n9GAUTjJaL+YkwBQ6oxYfUYWg7qbJeD7/qOkf2udmzeIYAYTTXrFrTzGT\nscQoMMcIikZYlz2z0I8OMuqpcCux8gasyniYEtxJm87PG7WoRhObqSqrpKOAhlzL\nE+HHVyMCgYBwYV3ueqaZiBunbUbz2fVCRMzeunXiMt2I7g3lUOc5fmMmSLYOYLkz\nuvro1IrI0NPsrOL0stNG1WDBjVhBF4xrTCeScOeboroCq9BWKhuF/X4qhPbcgeuB\nQ3qrJ93uK34Oj2cJ6Z/aJqzLII8R+bW3QUXxHN2otiJ5iScxFN3EXQKBgBwoUCNe\nztjKH9IC8WdJTjhwLV7ZOgn+4XCFfn0zJ+VrknVYfRDotNYe+/YB0HcdUte1PUkT\nhmPGQCO5oXrySkyV+HMZsyahL+QrDORz6nLJATz0okEUCDUzf7MbpvVQg48ncmXh\nPRTs/tEfT5fcResc+ZWF/R9lGE5/yBsUE+SzAoGAO60HI7e05JRyH4LGxm0vePuy\n6+SZ0YpbrWE39HnO44VZVg0UXeKmTSDEc0u8A49F9zhp78bCZE7hYNLNg585Sbd1\nfvs2Out7GlsjyEfoiseP76m5QtweubirwdbNsIi/nGPO5QdIc4LcTdlbKcXcg9LG\nfs5LLFjeDHBn7CRKS2E=\n-----END PRIVATE KEY-----\n",
    "client_email": "flutter-admin-panel@flutter-admin-panel-332220.iam.gserviceaccount.com",
    "client_id": "103994578625347281571"
  
  });

  static var _scopes = [CalendarApi.calendarScope];

  static void getCalendarEvents() { 
    
    clientViaServiceAccount(GoogleCalendarApi._accountCredentials, GoogleCalendarApi._scopes).then(
      
      (client) {
      
        var calendar = new CalendarApi(client);
        var calEvents = calendar.events.list("primary");
        calEvents.then((Events events) {
          
          events.items?.forEach((Event event) {
            
            print(event.summary);
            
          });
      
      });
    
    }).catchError((e) => print(e));

  }

}