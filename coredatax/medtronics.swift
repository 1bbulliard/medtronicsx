//
//  coredataxApp.swift
//  coredatax
//
//  Created by Bob Bulliard on 4/20/22.
//

import SwiftUI

@main
struct coredataxApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
