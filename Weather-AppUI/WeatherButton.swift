//
//  WeatherButton.swift
//  Weather-AppUI
//
//  Created by Mac on 04/12/24.
//

import SwiftUI

struct WeatherButton : View {
    var buttonName : String
    var backGroundColor : Color
    var titleColor : Color
    
    var body: some View {
        Text(buttonName)
            .bold()
            .frame(width: 280,height: 50)
            .background(backGroundColor.gradient)
            .foregroundColor(titleColor)
            .font(.system(size: 20,weight: .bold,design: .default))
            .cornerRadius(10)
    }
}

struct Weather_Button_Preview : PreviewProvider{
    static var previews : some View{
        WeatherButton(buttonName: "Test Title", backGroundColor: .lightBlue, titleColor: .black)
    }
}
