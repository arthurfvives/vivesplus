//
//  UurroosterListView.swift
//  VIVESPLUS
//
//  Created by arthur.ferket on 12/11/2024.
//

import SwiftUI

struct UurroosterListView: View {
    @Environment(UurroosterDataStore.self) var dataStore
    @State var selectedEvent: EventModel?
    var body: some View {
        NavigationSplitView {
            List(dataStore.getEvents(),id: \.self, selection: $selectedEvent) {event in
                Text(event.title)
            }.navigationTitle("Uurrooster").toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("+") {
                        if selectedEvent != nil {
                            
                        }
                    }
                }
            }
            
        } detail: {
            if (selectedEvent != nil) {
                UurroosterDetailView(selectedEvent: selectedEvent!).navigationTitle("Uurrooster detail").toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Aanpassen") {
                            
                        }
                    }
                }
            }
        }
        
    }
}


