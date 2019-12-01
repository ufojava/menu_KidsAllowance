//
//  MenuItem.swift
//  menu_KidsAllowance
//
//  Created by Ufuoma Okoro on 30/11/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct MenuItem: View {
    
    //Create variables to be used in fuction to toggle
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    
    //Function to display menu when button is pressed
    var body: some View {
        
       
        
        //Creat the Menu Launcher
        VStack(alignment: .center) {
            
            //User Spacer to move the VStack to the bottom of the screen
            Spacer()
            
            
            if showMenuItem1 { //ShowMenuItem1
                            
                HStack { //Weekly
                    
                    Button(action: {}) {
                        
                        NavigationLink(destination: WeeklyAllowance()) {
                            
                            //Weekly Allowance
                                menuItemIcons(icon: "sterlingsign.circle.fill")
                            
                                Text("Weekly")
                                    .font(.system(size: 14))
                                    .foregroundColor(.green)
                            
                        }
                        
                        
                    }
                    
                
                } //End of Weekly
                
            } //End ShowMenItem1
            
            
            if showMenuItem2 { //ShowMenuItem2
                
            
                HStack { //monthly
                    
                    Button(action: {}) {
                        
                        NavigationLink(destination: MonthlyAllowance()) {
                        
                            //Monthly Allowance
                            menuItemIcons(icon: "sterlingsign.circle.fill")
                        
                            Text("Monthly")
                                .font(.system(size: 14))
                                .foregroundColor(.blue)
                        
                        }
                    
                    }
            
                } //End of Monthly
                
            } //End ShowMenuItem2
            
            if showMenuItem3 { //ShowMenuItem3
            
                HStack { //Yearly
                    
                    Button(action: {}) {
                        
                        NavigationLink(destination: YearlyAllowance()) {
                        
                            menuItemIcons(icon: "sterlingsign.circle.fill")
                        
                                Text("Yearly")
                                    .font(.system(size: 14))
                                    .foregroundColor(.black)
                        
                        }
                
                    }
                    
                } //End of Yearly
            
            } //End ShowMenuItem3
            
            Button(action: {
            
                //Call show menu
                self.showMenu()
            }) {
            
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .foregroundColor(Color.red)
                        .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
                    
                    Text("Menu")
                }.transition(.move(edge: .trailing))
        
            }
        
        }
        
    }
    
    //Function to toggle when button is pressed
    func showMenu() {
        
        //Toggle Menu Item and Animation
        withAnimation {
            self.showMenuItem1.toggle()
        }
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                
                //Animate
                withAnimation {
                    self.showMenuItem2.toggle()
                }
            
            }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            //Animate
            withAnimation {
                self.showMenuItem3.toggle()
            }
        }
        
                   
            
    } //End of the function
    
    
    
}

struct MenuItem_Previews: PreviewProvider {
    static var previews: some View {
        MenuItem()
    }
}



//Struct to formulate the icons
struct menuItemIcons: View {
    
    //Create variable for the Icons
    var icon: String
    
    var body: some View {
        
        //Create a ZSatck to pass images through
        ZStack {
          
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .foregroundColor(Color.red)
                    .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
                
            
        }
            
        
    }
}

//Test Screen
struct WeeklyAllowance: View {
    var body: some View {
        Text("Weekly Allowance")
    }
}

struct MonthlyAllowance: View {
    var body: some View {
        
        Text("Monthly Allowance")
    }
}

struct YearlyAllowance: View {
    var body: some View {
        Text("Yearly Allowance")
    }
}
