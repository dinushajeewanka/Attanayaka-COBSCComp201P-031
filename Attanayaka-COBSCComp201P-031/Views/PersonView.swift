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
                    .padding(.leading, 0.0)
                Spacer()
            }
            if(bookViewModel.userLoad){
                ProgressView("Waiting for loading").progressViewStyle(CircularProgressViewStyle(tint: Color.blue)).scaleEffect(1, anchor: .center).accentColor(Color.blue)

            } else {
                VStack(alignment: .center, spacing: 40){
                    Text(bookViewModel.users.first?.name ?? "")
                    Text(bookViewModel.users.first?.vehicleNumber ?? "")
                    Text(bookViewModel.users.first?.email ?? "")
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
                bookViewModel.fetchData()
        }
    }
}
struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
