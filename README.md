# spreadsheet-To-Gcal
A very basic tool to parse schedules in tables as csv into Google Calendar Events

With this tool you may convert a table filled with events, names, etc, into Google Calendar Events.

How it works?

  1. Make a table where each row represents an hour and each column represents a day; the program suposes they are consecutive.
  2. Export your table as a CSV file. F.e. with Google Spreadsheets you need a sheet with only the events, no days or hours.
  3. Go into the code and change the  "dayInitial", "monthInitial", "yearInitial", "hora" and "location" to set:
    dayInitial -> first day in the schedule
    monthInitial -> month corresponding to the first day
    yearInitial -> year corresponding to the first day
    hora -> hour at which the first event starts
    location -> if you want to specify a location for your events
  4. Go into the code again and change the names of the files you want as input and output
  5. Execute the code with ruby
