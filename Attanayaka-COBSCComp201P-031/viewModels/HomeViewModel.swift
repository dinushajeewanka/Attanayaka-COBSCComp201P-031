//
//  HomeViewModel.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-24.
//

import Foundation
import FirebaseFirestore

class HomeViewModel: ObservableObject {
    
    @Published var parks = [ParkData]()
    @Published var parkLoad = false
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        self.parkLoad = true
        db.collection("parksSlots").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                self.parkLoad = false
                return
            }
            self.parks = documents.map { queryDocumentSnapshot -> ParkData in
                let data = queryDocumentSnapshot.data()
                let park_Name = data["park_name"] as? String ?? ""
                let park_type = data["park_type"] as? String ?? ""
                let reserve = data["reserve"] as? Bool ?? false
                let book = data["book"] as? Bool ?? false
                let book_time = data["book_time"] as? Timestamp
                let dateex = Date(timeIntervalSinceReferenceDate: 118800)

                let date: Date = book_time?.dateValue() ?? dateex

                self.parkLoad = false
                return ParkData(id: .init(), park_Name: park_Name, park_type: park_type, book: book, reserve: reserve, book_time: date)
            }
        }
    }
}
