//
//  UurroosterDetailView.swift
//  VIVESPLUS
//
//  Created by arthur.ferket on 12/11/2024.
//

import SwiftUI

struct UurroosterDetailView: View {
    @Environment(UurroosterDataStore.self) var dataStore
    var selectedEvent: EventModel
    var body: some View {
        VStack(spacing: 8) {
            Text(selectedEvent.title).padding().frame(maxWidth: .infinity, alignment: .center).background(RoundedRectangle(cornerRadius: 10).fill(Color.red)).foregroundStyle(Color.white).presentationCornerRadius(10)
            Divider()
            if selectedEvent.location != "" {
                Text(selectedEvent.location).frame(maxWidth: .infinity, alignment: .leading)
            } else {
                Text("Locatie niet gekend").frame(maxWidth: .infinity, alignment: .leading)
            }
            
            if selectedEvent.allDay == true {
                HStack {
                    Text("\(dataStore.formatDate(date: selectedEvent.startDateTime))  -  volledige dag").frame(maxWidth: .infinity, alignment: .leading)
                }
            } else {
                HStack {
                    Text("Start")
                    Spacer()
                    Text("\(dataStore.formatDateHour(date: selectedEvent.startDateTime))")
                }
                HStack {
                    Text("Einde")
                    Spacer()
                    Text("\(dataStore.formatDateHour(date: selectedEvent.endDateTime))")
                }
            }
            Divider()
            if selectedEvent.type == 0 {
                Image(systemName: "c.circle")
            } else {
                Image(systemName: "a.circle")
            }
            Spacer()
        }.padding()
    }
}
#Preview {
    Text("oets")
}
