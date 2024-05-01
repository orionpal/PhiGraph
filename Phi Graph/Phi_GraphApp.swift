//
//  Phi_GraphApp.swift
//  Phi Graph
//
//  Created by Orion Palaquibay on 5/1/24.
//

import SwiftUI

@main
struct Phi_GraphApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
