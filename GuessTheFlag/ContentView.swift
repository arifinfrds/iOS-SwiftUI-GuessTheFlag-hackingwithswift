//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Arifin Firdaus on 02/09/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var shouldShowScoreAlert = false
    @State private var scoreTitle = ""
    @State private var alertMessage = ""
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(
                        action: { self.onFlagTapped(number) },
                        label: { createFlagImageView(imageName: self.countries[number]) }
                    )
                }
                
                if !scoreTitle.isEmpty {
                    Text("Last sccore : \(scoreTitle)")
                        .foregroundColor(.white)
                }
                
                Spacer()
            }
        }
        .alert(isPresented: $shouldShowScoreAlert, content: {
            Alert(
                title: Text(scoreTitle),
                message: Text(alertMessage),
                dismissButton: .default(
                    Text("Continue"),
                    action: { self.askQuestion() }
                )
            )
        })
    }
    
    private func onFlagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            alertMessage = "Your score is \(scoreTitle)"
        } else {
            scoreTitle = "Wrong"
            alertMessage = "Wrong, that's the flag of \(countries[number])"
        }
        
        shouldShowScoreAlert = true
    }
    
    private func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    private func createFlagImageView(imageName: String) -> some View {
        return Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
