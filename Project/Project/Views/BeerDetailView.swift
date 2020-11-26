//
//  BeerDetailView.swift
//  Project
//
//  Created by Florian Goossens on 26/11/2020.
//

import SwiftUI

struct BeerDetailView: View {
    var body: some View {
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 70/255, green: 70/255, blue: 65/255))
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack {
                    Image("beersample").resizable()
                        .frame(width: 162.0, height: 162.0)
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text("Beer").font(.title)
                        Text("Abv (%): ...")
                        Text("Rating: ...")
                        Text("Added on: ...")
                        
                        Group {
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Favorite").padding(5)
                            })
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Change rating").padding(5)
                            })
                        }.foregroundColor(.white)
                        .background(Color(red: 240 / 255, green: 140 / 255, blue: 80 / 255))
                        .cornerRadius(10)
                        
                        
                    }.padding()
                }.padding()
                .background(Color.white)
                .cornerRadius(10)
        }
    }
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView()
    }
}
