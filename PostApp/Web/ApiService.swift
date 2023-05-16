//
//  ApiService.swift
//  PostApp
//
//  Created by Ronald Chester Whigan on 5/15/23.
//

import Foundation

class ApiService {
    static var shared = ApiService()
    
    func getFromServer(url: String, closure: @escaping ([PostModel]) -> ()) {
        guard let thisUrl = URL(string: url) else{
            print("Recheck Url given")
            return
        }
        let request = thisUrl
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard let data = data else {
                    print("No data received")
                    
                    return
                }
                
                let postList = try JSONDecoder().decode([PostModel].self, from: data)
                closure(postList)
            }
            catch {
                print(error)
            }
        }
        
        task.resume() //NEVER FORGET THIS LINE!
    }
}
