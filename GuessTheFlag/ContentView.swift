//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Arifin Firdaus on 02/09/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RadialGradient(
            gradient: Gradient(colors: [.blue, .black]),
            center: .center,
            startRadius: 20,
            endRadius: 200
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
