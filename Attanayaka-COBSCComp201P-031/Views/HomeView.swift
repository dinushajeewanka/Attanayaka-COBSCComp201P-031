//
//  HomeView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack{
            HStack{
                Text("Nibm Parking")
                    .padding(.leading, 30.0)
                Spacer()
            }                .padding(.top, 40.0)
            if(viewModel.parkLoad){
                ProgressView("Waiting for loading").progressViewStyle(CircularProgressViewStyle(tint: Color.blue)).scaleEffect(1, anchor: .center).accentColor(Color.blue)
            } else {
                VStack{
                    List(viewModel.parks, id: \.id) { item in
                        HStack{
                            Text("Parking Name: \(item.park_Name)")
                            Spacer()
                            if(item.book){
                                VStack{
                                    Text("Booked")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.red)
                                }
                            }else{
                                VStack{
                                    Text("Avaliable")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.green)
                                }
                            }
                            Spacer()
                            if(item.reserve){
                                VStack{
                                    Text("Reserved")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.orange)
                                }
                            }else{
                                VStack{
                                    Text("Avaliable")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.green)
                                }
                            }
                            Spacer()
                            if(item.park_type=="normal"){
                                VStack{
                                    Text("Normal Park Slot")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.green)
                                }
                            }else{
                                VStack{
                                    Text("VIP Park Slot")
                                        .font(.headline)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color.red)
                                }
                            }
                        }.frame(height: UIScreen.main.bounds.height/12, alignment: .center)
                    }
                }
            }
        }.onAppear() {
            viewModel.fetchData()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
