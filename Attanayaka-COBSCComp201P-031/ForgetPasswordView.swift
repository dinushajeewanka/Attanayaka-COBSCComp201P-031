//
//  Attanayaka_COBSCComp201P_031App.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-23.
//

import SwiftUI
import Firebase

struct ForgetPasswordView: View {
    @State var email = ""

    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Image("forget")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.top)
                .frame(height:UIScreen.main.bounds.height/3.2)
            Text("Enter Your Email Here")
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
                }else {
                    sendPasswordReset(withEmail: email)
                }
            }) {
                Text("Send Email")
                    .foregroundColor(Color.white)
            }.frame(width: 200, height: 40, alignment: .center)
                .padding()
                .background(Color.blue)
                .clipShape(Capsule())
            Spacer()

        }
    }
}

func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
    
    Auth.auth().sendPasswordReset(withEmail: email) { error in
        if error != nil {
            print(error?.localizedDescription ?? "")
        } else {
            print("send email")
        }
    }
}

struct ForgetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgetPasswordView()
    }
}
