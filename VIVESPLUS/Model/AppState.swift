//
//  AppState.swift
//  VIVESPLUS
//
//  Created by arthur.ferket on 18/11/2024.
//

import Foundation
@Observable
class AppState {
    private var uurrooster: [EventModel]
    
    init() {
        var uurroosterJson : [EventModelJson]
        uurroosterJson = load("uurrooster.json")
        uurrooster = uurroosterJson.map({ evenModelJson in
            evenModelJson.toEventModel()
        })
    }
    
    func getEvents() -> [EventModel] {
        return uurrooster
    }
    
}
