//
//  ViewController.swift
//  Weather
//
//  Created by 임동혁 on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var weatherStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapFetchWeatherButton(_ sender: UIButton) {
        // getCurrentWeather를 통해서 날짜 불러오기 버튼을 눌러서 현재 도시의 날씨 가져오기
        if let cityName = self.cityNameTextField.text {
            self.getCurrentWeather(cityName: cityName)
            self.view.endEditing(true)
        }
    }
    func configureView(weatherInformation: WeatherInformation) {
        self.cityNameLabel.text = weatherInformation.name
        // weather 배열의 첫번째 요소가 weather 상수에 대입되게 함
        if let weather = weatherInformation.weather.first {
            self.weatherDescriptionLabel.text = weather.description
        }
        self.tempLabel.text = "\(Int(weatherInformation.temp.temp - 273.15))°C"
        self.minTempLabel.text = "최저: \(Int(weatherInformation.temp.minTemp - 273.15))°C"
        self.maxTempLabel.text = "최고: \(Int(weatherInformation.temp.maxTemp - 273.15))°C"
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "에러", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil) // 알럿이 화면에 표시
    }
    
    func getCurrentWeather(cityName: String) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=(apiKey를 입력하세요.)") else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [weak self] data, response, error in
            let successRange = (200..<300)
            guard let data = data, error == nil else { return }
            let decoder = JSONDecoder()
            if let response = response as? HTTPURLResponse, successRange.contains(response.statusCode) {
                guard let weatherInformation = try? decoder.decode(WeatherInformation.self, from: data) else { return }
                DispatchQueue.main.async {
                    self?.weatherStackView.isHidden = false
                    self?.configureView(weatherInformation: weatherInformation)
                } // 현재 날씨 정보가 뷰에 표시
            } else {
                guard let errorMessage = try? decoder.decode(ErrorMessage.self, from: data) else { return }
                DispatchQueue.main.async {
                    self?.showAlert(message: errorMessage.message)
                }
            }
                
        }.resume()
    }
}

