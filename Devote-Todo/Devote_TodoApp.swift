//
//  Devote_TodoApp.swift
//  Devote-Todo
//
//  Created by SMIT KHOKHARIYA on 2024-03-18.
//

import SwiftUI

@main
struct Devote_TodoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
