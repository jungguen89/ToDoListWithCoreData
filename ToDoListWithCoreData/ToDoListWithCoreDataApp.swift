//
//  ToDoListWithCoreDataApp.swift
//  ToDoListWithCoreData
//
//  Created by 권정근 on 2023/04/06.
//

import SwiftUI

@main
struct ToDoListWithCoreDataApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext,dataController.container.viewContext)
        }
    }
}
