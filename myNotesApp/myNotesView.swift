//
//  myNotesView.swift
//  myNotesApp
//
//  Created by Lauren Ducay on 4/10/25.
//

import SwiftUI
import CoreData

struct myNotesView: View {
    var body: some View {
        ScrollView {
            myTopBar()
                .overlay{
                    HStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("My Notes")
                                .font(.system(size: 40, weight: .bold))
                        }
                    
                        Image(systemName: "applepencil.and.scribble")
                            .imageScale(.large)
                            .font(.system(size:40))
                    }
                    .foregroundColor(.white)
                }
        }
        .ignoresSafeArea(.all)
    }
}

struct myTopBar: View {
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.8), Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: .infinity, height: 350)
                .overlay{
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(Color.white.opacity(0.2))
                        .frame(width: 350, height: 200)
                }
        }
    }
}

struct myNotesView_Previews: PreviewProvider {
    static var previews: some View {
        myNotesView()
    }
}
