//
//  BeerDetailView.swift
//  Project
//
//  Created by Florian Goossens on 26/11/2020.
//

import SwiftUI
import SafariServices

struct BeerDetailView: View {
    @State var beers: [Beer] = []
    var selectedBeerIndex: Int!
    //@State var beer: Beer!
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
                        Text("\(beers[selectedBeerIndex].name)").font(.custom("Avenir Next", size: 22)).fontWeight(.semibold)
                        Text("Abv (%): \(String(format: "%.2f", beers[selectedBeerIndex].abv))")
                        Text("Rating: \(beers[selectedBeerIndex].rating)")
                        Text("Added on: \(showDateString(with: .short, date: beers[selectedBeerIndex].dateAdded))")
                        
                        Group {
                            Button(action: favoriteButtonTapped, label: {
                                Text(beers[selectedBeerIndex].isFavorit ? "Unfavorite" : "Favorite").padding(5)
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
        beers[selectedBeerIndex].isFavorit = !beers[selectedBeerIndex].isFavorit
        BeerController.saveToFile(beers: beers)
    }
    
    func changeRatingButtonTapped() {
        let alert = UIAlertController(title: "Change Rating", message: "", preferredStyle: .alert)
        alert.addTextField { textfield in
            textfield.placeholder = "0-10"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { _ in
            let textfield = alert.textFields![0]
            guard let rating = Int(textfield.text!) else {
                UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                return
            }
            beers[selectedBeerIndex].rating = rating
            
            BeerController.saveToFile(beers: beers)
        }))
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
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
