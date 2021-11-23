//
//  ContentView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-18.
//

import SwiftUI
import FirebaseAuth

class AppViewModel : ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func singIn(email:String, password: String) {
        auth.signIn(withEmail: email,
                    password:password) { [weak self] result,error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //success
                self?.signedIn = true
            }
            
        }
                    
    }
    
    func singUp(email:String, password: String) {
        auth.createUser(withEmail: email, password: password) { [weak self] result, error in
            guard result != nil, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                //success
                self?.signedIn = true
            }
            
        }
        
    }
    
    func signOut() {
        try? auth.signOut()
        
        self.signedIn = false
    }
}

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.signedIn {
                
                VStack {
                    Text("You Are Sign In")
                    Button(action: {
                        viewModel.signOut()
                    }, label: {
                        Text("Sing Out")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .padding()
                    })
                }
            
            }
            else{
                SignInView()
            }
            
        }
        .onAppear{
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
}



struct SignInView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack {
                    TextField("Email Address", text: $email )
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Email Address", text: $password )
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.singIn(email: email, password: password)
                        
                    }, label:{
                        Text("Sing In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                            
                    })
                    
                    NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                    
                    NavigationLink("Forget Password", destination: ForgetPasswordView())
                        .padding()
                        
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Sing In")
    }
}

struct SignUpView: View {
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack {
                    TextField("Email Address", text: $email )
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    SecureField("Email Address", text: $password )
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    
                    Button(action: {
                        
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        
                        viewModel.singUp(email: email, password: password)
                        
                    }, label:{
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                            
                    })
                        
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Create Account")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
