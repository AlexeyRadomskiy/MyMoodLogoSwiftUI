//
//  ContentView.swift
//  MyMoodLogoSwiftUI
//
//  Created by Alexey on 14.04.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView: View {
    @State var animateAll = false
    @State var profileTap = false
    
    var body: some View {
        ZStack{
            Color("darkend")
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .frame(width: 500, height:500)
                .offset(x: 0, y: -310)
            
            Circle()
                .frame(width: 500, height:500)
                .offset(x: 0, y: 300)
            
            VStack{
                Text("T i k T o k")
                    .font(.system(size: 34))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
        
                Text("S u b s c r i b e r s : 1 6 0 k")
                    .font(.system(size: 24))
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(width: 200, height: 45)
                
                ZStack{
                    GraphView()
                        .offset(x: 150, y: 150)
                        .clipShape(Circle())
                        .shadow(
                            color: animateAll
                            ? Color("munigreen")
                            : Color("municyan"),
                            radius: 3
                        )
                        .rotationEffect(
                            .degrees(animateAll ? -270 : 200)
                        )
                        .onAppear {
                            withAnimation(
                                Animation
                                    .easeInOut(duration: 10)
                                    .repeatForever(autoreverses: true)
                            ){
                                animateAll.toggle()
                            }
                        }
                    
                    ZStack{
                        Image("profile")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 5)
                            }
                            .gesture(
                                TapGesture()
                                    .onEnded({
                                        profileTap.toggle()
                                    }
                                            )
                            )
                        
                        if profileTap {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(.white)
                                    .frame(width: 135, height: 30)
                                    .overlay {
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(.white, lineWidth: 1)
                                    }
                                
                                Text("@proslushkashow")
                                    .font(.system(size: 16))
                            }
                            .offset(x: 0, y: 65)
                        }
                    }
                }
                
                Spacer()
                    .frame(width: 200, height: 60)
                
                CardView()
                
            }
            .padding()
        }
    }
}
