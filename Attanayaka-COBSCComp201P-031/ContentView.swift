//
//  ContentView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-18.
//

import SwiftUI
import FirebaseAuth
import Firebase

//class AppViewModel : ObservableObject {
//    
//    let auth = Auth.auth()
//    
//    @Published var signedIn = false
//    
//    var isSignedIn: Bool{
//        return auth.currentUser != nil
//    }
//    
//    func singIn(email:String, password: String) {
//        auth.signIn(withEmail: email,
//                    password:password) { [weak self] result,error in
//            guard result != nil, error == nil else {
//                return
//            }
//            
//            DispatchQueue.main.async {
//                //success
//                self?.signedIn = true
//            }
//            
//        }
//                    
//    }
//    
//    func singUp(email:String, password: String, name: String, vehicleNumber: String, nic: String) {
//        
//        let db = Firestore.firestore()
//        
//        let userData: [String: Any] = [
//            "name": name,
//            "email": email,
//            "vehicleNumber": vehicleNumber,
//            "nic": nic,
//            "parkId": "",
//        ]
//        
//        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
//            guard result != nil, error == nil else {
//                return
//            }
//            
//            guard let userID = Auth.auth().currentUser?.uid else { return }
//            
//            do{
//                db.collection("users").document(userID).setData(userData) { err in
//                    if let err = err {
//                        print("Error writing document: \(err)")
//                    } else {
//                        print("Document successfully written!")
//                    }
//                }
//            }
//            
//            DispatchQueue.main.async {
//                //success
//                self?.signedIn = true
//            }
//            
//        }
//        
//    }
//    
//    func signOut() {
//        try? auth.signOut()
//        
//        self.signedIn = false
//    }
//}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    @State private var tabSelection = 1
    @State private var selectedSlot = ""
    
    var body: some View {
        TabView {
            HomeView(tabSelection: $tabSelection, selectedSlot: $selectedSlot)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            NavigationView{
                if(viewModel.signedIn)
                {
                    BookView()
                       
                }else{
                    SignInView()
                }
            }.tabItem {
                Label("Book", systemImage: "bookmark")
            }
            NavigationView{
                if(viewModel.signedIn)
                {
                    PersonView()
                        
                }
                else{
                    SignInView()
                }
              
            }.tabItem {
                Label("Person", systemImage: "person.fill")
            }
           
           
        }
//        NavigationView {
//            if viewModel.signedIn {
//
//                VStack {
//                    Text("You Are Sign In")
//                    Button(action: {
//                        viewModel.signOut()
//                    }, label: {
//                        Text("Sing Out")
//                            .frame(width: 200, height: 50)
//                            .background(Color.blue)
//                            .foregroundColor(Color.white)
//                            .padding()
//                    })
//                }
//
//            }
//            else{
//                SignInView()
//            }
//
//        }
//        .onAppear{
//            viewModel.signedIn = viewModel.isSignedIn
//        }
    }
}



//struct SignInView: View {
//    @State var email = ""
//    @State var password = ""
//
//    @EnvironmentObject var viewModel: AppViewModel
//
//    var body: some View {
//            VStack {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//                VStack {
//                    TextField("Email Address", text: $email )
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//
//                    SecureField("Password", text: $password )
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//
//                    Button(action: {
//
//                        guard !email.isEmpty, !password.isEmpty else {
//                            return
//                        }
//
//                        viewModel.singIn(email: email, password: password)
//
//                    }, label:{
//                        Text("Sing In")
//                            .foregroundColor(Color.white)
//                            .frame(width: 200, height: 50)
//                            .cornerRadius(8)
//                            .background(Color.blue)
//
//                    })
//
//                    NavigationLink("Create Account", destination: SignUpView())
//                        .padding()
//
//                    NavigationLink("Forget Password", destination: ForgetPasswordView())
//                        .padding()
//
//                }
//                .padding()
//
//                Spacer()
//            }
//            .navigationTitle("Sing In")
//    }
//}

//struct SignUpView: View {
//
//    @State var email = ""
//    @State var name = ""
//    @State var vehicleNumber = ""
//    @State var nic = ""
//    @State var password = ""
//
//    @EnvironmentObject var viewModel: AppViewModel
//
//    var body: some View {
//        ScrollView{
//            VStack {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 150, height: 150)
//                VStack {
//                    TextField("Name", text: $name )
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//                    TextField("vehicle Number", text: $vehicleNumber )
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//                    TextField("NIC", text: $nic )
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//                    TextField("Email Address", text: $email )
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//
//                    SecureField("Password", text: $password )
//                        .disableAutocorrection(true)
//                        .autocapitalization(.none)
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//
//                    Button(action: {
//
//                        guard !email.isEmpty, !password.isEmpty, !name.isEmpty, !vehicleNumber.isEmpty, !nic.isEmpty else {
//                            return
//                        }
//
//                        viewModel.singUp(email: email, password: password, name: name, vehicleNumber: vehicleNumber, nic:nic )
//
//                    }, label:{
//                        Text("Create Account")
//                            .foregroundColor(Color.white)
//                            .frame(width: 200, height: 50)
//                            .cornerRadius(8)
//                            .background(Color.blue)
//
//                    })
//
//                }
//                .padding()
//
//                Spacer()
//            }
//
//        }
//        .navigationTitle("Create Account")
//    }
//}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
