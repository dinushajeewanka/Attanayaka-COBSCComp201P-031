//
//  PersonViewModel.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-24.
//

import Foundation
import FirebaseFirestore

class PersonViewModel: ObservableObject {
    @Published var users = [User]()
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
}
