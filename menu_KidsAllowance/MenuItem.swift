//
//  MenuItem.swift
//  menu_KidsAllowance
//
//  Created by Ufuoma Okoro on 30/11/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI
import Combine


class AllowancePeriod: ObservableObject {
    
    //Periods
    @Published var weekly = "Weekly"
    @Published var monthly = "Monthly"
    @Published var yearly = "Yearly"
}

struct MenuItem: View {
    
    //Create variables to be used in fuction to toggle
    @State var showMenuItem1 = false
    @State var showMenuItem2 = false
    @State var showMenuItem3 = false
    
    @ObservedObject var period = AllowancePeriod()
   
    
    
    //Function to display menu when button is pressed
    var body: some View {
        
      
        //Creat the Menu Launcher
        VStack(alignment: .center) {
            
            //User Spacer to move the VStack to the bottom of the screen
            Spacer()
            
            
            if showMenuItem1 { //ShowMenuItem1
                            
                HStack { //Weekly
                    
                    
                    
                    Button(action: {
                        
                        
                        
                    }) {
                        
                        
                        
                        NavigationLink(destination: WeeklyAllowance(weeklyUpdate: $period.weekly)) {
                            
                            //Weekly Allowance
                                menuItemIcons(icon: "sterlingsign.circle.fill")
                                    .foregroundColor(Color.green)
                            
                            
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
                        
                        NavigationLink(destination: MonthlyAllowance(monthlyUpdate: $period.monthly)) {
                        
                            //Monthly Allowance
                            menuItemIcons(icon: "sterlingsign.circle.fill")
                                .foregroundColor(Color.blue)
                        
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
                                .foregroundColor(Color.black)
                        
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
                    .shadow(color: .gray, radius: 0.3, x: 1, y: 1)
                
            
        }
            
        
    }
}

//Weekly Allowance
struct WeeklyAllowance: View {
    
    @Binding var weeklyUpdate: String
    //@Binding var yearlyUpdate: String
    
    @State private var childName = ""
    

    

    
     
    
    //Calculate Child Weekly Allowance
    var WeeklyCalcAllowance: Double {
    
    //Variable
    var weeklyAllowance = 0.0
    var totalWklyAllowance = 0.0

        
        //Calculate child weekly allowance
        
        if (self.childName == "Bethany") {
            

            weeklyAllowance = 5.0
            totalWklyAllowance = weeklyAllowance * 1
            
        } else if (self.childName == "David") {
            
            weeklyAllowance = 7.5
            totalWklyAllowance = weeklyAllowance * 1
            
        } else if (self.childName == "Victoria"){
            
            weeklyAllowance = 6.7
            totalWklyAllowance = weeklyAllowance * 1
            
        } else {
            
            totalWklyAllowance = 0.0
        }
        
        //Return Total Weekly Allowance
        return totalWklyAllowance
    }
    
    
  
    
    
    
    

    
    
    var body: some View {
        
        //Navigation View
       
    
            VStack(alignment: .leading) {
                Text("Weekly Allowance")
                    .font(.system(size: 25))
                    .foregroundColor(.green)
                Spacer().frame(height: 50)
                
                VStack(alignment: .leading) {
                    TextField("Enter you first Name",text: $childName)
                        .font(.system(size: 14))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.words)
                    
                    
                    Spacer().frame(height: 100)
                    
                    HStack(alignment: .center) {
                    
                        //Insert Image into result
                        if self.childName == "Bethany" {
                            
                        
                        
                            Image("bethanyMugShotArt")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .scaledToFit()
                                .border(Color.black, width: 2)
                            
                        
                    }   else if self.childName == "David" {
                        
                            Image("davidMugShotArt")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .scaledToFit()
                                .border(Color.black, width: 2)
                            
                    } else if self.childName == "Victoria" {
                        
                            Image("VictoriaMugShotArt")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .scaledToFit()
                                .border(Color.black, width: 2)
                        }
                    
                    
                    
                    
                    //Insert an Emoji
                    if WeeklyCalcAllowance > 0 {
                        
                        Text("😊")
                            .font(.system(size: 50))
                    } else {
                        
                        Text("😩")
                            .font(.system(size: 50))
                    }
                    
                    }.padding(.horizontal, 100) //HStack Ends
                    
                    Spacer().frame(height: 150)
                    
                
                    
                        Text("Your allowance is: £\(WeeklyCalcAllowance,specifier: "%.2f")")
                        .foregroundColor(.red)
                        .animation(.spring())
                   
                   
                
    
                    
                        
                        
                    Spacer()
                }.font(.system(size: 25))
                    .foregroundColor(.blue)
                .padding()
            
            
            }.padding()
        
       
    }
}


//Monthly Allowance
struct MonthlyAllowance: View {
    
    
    @Binding var monthlyUpdate: String
    
     @State private var childName = ""
    
    //Calculate Child Monthly Allowance
        var MonthlyCalcAllowance: Double {
        
        //Variable
        var weeklyAllowance = 0.0
        var totalMthlyAllowance = 0.0
            self.monthlyUpdate = "Monthly"
            
            //Calculate child weekly allowance
            
            if (self.childName == "Bethany")  {
                

                weeklyAllowance = 5.0
                totalMthlyAllowance = weeklyAllowance * 4
                
            } else if (self.childName == "David") {
                
                weeklyAllowance = 7.5
                totalMthlyAllowance = weeklyAllowance * 4
                
            } else if (self.childName == "Victoria") {
                
                weeklyAllowance = 6.7
                totalMthlyAllowance = weeklyAllowance * 4
                
            } else {
                
                totalMthlyAllowance = 0.0
            }
            
            //Return Total Weekly Allowance
            return totalMthlyAllowance
        }
    
    var body: some View {
        
                //Navigation View
           
        
                VStack(alignment: .leading) {
                    Text("Monthly Allowance")
                        .font(.system(size: 25))
                        .foregroundColor(.green)
                    Spacer().frame(height: 50)
                    
                    VStack(alignment: .leading) {
                        TextField("Enter you first Name",text: $childName)
                            .font(.system(size: 14))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .autocapitalization(.words)
                        
                        
                        Spacer().frame(height: 100)
                        
                        HStack(alignment: .center) {
                        
                            //Insert Image into result
                            if self.childName == "Bethany" {
                                
                            
                            
                                Image("bethanyMugShotArt")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                                    .border(Color.black, width: 2)
                                
                            
                        }   else if self.childName == "David" {
                            
                                Image("davidMugShotArt")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                                    .border(Color.black, width: 2)
                                
                        } else if self.childName == "Victoria" {
                            
                                Image("VictoriaMugShotArt")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .scaledToFit()
                                    .border(Color.black, width: 2)
                            }
                        
                        
                        
                        
                        //Insert an Emoji
                        if MonthlyCalcAllowance > 0 {
                            
                            Text("😊")
                                .font(.system(size: 50))
                        } else {
                            
                            Text("😩")
                                .font(.system(size: 50))
                        }
                        
                        }.padding(.horizontal, 100) //HStack Ends
                        
                        Spacer().frame(height: 150)
                        
                    
                        
                            Text("Your allowance is: £\(MonthlyCalcAllowance,specifier: "%.2f")")
                            .foregroundColor(.red)
                            .animation(.spring())
                       
                       
                    
        
                        
                            
                            
                        Spacer()
                    }.font(.system(size: 25))
                        .foregroundColor(.blue)
                    .padding()
                
                
                }.padding()
            
           
        }
    
}


//Yearly Allowance
struct YearlyAllowance: View {
    var body: some View {
        Text("Yearly Allowance")
    }
}
