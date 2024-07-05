//
//  SettingsView.swift
//  NotesWatch Watch App
//
//  Created by Khavishini on 04/07/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("lineCount") var lineCount: Int = 1
    @State private var value: Float = 1.0
    
    func update() {
        lineCount = Int(value)
    }
    
    
    var body: some View {
        VStack(spacing: 8, content: {
            //HEader
            HeaderView(title: "Settings")
            
            //Actual line count
            Text("Lines \(lineCount)".uppercased())
                .fontWeight(.bold)
            
            
            //Slider
            Slider(value: Binding(get: {
                self.value
            }, set: { (newValue) in
                       self.value = newValue
                       self.update()
            }), in: 1...4, step: 1)
                .accentColor(.accentColor)
            
            
        })//:VStack
    }
}

#Preview {
    SettingsView()
}
