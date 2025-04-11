//
//  ContentView.swift
//  myNotesApp
//
//  Created by Lauren Ducay on 4/9/25.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    let title = "Welcome!"
    private var initialDelays = [0.0, 0.04, 0.012, 0.18, 0.28, 0.35]
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.pink.opacity(0.8), Color.blue.opacity(0.8)]),
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                ZStack {
                    
                    AnimationTitleView(title: title, color: .white, initialDelay: initialDelays[5], animationType: .spring(duration:1))
                    AnimationTitleView(title: title, color: .pink.opacity(0.3), initialDelay: initialDelays[4], animationType: .spring(duration:1))
                    AnimationTitleView(title: title, color: .pink.opacity(0.5), initialDelay: initialDelays[3], animationType: .spring(duration:1))
                    AnimationTitleView(title: title, color: .pink.opacity(0.7), initialDelay: initialDelays[2], animationType: .spring(duration:1))
                    AnimationTitleView(title: title, color: .pink.opacity(0.9), initialDelay: initialDelays[1], animationType: .spring(duration:1))
                }
                
                AnimationTitleView(title: title, color: .pink.opacity(0.8), initialDelay: initialDelays[0], animationType: .spring)
                
                VStack {
                    Button(action: {enterButton()}){
                        HStack {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.white.opacity(0.3))
                                .frame(width: 200, height: 50)
                        }
                        
                    }
                    .offset(y: 200)

                }
            }
        }
    }
}

func enterButton() {
    debugPrint("entering the note sheet")
}

struct AnimationTitleView: View {
    let title: String
    let color: Color
    let initialDelay: Double
    let animationType: Animation
    @State var scall = false
    @State private var show = false
    private var delay = 0.1
    
    init(title: String, color: Color, initialDelay: Double, animationType: Animation) {
        
        self.title = title
        self.color = color
        self.initialDelay = initialDelay
        self.animationType = animationType
    }
    
    var body: some View {
        
        HStack(spacing: 0) {
            
            ForEach(0..<title.count, id:\.self) { index in
                Text(String(title[title.index(title.startIndex, offsetBy: index)]))
                    .font(.system(size: 70)).bold()
                    .opacity(show ? 1 : 0)
                    .foregroundColor(.white)
                    .offset(y: show ? -30 : 0)
                    .animation(animationType.delay(Double(index) * delay + initialDelay), value: show)
                    .foregroundStyle(color)
            }
        }
        
        .scaleEffect(scall ? 1 : 1.2)
        .onAppear(){
            show.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation {
                    scall.toggle()
                }
            }
        }
    }
}



#Preview {
    ContentView()
}

//                        Image(systemName: "plus")
//                            .padding()
//                            .background(Color.pink.opacity(0.2))
//                            .foregroundColor(.white)
//                            .frame(width: 50, height: 50)
//                            .clipShape(Circle())
//                            .shadow(color: Color.blue, radius: 5)

