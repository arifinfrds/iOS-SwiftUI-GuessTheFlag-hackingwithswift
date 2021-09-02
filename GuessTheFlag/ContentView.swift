//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Arifin Firdaus on 02/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button(action: {
            print("Edit button was tapped")
        }) {
            HStack(spacing: 10) {
                Image(systemName: "pencil")
                Text("Edit")
            }
        }        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
