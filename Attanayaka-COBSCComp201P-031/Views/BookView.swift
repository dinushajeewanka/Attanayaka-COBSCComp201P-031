//
//  BookView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-23.
//

import SwiftUI

struct BookView: View {
    
    @StateObject var bookViewModel = BookViewModel()
    @EnvironmentObject var viewModel:AppViewModel
    
    var body: some View {
        ScrollView{
        VStack(alignment: .center, spacing: 40){
            
            HStack{
                Text("Booking Page")
//                    .padding(.leading, 30.0)
                    .padding()
                Spacer()
            }
            
            HStack{
                Text("Registraion Number:")
                Text(viewModel.currentUser.documentId)
            }
            
            HStack{
                Text("Vehicle Number:")
                Text(viewModel.currentUser.vehicleNumber)
            }
            
            
            Picker(selection: $bookViewModel.book.parkDataId, label: Text("Pick a slot")){
                ForEach(bookViewModel.parks){ParkData in
                                            HStack{
                                                Text(String(ParkData.id))

                                            }
                                        }
                                    }.pickerStyle(WheelPickerStyle())
                                    .frame(maxWidth: .infinity)
                                    .background(Color(UIColor.systemGroupedBackground))
                                                
            
        }.onAppear() {
            bookViewModel.bookFetchData()
        }
            
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
