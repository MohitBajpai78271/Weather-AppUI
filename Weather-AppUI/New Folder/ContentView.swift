//
//  ContentView.swift
//  Weather-AppUI
//
//  Created by Mac on 03/12/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack{
           // BackgroundView(topColor: isNight ? .black:.blue, bottomColor: isNight ? .gray:.lightBlue)*/
            BackgroundView(isNight: isNight, topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : .lightBlue)
            VStack{
                cityTextView(cityName: "Nangloi,Delhi")
                MainWeatherView(image: isNight ? " moon.stars.fill":"cloud.sun.fill", temp: 37)
                
                HStack(spacing: 20){
                    WeatherDayView(day: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 46)
                    WeatherDayView(day: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 51)
                    WeatherDayView(day: "THU",
                                   imageName: "sun.haze.fill",
                                   temperature: 42)
                    WeatherDayView(day: "FRI",
                                   imageName: "cloud.snow.fill",
                                   temperature: 39)
                    WeatherDayView(day: "SAT",
                                   imageName: "snowflake",
                                   temperature: 29)
            
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(buttonName: "Change Day Time", backGroundColor: Color.mint, titleColor: .blue)
                }
                
                Spacer()
                    
            }
        }
    }
}

struct ContentView_Previews:
    PreviewProvider{
    static var previews: some View{
        ContentView()
 }
}
                    

struct WeatherDayView: View {
    
    var day : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        VStack{
            Text(day)
                .font(.system(size: 16,weight: .medium,design: .default))
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)
                .resizable()
//                .foregroundColor(.blue)  hier
//                .foregroundStyle(.yellow, .green, .brown)   pallete
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28,weight: .medium,design: .default))
        }
    }
}

struct BackgroundView: View {
    var isNight : Bool
    var topColor : Color
    var bottomColor : Color
    
    var body: some View {
//        LinearGradient(colors: [topColor,bottomColor],
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct cityTextView : View{
    var cityName : String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32,weight: .medium,design: .serif))
            .foregroundColor(Color.white)
            .padding(.top,20)
    }
}

struct MainWeatherView : View {
    var image : String
    var temp : Int
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: image)
                .symbolRenderingMode(.multicolor)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temp)°")
                .font(.system(size: 72,weight: .bold,design: .default))
        }
        
        .padding(.bottom,40)
    }
}
