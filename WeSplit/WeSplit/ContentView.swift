//
//  ContentView.swift
//  WeSplit
//
//  Created by Paulina Sadowska on 05/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = ""
    var body: some View {
        NavigationView(){
            Form {
                Section{
                    Picker("Select your student", selection: $selectedStudent){
                        ForEach(students, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    TextField("Enter your name", text: $name) // $name <- two-way binding
                    Text("My name is \(name)")
                }
                Section{
                    Text("Hello, world!")
                    Text("Hello, world!")
                }
                Section{
                    ForEach(0..<10) {
                        Text("Row \($0)")
                    }
                }
                Button("Tap count \(tapCount)"){
                    tapCount+=1
                }
            }.navigationTitle("WeSplit app")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
