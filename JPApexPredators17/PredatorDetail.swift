//
//  PredatorDetail.swift
//  JPApexPredators17
//
//  Created by stuart flood on 03/11/2024.
//

import SwiftUI

struct PredatorDetail: View {
    let predator: ApexPredator
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    //background
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8),
                                                   Gradient.Stop(color: .black, location: 1)
                                                   ], startPoint: .top, endPoint: .bottom)
                        }
                    
                    
                    //image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                      //  .border(.blue, width: 7)
                }
                VStack(alignment: .leading){
                    //dino name
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    //location
                    
                    //apperar in
                 
                    Text("Appears In: ")
                        .font(.title3)
                    
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                            .font(.subheadline)
                           
                    }
                    // movie moments
                    Text("Movie moments ")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .font(.title2)
                            .padding(.vertical, 1)
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    //link to webpage
                    Text("Read more:")
                        .font(.caption)
                    
                    Link(predator.link, destination:
                            URL(string: predator.link)!)
                    .font(.caption)
                    .foregroundStyle(.blue)
                        
                    }
                }.padding()
                .padding(.bottom, 100)
                .frame(width: geo.size.width, alignment: .leading)
            }
            .ignoresSafeArea()
        }
        
    }


#Preview {
    PredatorDetail(predator: Predators().apexPredators[10])
      .preferredColorScheme(.dark)
}
