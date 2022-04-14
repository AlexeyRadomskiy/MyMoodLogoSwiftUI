//
//  CardView.swift
//  MyMoodLogoSwiftUI
//
//  Created by Alexey on 14.04.2022.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.secondary.opacity(0.5))
                .frame(width: 400, height: 200)
            
            VStack(alignment: .center){
                Text("C A T E G O R I E S")
                    .font(.title2)
                    .foregroundColor(.white)
                Spacer()
                    .frame(width: 0, height: 30)
                
                HStack{
                    VStack(alignment: .leading){
                        MiniCardView(
                            color: Color("muniredone"),
                            text: "P O P"
                        )
                        MiniCardView(
                            color: Color("municyan"),
                            text: "R A P"
                        )
                        MiniCardView(
                            color: Color("muniyellow"),
                            text: "R O C K"
                        )
                    }
                    .frame(alignment: .leading)
                    
                    Spacer()
                        .frame(width: 60, height: 0)
                    
                    VStack(alignment: .leading){
                        MiniCardView(
                            color: Color("muniviolet"),
                            text: "P O D C A C T"
                        )
                        MiniCardView(
                            color: Color("munigreen"),
                            text: "D I S C O"
                        )
                        Spacer()
                            .frame(width: 80, height: 0)
                    }
                }
                .offset(x: 6, y: 0)
            }
            .padding()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

struct MiniCardView: View {
    @State var color = Color.red
    @State var text = "R O C K"
    
    var body: some View {
        HStack(alignment: .top){
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(color)
                .frame(width: 20, height: 20)
            Spacer()
                .frame(width: 10, height: 0)
            Text(text)
                .foregroundColor(.white)
        }
    }
}
