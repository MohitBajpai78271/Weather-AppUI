//
//  Weather_AppUIApp.swift
//  Weather-AppUI
//
//  Created by Mac on 03/12/24.
//

import SwiftUI

@main
struct Weather_AppUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
