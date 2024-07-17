//
//  ViewController.swift
//  Lesson19HW
//
//  Created by Pavel on 17.07.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loadButton(_ sender: UIButton) {
        
        loadData()
    }
    
    func loadData() {
        
        let urlString = "https://reqres.in/api/unknown"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let responseError = error {
                print(responseError)
            }
            
            guard let responseData = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(DataModel.self, from: responseData)
                
            } catch {
                print(error)
            }
        }.resume()
    }
}
