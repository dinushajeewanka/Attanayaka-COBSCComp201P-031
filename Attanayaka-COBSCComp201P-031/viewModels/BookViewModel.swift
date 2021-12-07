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
                let bookedStatus = data["bookedStatus"] as? Bool ?? false
                let userId = queryDocumentSnapshot.documentID
                self.userLoad = false
                return User(documentId: userId, name: name, email: email, vehicleNumber: vehcile_Number, nic: nic, parkId: parkId, bookedStatus: bookedStatus)
            }
        }
    }
    
    func bookFetchData() {
        
        db.collection("parksSlots").order(by: "number").addSnapshotListener {(querySnapshot, error) in
                    guard let documents = querySnapshot?.documents else {
                        print ("empty")
                        return
                    }
                    
                    self.parks = documents.map { (queryDocumentSnapshot) -> ParkData in
                        let data = queryDocumentSnapshot.data()
                        let id = queryDocumentSnapshot.documentID
                        
                        let number = data["number"] as? Int ?? 0
                        let isVIP = data["isVIP"] as? Bool ?? false
                        let isAvailable = data["isAvailable"]as?  Bool ?? false
                        let bookedTime = data["bookedTime"]as?  String ?? ""
                        let bookedUser = data["bookedUser"]as? String ?? ""
                        let bookedVehicle = data["bookedVehicle"]as? String ?? ""
                        
                    
                        return ParkData(id:id, number: number, isVIP: isVIP, isAvailable: isAvailable, bookedTime: bookedTime, bookedUser: bookedUser, bookedVehicle: bookedVehicle)
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
