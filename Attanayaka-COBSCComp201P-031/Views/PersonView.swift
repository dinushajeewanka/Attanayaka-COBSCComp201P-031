//
//  PersonView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-23.
//

import SwiftUI

struct PersonView: View {
    @EnvironmentObject var viewModel:AppViewModel
    var body: some View {
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
}
struct PersonView_Previews: PreviewProvider {
    static var previews: some View {
        PersonView()
    }
}
