//
//  NetworkLayer.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/29/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class NetworkLayer {
	
	
	func getArticles(category: String, completion: @escaping (Articles)->()) {
		
		// create request
		let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=d1691f4a19ed40038ac4dd280665a7a1")!
		let request = URLRequest(url: url)
		let session = URLSession(configuration: .default)
		
		let task = session.dataTask(with: request) { data, response, error in
			guard let data = data, error == nil else {
				print(error?.localizedDescription ?? "No data")
				return
			}
			
			if let httpResponse = response as? HTTPURLResponse {
				print("Status: \(httpResponse.statusCode)")
				if httpResponse.statusCode == 400 {
					return
				}
				
			}
			
			// Validate response data is in expected format
			guard let mime = response?.mimeType, mime == "application/json" else {
				print("Wrong MIME type!")
				return
			}
						
			
			do {
				let decoder = JSONDecoder()
				let decoded = try decoder.decode(Articles.self, from: data)
				print(decoded)
				let articles = decoded
				completion(articles)
			} catch {
				print(error)
			}
		}
		task.resume()
	}
	
	func getArticles(query: String, completion: @escaping (Articles)->()) {
		
		
		var urlComponents = URLComponents()
		urlComponents.scheme = "https"
		urlComponents.host = "newsapi.org"
		urlComponents.path = "/v2/top-headlines"
		urlComponents.queryItems = [
		   URLQueryItem(name: "q", value: query),
		   URLQueryItem(name: "apiKey", value: "d1691f4a19ed40038ac4dd280665a7a1"),
		]
		
		
		// create request
		let url = URL(string: urlComponents.url!.absoluteString)!
		let request = URLRequest(url: url)
		let session = URLSession(configuration: .default)
		
		let task = session.dataTask(with: request) { data, response, error in
			guard let data = data, error == nil else {
				print(error?.localizedDescription ?? "No data")
				return
			}
			
			if let httpResponse = response as? HTTPURLResponse {
				print("Status: \(httpResponse.statusCode)")
				if httpResponse.statusCode == 400 {
					return
				}
				
			}
			
			// Validate response data is in expected format
			guard let mime = response?.mimeType, mime == "application/json" else {
				print("Wrong MIME type!")
				return
			}
						
			
			do {
				let decoder = JSONDecoder()
				let decoded = try decoder.decode(Articles.self, from: data)
				print(decoded)
				let articles = decoded
				completion(articles)
			} catch {
				print(error)
			}
		}
		task.resume()
	}
	
	
	
	func getImage(url: String?, completion: @escaping (_ loadedImage: UIImage)-> Void){
		
		let placeHolder = URL(string: "https://awlights.com/wp-content/uploads/sites/31/2017/05/placeholder-news.jpg")!
     
		let request = URLRequest(url: URL(string: url!) ?? placeHolder )
        
        let task = URLSession.shared.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if error == nil {
                let loadedImage = UIImage(data: data!)
                DispatchQueue.main.async {
                    completion(loadedImage!)
                }
            }
        }
        task.resume()
    }
	
}
