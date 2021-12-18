//
//  ForgetPasswordView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-23.
//

import SwiftUI
import Firebase

struct ForgetPasswordView: View {
    @State var email = ""
    @EnvironmentObject var viewModel: AppViewModel

    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Image("forget")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top)
                .frame(height:UIScreen.main.bounds.height/3.2)
            if(viewModel.isSucessForget){
                Text("Sucessfully send email. please check your email and reset it.")
                    .fontWeight(.medium)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)

            }else{
                Text("Enter Your Email Here")

            }
            Spacer()
            TextField("Email Address", text: $email )
                .disableAutocorrection(true)
                .autocapitalization(.none)
                .padding()
                .background(Color(.secondarySystemBackground))
            Spacer()
            Button(action: {
                if(email == ""){
                    print("Enter Your Email")
                    viewModel.errorForgetPasswordAlert = true
                    viewModel.errorForgetPasswordMessage = "Please Enter Your Valid Email"
                }else {
                    viewModel.sendPasswordReset(withEmail: email)
                }
            }) {
                Text("Send Email")
                    .foregroundColor(Color.white)
            }.frame(width: 200, height: 40, alignment: .center)
                .padding()
                .background(Color.blue)
                .clipShape(Capsule())
                .alert(isPresented: $viewModel.errorForgetPasswordAlert) { () -> Alert in
                    Alert(title: Text(viewModel.errorForgetPasswordMessage))
                }
            Spacer()

        }
    }
}

//func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
//
//    Auth.auth().sendPasswordReset(withEmail: email) { error in
//        if error != nil {
//            print(error?.localizedDescription ?? "")
//        } else {
//            print("send email")
//        }
//    }
//}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
