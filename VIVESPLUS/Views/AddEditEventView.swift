//
//  AddEditEventView.swift
//  VIVESPLUS
//
//  Created by arthur.ferket on 18/11/2024.
//

import SwiftUI

struct AddEditEventView: View {
    @Environment(UurroosterDataStore.self) var dataStore
    @State var selectedEvent: EventModel
    @Environment(\.presentationMode) var presentationMode
    var isNew : Bool
    var body: some View {
        if isNew == true {
            Text("ADD EVENT")
            VStack {
                VStack {
                    Text("Title?")
                    Divider()
                    TextField("", text: $selectedEvent.title)
                    Divider()
                    TextField("Location?", text: $selectedEvent.location)
                    Divider()
                    Toggle("All day?", isOn: $selectedEvent.allDay)
                    Divider()
                    Text("Start date & time?")
                    Divider()
                    DatePicker("",selection: $selectedEvent.startDateTime, displayedComponents: [.date, .hourAndMinute] )
                    Divider()
                    Text("End date & time?")
                    Divider()
                    DatePicker("",selection: $selectedEvent.endDateTime, displayedComponents: [.date, .hourAndMinute] )
                    Divider()
                    Picker(selection: $selectedEvent.type, label: Text("Type")) {
                        Text("Academic").tag(0)
                        Text("Course").tag(1)
                    }.pickerStyle(SegmentedPickerStyle()).padding(.all , 4)
                }.padding().background(Color(.white))
            }.padding().background(Color(.lightGray))
            HStack {
                Button("SAVE") {
                    dataStore.addEvent(event: selectedEvent)
                    self.presentationMode.wrappedValue.dismiss()
                }
                Button("CANCEL") {
                    
                }
            }.foregroundStyle(Color(.red))
        } else {
            Text("EDIT EVENT")
            VStack {
                VStack {
                    TextField("Title", text: $selectedEvent.title)
                    Divider()
                    TextField("Location", text: $selectedEvent.location)
                    Divider()
                    Toggle("All day?", isOn: $selectedEvent.allDay)
                    Divider()
                    HStack {
                        Text("Date")
                        DatePicker("",selection: $selectedEvent.startDateTime, displayedComponents: [.date, .hourAndMinute] )
                    }
                    Divider()
                    Picker(selection: $selectedEvent.type, label: Text("Type")) {
                        Text("Academic").tag(0)
                        Text("Course").tag(1)
                    }.pickerStyle(SegmentedPickerStyle()).padding(.all , 4)
                }.padding().background(Color(.white))
            }.padding().background(Color(.lightGray))
            HStack {
                Button("SAVE") {
                    dataStore.updateEvent(updatedEvent: selectedEvent)
                    self.presentationMode.wrappedValue.dismiss()
                }
                Button("CANCEL") {
                    
                }
            }.foregroundStyle(Color(.red))
        }
        
        
    }
}
