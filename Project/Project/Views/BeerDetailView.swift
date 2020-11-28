//
//  BeerDetailView.swift
//  Project
//
//  Created by Florian Goossens on 26/11/2020.
//

import SwiftUI
import SafariServices

struct BeerDetailView: View {
    @State var beer: Beer!
    let dateFormatter = DateFormatter()
    
    
    var body: some View {
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color(red: 70/255, green: 70/255, blue: 65/255))
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                HStack {
                    
                    VStack {
                        Image("beersample").resizable()
                            .frame(width: 162.0, height: 162.0)
                    }
                    
                    VStack(alignment: .leading, spacing: 10.0) {
                        Text("\(beer.name)").font(.title)
                        Text("Abv (%): \(beer.abv)")
                        Text("Rating: \(beer.rating)")
                        Text("Added on: \(showDateString(with: .short, date: beer.dateAdded))")
                        
                        Group {
                            Button(action: favoriteButtonTapped, label: {
                                Text("Favorite").padding(5)
                            })
                            Button(action: changeRatingButtonTapped, label: {
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
    
    //FUNCTIONS
    func favoriteButtonTapped() {
        print("favorite")
    }
    
    func changeRatingButtonTapped() {
        print("change rating")
    }
    
    func showDateString(with style: DateFormatter.Style, date: Date) -> String {
        dateFormatter.dateStyle = style
        return dateFormatter.string(from: date)
    }
    
}

struct BeerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BeerDetailView()
    }
}
