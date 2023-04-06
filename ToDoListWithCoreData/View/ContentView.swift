//
//  ContentView.swift
//  ToDoListWithCoreData
//
//  Created by 권정근 on 2023/04/06.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var items: FetchedResults<Todolist>
    
    @State private var showingAddScreen = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Text("Count: \(items.count)")
                .navigationTitle("ToDoList!😍")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddScreen.toggle()
                        } label: {
                            Label("Add Items", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddToDo()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
