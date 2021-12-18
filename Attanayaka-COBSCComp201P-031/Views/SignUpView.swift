//
//  SignUpView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-24.
//

import SwiftUI

struct SignUpView: View {
    
    @State var email = ""
    @State var name = ""
    @State var vehicleNumber = ""
    @State var nic = ""
    @State var password = ""
    
    @EnvironmentObject var viewModel: AppViewModel
    
    var body: some View {
        ScrollView{
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                VStack {
                    TextField("Name", text: $name )
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("vehicle Number", text: $vehicleNumber )
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                    TextField("NIC", text: $nic )
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
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
                        if (name == "") {
                            viewModel.errorSignUpMessage = "Please Enter Your Name"
                            viewModel.errorSignUpAlert = true
                        } else if(vehicleNumber == ""){
                            viewModel.errorSignUpAlert = true
                            viewModel.errorSignUpMessage = "Please Enter Your Vehicle Number"
                        } else if(nic == ""){
                            viewModel.errorSignUpAlert = true
                            viewModel.errorSignUpMessage = "Please Enter Your NIC"
                        } else if(email == ""){
                            viewModel.errorSignUpAlert = true
                            viewModel.errorSignUpMessage = "Please Enter Your Email"
                        } else if(password == ""){
                            viewModel.errorSignUpAlert = true
                            viewModel.errorSignUpMessage = "Please Enter Your Password"
                        } else{
                            viewModel.singUp(email: email, password: password, name: name, vehicleNumber: vehicleNumber, nic:nic )
                        }
                    }, label:{
                        Text("Create Account")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                            
                    }).alert(isPresented: $viewModel.errorSignUpAlert) { () -> Alert in
                        Alert(title: Text(viewModel.errorSignUpMessage))
                    }
                        
                }
                .padding()
                
                Spacer()
            }
            
        }
        .navigationTitle("Create Account")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
