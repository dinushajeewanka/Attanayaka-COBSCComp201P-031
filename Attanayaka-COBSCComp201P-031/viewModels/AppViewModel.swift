//
//  appViewModel.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-23.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AppViewModel : ObservableObject {
    @Published var currentUser: User = User(documentId:"", name:"", email:"", vehicleNumber: "",  nic:"", parkId: "", bookedStatus: false)
    private var db = Firestore.firestore()
    let auth = Auth.auth()
    
    @Published var signedIn = false
    @Published var errorMessage = ""
    @Published var errorAlert = false
    @Published var errorSignUpMessage = ""
    @Published var errorSignUpAlert = false
    @Published var errorForgetPasswordAlert = false
    @Published var errorForgetPasswordMessage = ""
    @Published var isSucessForget = false

    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func singIn(email:String, password: String) {
        auth.signIn(withEmail: email,
                    password:password) { [weak self] result,error in
         
            if error != nil {
                self?.errorMessage = error?.localizedDescription ?? "Please Try again"
                self?.errorAlert = true
            } else {
                DispatchQueue.main.async {
                    //success
                    self?.errorMessage = ""
                    self?.errorAlert = false
                    self?.signedIn = true
                }
            }
            
        }
                    
    }
    
    func singUp(email:String, password: String, name: String, vehicleNumber: String, nic: String) {
        
        let db = Firestore.firestore()
        
        let userData: [String: Any] = [
            "name": name,
            "email": email,
            "vehicleNumber": vehicleNumber,
            "nic": nic,
            "parkId": "",
            "bookedStatus": false
        ]
        
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            let userID = Auth.auth().currentUser?.uid
            if error != nil {
                self?.errorSignUpMessage = error?.localizedDescription ?? "Please Try again"
                self?.errorSignUpAlert = true
            }else{
                do{
                    db.collection("users").document(userID!).setData(userData) { err in
                        if let err = err {
                            print("Error writing document: \(err)")
                            self?.errorSignUpMessage = "Error writing document: \(err)"
                            self?.errorSignUpAlert = true
                        } else {
                            self?.errorSignUpMessage = ""
                            self?.errorSignUpAlert = false
                            print("Document successfully written!")
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    //success
                    self?.signedIn = true
                }
            }
        }
        
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
    
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        
        
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if error != nil {
                print(error?.localizedDescription ?? "")
                self.errorForgetPasswordMessage = error?.localizedDescription ?? ""
                self.errorForgetPasswordAlert = true
                self.isSucessForget = false
            } else {
                print("send email")
                self.errorForgetPasswordMessage = ""
                self.errorForgetPasswordAlert = false
                self.isSucessForget = true
            }
        }
    }
    
    func loadCurrentUser() {
         
            if(self.isSignedIn){
                
                     let uId = auth.currentUser?.uid ?? ""
                     db.collection("users").document(uId).getDocument{ snapshot, error in
                         guard let data = snapshot?.data(), error == nil else {
                             return
                         }
                       
                         self.currentUser.documentId =  snapshot?.documentID ?? ""
                         self.currentUser.name = data["name"] as? String ?? ""
                         self.currentUser.email = data["email"] as? String ?? ""
                         self.currentUser.vehicleNumber = data["vehicleNumber"] as? String ?? ""
                         self.currentUser.nic = data["nic"] as? String ?? ""
                         self.currentUser.parkId = data["parkId"] as? String ?? ""
                         self.currentUser.bookedStatus = data["bookedStatus"] as? Bool ?? false
                     
                     }
            }
           
            
          

        }
}
//hhhhh
