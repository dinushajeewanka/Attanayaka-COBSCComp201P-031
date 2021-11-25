//
//  BookViewModel.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-25.
//

import Foundation
import FirebaseFirestore

class BookViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var parks = [ParkData]()
    @Published var book = BookData()
    @Published var userLoad = false
    
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        self.userLoad = true
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                self.userLoad = false
                return
            }
            self.users = documents.map { queryDocumentSnapshot -> User in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let email = data["email"] as? String ?? ""
                let nic = data["nic"] as? String ?? ""
                let vehcile_Number = data["vehicleNumber"] as? String ?? ""
                let parkId = data["parkId"] as? String ?? ""
                let userId = queryDocumentSnapshot.documentID
                self.userLoad = false
                return User(documentId: userId, name: name, email: email, vehicleNumber: vehcile_Number, nic: nic, parkId: parkId)
            }
        }
    }
    
    func bookFetchData() {
        
        db.collection("parksSlots").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                
                return
            }
            self.parks = documents.map { queryDocumentSnapshot -> ParkData in
                let data = queryDocumentSnapshot.data()
                let id = queryDocumentSnapshot.documentID
                let park_Name = data["park_name"] as? String ?? ""
                let park_type = data["park_type"] as? String ?? ""
                let reserve = data["reserve"] as? Bool ?? false
                let book = data["book"] as? Bool ?? false
                let book_time = data["book_time"] as? Timestamp
                let dateex = Date(timeIntervalSinceReferenceDate: 118800)

                let date: Date = book_time?.dateValue() ?? dateex

              
                return ParkData(id: id, park_Name: park_Name, park_type: park_type, book: book, reserve: reserve, book_time: date)
            }
        }
    }
    
//    func updateBookDocument(userId: String, parkId: String) {
//        let parkUpdate = Firestore.firestore().collection("parksSlots").document(parkId)
//        let userUpdate = Firestore.firestore().collection("users").document(userId)
//
//        parkUpdate.updateData([
//            "book": true,
//            "userId": userId,
//            "book_time": Timestamp(date: Date())
//        ]) { err in
//            if let err = err {
//                print("Error updating document: \(err)")
//            } else {
//                print("Document successfully updated")
//                userUpdate.updateData([
//                    "parkId": parkId,
//                ]) { err in
//                    if let err = err {
//                        print("Error updating document: \(err)")
//                    } else {
//                        print("Document successfully updated")
//                    }
//                }
//            }
//        }
//
//    }
}
