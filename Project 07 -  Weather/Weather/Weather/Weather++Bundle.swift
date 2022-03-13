//
//  Weather++Bundle.swift
//  Weather
//
//  Created by 임동혁 on 2022/03/13.
//

import Foundation

extension Bundle {
    var apikey: String {
        guard let file = self.path(forResource: "WeatherInfo", ofType: "plist") else { return ""}
        
        guard let resource = NSDictionary(contentsOf: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("WeatherInfo.plist에 API_KEY설정을 해주세요.")}
    }
}
