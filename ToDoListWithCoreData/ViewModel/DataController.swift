//
//  DataController.swift
//  ToDoListWithCoreData
//
//  Created by 권정근 on 2023/04/06.
//

import CoreData
import Foundation

// DataController 클래스 생성 (데이터 로드 설정)
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "ToDoList")
    
    // 클래스 인스턴스 생성 시
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data faile to load: \(error.localizedDescription)")
            }
        }
    }
}
