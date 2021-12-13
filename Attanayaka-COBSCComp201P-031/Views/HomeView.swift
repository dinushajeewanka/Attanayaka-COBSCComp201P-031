//
//  HomeView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by DINUSHA on 2021-11-23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AppViewModel
       @StateObject var viewModel = BookViewModel()
       @Binding var tabSelection: Int
       @Binding var selectedSlot: String
       
       let gItem=[GridItem(.adaptive(minimum: 75, maximum: 150))]
       
       
       var body: some View {
               VStack{
                   
                    
                   LazyVGrid(columns: gItem, alignment: .center, content: {
                               ForEach(viewModel.parks){ slot in
                                   
                                   if(authViewModel.isSignedIn && authViewModel.currentUser.bookedStatus)
                                   {
                                       if(authViewModel.currentUser.documentId == slot.bookedUser){
                                           SlotView(backgroundColor: slot.isVIP ? Color.purple : Color.gray, slotNumber: String(slot.number), function: {self.selectedSlot = slot.id; self.tabSelection = 2}, opacity: slot.isAvailable ? 1.0 : 0.3, isDisabled: slot.isAvailable ? false : true, bVehicle: slot.bookedVehicle, cancelBooking: { viewModel.cancelBooking(docId: slot.id, buser: authViewModel.currentUser.documentId, bvehicle: authViewModel.currentUser.vehicleNumber)})
                                       }

                                   }else if(authViewModel.isSignedIn && !authViewModel.currentUser.bookedStatus){
                                       SlotView(backgroundColor: slot.isVIP ? Color.purple : Color.gray, slotNumber: String(slot.number), function: {self.selectedSlot = slot.id; self.tabSelection = 2}, opacity: slot.isAvailable ? 1.0 : 0.3, isDisabled: slot.isAvailable ? false : true, bVehicle: slot.bookedVehicle, cancelBooking: { viewModel.cancelBooking(docId: slot.id, buser: authViewModel.currentUser.documentId, bvehicle: authViewModel.currentUser.vehicleNumber)})
                                   }else if(!authViewModel.isSignedIn){
                                       SlotView(backgroundColor: slot.isVIP ? Color.purple : Color.gray, slotNumber: String(slot.number), function: {self.selectedSlot = slot.id; self.tabSelection = 2}, opacity: slot.isAvailable ? 1.0 : 0.3, isDisabled: slot.isAvailable ? false : true, bVehicle: slot.bookedVehicle, cancelBooking: { viewModel.cancelBooking(docId: slot.id, buser: authViewModel.currentUser.documentId, bvehicle: authViewModel.currentUser.vehicleNumber)})
                                   }
                               
                               }
                           })
                       
                   Spacer()
                   
               }.navigationTitle("Home")
               .onAppear(){
                   self.viewModel.bookFetchData()
                   self.authViewModel.loadCurrentUser()
               }.onTapGesture {
                   self.viewModel.bookFetchData()
                   self.authViewModel.loadCurrentUser()
               }
           
       }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
