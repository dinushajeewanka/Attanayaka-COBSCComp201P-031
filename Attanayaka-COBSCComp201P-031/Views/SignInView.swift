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
    @State var errorAlert = false
    @State var errorMessage = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150).accessibility(identifier: "SignInView_Image")
            VStack {
                TextField("Email Address", text: $email )
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground)).accessibility(identifier: "SignInView_TextField")
                
                SecureField("Password", text: $password )
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground)).accessibility(identifier: "SignInView_SecureField")
                
                Button(action: {
                    if(email == ""){
                        viewModel.errorMessage = "Please Enter Your Email"
                        viewModel.errorAlert = true
                    } else if(password == ""){
                        viewModel.errorAlert = true
                        viewModel.errorMessage = "Please Enter Your Password"
                    } else {
                        viewModel.singIn(email: email, password: password)
                    }
                }, label:{
                    Text("Sing In")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .cornerRadius(8)
                        .background(Color.blue)
                    
                }).accessibility(identifier: "SignInView_Button")
                    .alert(isPresented: $viewModel.errorAlert) { () -> Alert in
                    Alert(title: Text(viewModel.errorMessage))
                }
                
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
