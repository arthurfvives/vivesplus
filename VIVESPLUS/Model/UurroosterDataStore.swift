//
//  UurroosterDataStore.swift
//  Uurrooster
//
//  Created by Dirk Hostens on 14/10/2022.
//

import Foundation
@Observable
class UurroosterDataStore {
    var uurrooster : [EventModel]
    
    init() {
        uurrooster = AppState().getEvents()
        uurrooster = sort()
    }
    
    private func sort() -> [EventModel] {
        return Array(Set(uurrooster)).sorted { event1, event2 in
            event1.startDateTime < event2.startDateTime
        }
    }
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: date)
    }
    
    func formatDateHour(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: date)
    }
    
    func getDate(string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        let date = formatter.date(from: string)
        return date ?? Date()
    }
    
    
    func addEvent(event: EventModel) {
        event.id = UUID().uuidString
        uurrooster.append(event)
        uurrooster = sort()
    }
    
    func updateEvent(updatedEvent: EventModel) {
        for event in uurrooster {
            if event.id == updatedEvent.id {
                //event = updatedEvent
                event.title = updatedEvent.title
                event.endDateTime = updatedEvent.endDateTime
                event.location = updatedEvent.location
                event.startDateTime = updatedEvent.startDateTime
                event.type = updatedEvent.type
                event.allDay = updatedEvent.allDay
            }
        }
        uurrooster = sort()
    }
    
    func deleteEvent(id: String) {
        
    }
    
    func getEvent(id: String) -> EventModel? {
        for event in uurrooster {
            if event.id == id {
                return event
            }
        }
        return nil
    }
    
    func getEvents() -> [EventModel] {
        return uurrooster
    }
    
}

struct EventModelJson: Hashable, Codable, Identifiable {
    var id:String = ""
    var allDay: Bool = false
    var title: String = ""
    var location: String? = nil
    var type: String = ""
    var startDateTime: String = ""
    var endDateTime: String = ""
    
    var formattedStartDateTime: String {
        get {
            return startDateTime.replacingOccurrences(of: "T", with: " ")
        }
    }
    var formattedEndDateTime: String {
        get {
            return endDateTime.replacingOccurrences(of: "T", with: " ")
        }
    }
    var formattedAllDayStartTime: String {
        get {
            return String(startDateTime.split(separator: "T")[0])
        }
    }
    func getEventInput() -> (title: String, location: String, allDay: Bool, startDate: Date, endDate: Date, type: Int ) {
        return (self.title, self.location == nil ? "" : location!, allDay, DateUtil.getDate(string: startDateTime), DateUtil.getDate(string: endDateTime), type.elementsEqual("academic") ? 0 : 1)
    }
    
    func toEventModel() -> EventModel {
        let eventModel = EventModel()
        eventModel.id = self.id
        eventModel.allDay = self.allDay
        eventModel.title = self.title
        eventModel.location = self.location ?? ""
        eventModel.startDateTime = DateUtil.getDate(string: self.startDateTime)
        eventModel.endDateTime = DateUtil.getDate(string: self.endDateTime)
        if self.type.elementsEqual("academic") {
            eventModel.type = 0
        } else {
            eventModel.type = 1
        }
        return eventModel
    }
}
