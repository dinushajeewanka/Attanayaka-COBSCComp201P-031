//
//  SlotView.swift
//  Attanayaka-COBSCComp201P-031
//
//  Created by Dinusha on 2021-12-07.
//

import SwiftUI

struct SlotView: View {
    @EnvironmentObject var authViewModel: AppViewModel
       @StateObject var bookViewModel = BookViewModel()
       
       var backgroundColor = Color.green
       var slotNumber: String
       var function:()-> Void
       var opacity = 1.0
       var isDisabled = false
       var bVehicle: String
     
       
       
       
       var body: some View {
           VStack{
               Button(action:{self.function()})
               {
                   ZStack{
                       Rectangle().fill(backgroundColor).frame(width: 75, height: 75).opacity(1.0)
                       Text(slotNumber).foregroundColor(.white)
                   }
               }.disabled(isDisabled)
               Text(bVehicle)
               
               

              
           }
          
          
       }
}

//struct SlotView_Previews: PreviewProvider {
//    static var previews: some View {
//        SlotView()
//    }
//}

