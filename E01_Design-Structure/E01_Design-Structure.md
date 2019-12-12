# Design Structure

Example a "Community Center"

## Entities

    Center
      ID: Int<unique>
      address: String<42> | ref(Address)
      status: Enum[open, closed]

    Person
      ID: Int<unique>
      name: String<not empty>
      age: Int<0..>
      address: String<42> | ref(Address)

    Room
      ID: Int<unique>
      center: ref(Center)
      capacity: Int<0..>

    TimeSlot
      ID: Int<unique>
      start_time: Time
      end_time: Time

    Activity
      ID: Int<unique>
      title: String<42>
      desc: Text

## Relationships

    Meeting
      ID: Int<unique>
      time: ref(TimeSlot)
      room: ref(Room)
      
    MeetingPerson
      person: ref(Person)
      meeting: ref(Meeting)

    MeetingActivity
      activity: ref(Activity)
      meeting: ref(Meeting)

