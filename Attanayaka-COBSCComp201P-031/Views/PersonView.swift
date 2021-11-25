//
//  PersonView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-23.
//

import SwiftUI

struct PersonView: View {
    @EnvironmentObject var viewModel:AppViewModel
    @StateObject var bookViewModel = PersonViewModel()
    
    var body: some View {
        VStack {
            
            
            HStack{
                Text("Settings Page")
//                    .padding(.leading, 30.0)
                    .padding()
                Spacer()
            }
            if(bookViewModel.userLoad){
                ProgressView("Waiting for loading").progressViewStyle(CircularProgressViewStyle(tint: Color.blue)).scaleEffect(1, anchor: .center).accentColor(Color.blue)

            } else {
                VStack(alignment: .center, spacing: 40){
                    HStack{
                        Text("Name:")
                        Text(viewModel.currentUser.name)
                    }
                    
                    HStack{
                        Text("NIC:")
                        Text(viewModel.currentUser.nic)
                    }
                    
                    HStack{
                        Text("Registraion Number:")
                        Text(viewModel.currentUser.documentId)
                    }
                    
                    HStack{
                        Text("Vehicle Number:")
                        Text(viewModel.currentUser.vehicleNumber)
                    }
                    
                    HStack{
                        Text("Email:")
                        Text(viewModel.currentUser.email)
                    }
                    
                    
                    
                }
            }
//            Text("You Are Sign In")
                Button(action: {
                    viewModel.signOut()
                    }, label: {
                        Text("Sing Out")
                            .frame(width: 200, height: 50)
                            .background(Color.blue)
                            .foregroundColor(Color.white)
                            .padding()
                })
            }.onAppear(){
                viewModel.loadCurrentUser()
        }
    }
}
struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
