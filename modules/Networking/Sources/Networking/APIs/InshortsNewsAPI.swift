//
//  InshortsNewsAPI.swift
//  
//
//  Created by Konstantin Zaharev on 23.12.2021.
//

import Foundation

public class InshortsNewsAPI {
    
    public init() {}

    public func getCategories() -> [String] {
        return ["all", "business", "technology", "science", "sports"]
    }
    
    public func getArticleList(_ category: String) async -> ArticleList? {
        
        guard let url = URL(string: "https://inshortsapi.vercel.app/news?category=\(category)") else {
            print("Invalid URL")
            return nil
        }
        
        guard let (data, response) = try? await URLSession.shared.data(from: url) else {
            print("Invalid data")
            return nil
        }
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Invalid response")
            return nil
        }
        
        let decoder = JSONDecoder()
        
        return try? decoder.decode(ArticleList.self, from: data)
    }
    
}
