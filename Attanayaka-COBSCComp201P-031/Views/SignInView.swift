//
//  SignInView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-24.
//

import SwiftUI

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
                        
                        SecureField("Password", text: $password )
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

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
