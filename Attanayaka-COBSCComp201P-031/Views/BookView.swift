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
                    .font(.headline)
//                    .padding(.leading, 30.0)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding()
                Spacer()
            }
            
            HStack{
                Text("Registraion Number:")
                    .font(.caption2)
//                    .padding(.leading, 30.0)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                Text(viewModel.currentUser.documentId)
                    .font(.caption2)
//                    .padding(.leading, 30.0)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
            }
            
            HStack{
                Text("Vehicle Number:")
                    .font(.caption2)
//                    .padding(.leading, 30.0)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                Text(viewModel.currentUser.vehicleNumber)
                    .font(.caption2)
//                    .padding(.leading, 30.0)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
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
//            Button(action: {
//                bookViewModel.updateBookDocument(userId: viewModel.currentUser.documentId, parkId:bookViewModel.book.parkDataId )
//            }) {
////                    .foregroundColor(Color.white)
//            }.frame(width: 200, height: 40, alignment: .center)
//                .padding(.top, 40.0)
//                .background(Color.blue)
//                .clipShape(Capsule())
                                                
            
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
