//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Arifin Firdaus on 02/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.white, .black]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
