//
//  MapView.swift
//  Africa
//
//  Created by Manoel Filho on 14/04/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    //MARK: - Properties
    let locations:[NationalParkLocation] = Bundle.main.decode("locations.json")
    
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    //MARK: - Body
    var body: some View {
        
        //MARK: - 1 BASIC MAP
        //Map(coordinateRegion: $region)
        
        //MARK: - 2 BASIC ADVANCED
        
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            //A - PIN OLD STYLE (ALWAYS STATIC)
            //MapPin(coordinate: item.location, tint: .accentColor)
            
            //B - PIN NEW STYLE (ALWAYS STATIC)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            //C - Cutom Basic annotation - could be interactive
            /* MapAnnotation(coordinate: item.location){
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32, alignment: .center)
            } */
            
            //D - COMPLEX MAP
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
            }
            
        })
        .overlay(
            
            HStack(alignment: .center, spacing: 12) {
                
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .center, spacing: 12){
                    
                    HStack{
                        
                        Text("Latitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                    }
                    
                    Divider()
                    
                    HStack{
                        
                        Text("Longitude: ")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            
                    }
                    
                }
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
        
    }
}

//MARK: - Preview
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
