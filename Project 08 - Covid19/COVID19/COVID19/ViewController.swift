//
//  ViewController.swift
//  COVID19
//
//  Created by 임동혁 on 2022/03/22.
//

import UIKit

import Alamofire
import Charts

class ViewController: UIViewController {

    @IBOutlet weak var totalCaseLabel: UILabel!
    @IBOutlet weak var newCaseLabel: UILabel!
    @IBOutlet weak var pieChartsView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCovidOverView(completionHandler: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(result):
                self.configureStackView(koreaCovidOverView: result.korea)
                debugPrint("success \(result)")
            case let .failure(error):
                debugPrint("error \(error)")
            }
        })
    }
    
    func configureStackView(koreaCovidOverView: CovidOverView) {
        self.totalCaseLabel.text = "\(koreaCovidOverView.totalCase) 명"
        self.newCaseLabel.text = "\(koreaCovidOverView.newCase)"
    }
    
    func fetchCovidOverView(
        completionHandler: @escaping (Result<CityCovidOverView, Error>) -> Void
    ) {
        let url = "https://api.corona-19.kr/korea/country/new/"
        let param = [
            "serviceKey": "r2xisozdpHL1hkFm53ASJXaWlfcMbuZGY"
        ]
        
        AF.request(url, method: .get, parameters: param)
            .responseData(completionHandler: { response in
                switch response.result {
                case let .success(data):
                    do {
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(CityCovidOverView.self, from: data)
                        completionHandler(.success(result))
                    } catch {
                        completionHandler(.failure(error))
                    }
                    
                case let .failure(error):
                    completionHandler(.failure(error))
                }
            })
    }
}

