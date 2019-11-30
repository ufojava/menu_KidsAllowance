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
        
        
        ZStack(alignment: .trailing) {
            //Create Rectangle
            Rectangle()
                .foregroundColor(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            //Call MenuItem
            MenuItem()
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
