import 'package:admin/services/google_auth_api.dart';
import 'package:googleapis/calendar/v3.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';

class GoogleCalendarApi
{
  static Future<void> addCalendarEvent(String title, DateTime startDate, DateTime endDate) async
  {
    final authClient = await GoogleAuthApi.googleSignIn.authenticatedClient();  
    final calendarApi = new CalendarApi(authClient!);

    Event event = Event();
    event.summary = title;

    EventDateTime eventStart = EventDateTime(dateTime: startDate);
    EventDateTime eventEnd   = EventDateTime(dateTime: endDate);

    event.start = eventStart;
    event.end = eventEnd;

    // Initialize calendar id if its not set already
    calendarApi.calendarList.list( ).then((CalendarList list) 
    { 
      list.items!.forEach((CalendarListEntry entry) 
      { 
        if (entry.primary == true)
        {
          calendarApi.events.insert(event, entry.id ?? '');
        }
      }); 
    });
  }

}