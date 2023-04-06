//
//  AddToDo.swift
//  ToDoListWithCoreData
//
//  Created by 권정근 on 2023/04/06.
//

import SwiftUI

struct AddToDo: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var specifics = ""
    @State private var rating = 3
    @State private var category = ""
    
    let categories = ["Exercise", "Study", "Shopping", "Meeting", "Travel", "Hobby"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title of ToDoItem", text: $title)
                    
                    Picker("Category", selection: $category) {
                        ForEach(categories, id:\.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextEditor(text: $specifics)
                    RatingView(rating: $rating)
//                    Picker("Importance", selection: $rating) {
//                        ForEach(0..<6) {
//                            Text(String($0))
//                        }
//                    }
                } header : {
                    Text("Write a specifice of title")
                }
                
                Section {
                    Button("Save"){
                        // add the book
                        let newtodolist = Todolist(context: moc)
                        newtodolist.id = UUID()
                        newtodolist.title = title
                        newtodolist.specifics = specifics
                        newtodolist.rating = Int16(rating)
                        newtodolist.category = category
                        
                        try? moc.save()
                        dismiss()
                    }
                    .foregroundColor(Color.red)
                }
            }
            .navigationTitle("Add ToDoItem")
        }
    }
}

struct AddToDo_Previews: PreviewProvider {
    static var previews: some View {
        AddToDo()
    }
}
