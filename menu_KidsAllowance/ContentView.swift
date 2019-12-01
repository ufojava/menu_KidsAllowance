//
//  ContentView.swift
//  menu_KidsAllowance
//
//  Created by Ufuoma Okoro on 30/11/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//
//App to create a menu system for kids allowance

import SwiftUI

struct ContentView: View {
    var body: some View {
        
    NavigationView {
        //Spacer().frame(height: 10)
        
       
                //Insert kids pictures
        VStack {
            
            
                
                
                    //Kinds Picture
                    VStack {
                        Spacer().frame(height: 130)
                        
                        //Create Retangle start
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 400, height: 10)
                        
                        
                        Image("davidMugShot")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.green, lineWidth: 5))
                        
                        HStack {
                        
                            Image("VictoriaMugShot")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.blue, lineWidth: 5))
                                .scaledToFit()
                            
                            Image("bethanyMugShot")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.red, lineWidth: 5))
                                .scaledToFit()
                        }
                    
                        
                        //Create Retangle end
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 400, height: 10)
                        
                    }
                    
                    
        
                //Menu
                ZStack(alignment: .trailing) {
                        //Create Rectangle
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
                            //Call MenuItem
                            MenuItem()
        
                }.padding() //ZStack Ends Here
            
            
            
    
    }//Main VStack Ends here
            
        .navigationBarTitle(Text("Home 🏠")) //NavigationView Title
     
        } //End of Navigation View
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
