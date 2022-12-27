//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by Alex Barreto on 27/12/22.
//

import SwiftUI

struct DetailView: View {
    
    // MARK: - PROPERTIES
    @State private var isCreditsPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    let note: Note
    let count: Int
    let index: Int
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            // HEADER
            HeaderView()
            
            // CONTENT
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            // FOOTER
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented, content: { SettingsView() })
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented, content: { CreditsView() })
            } //: HSTACK
            .foregroundColor(.secondary)
        } //: VSTACK
        .padding(3)
    }
}

// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(note: Note(id: UUID(), text: "Hello, World"), count: 5, index: 1)
    }
}
