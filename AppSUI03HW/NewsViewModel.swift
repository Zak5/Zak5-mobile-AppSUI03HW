//
//  NewsViewModel.swift
//  
//
//  Created by Konstantin Zaharev on 19.12.2021.
//

import SwiftUI
import Networking
import ServiceLocator

extension Article: Identifiable {
    public var id: String { url }
}

@MainActor
final class NewsViewModel : ObservableObject {
    
    @Injected var newsAPI: InshortsNewsAPI?
    
    @Published var category: String = ""
    @Published var categories = [String]()
    @Published var articles = [Article]()
    
    init() {
        if let newsCategories = newsAPI?.getCategories() {
            categories = newsCategories
            category = newsCategories[0]
        }
    }
    
    func getArticles() async {
        guard let articleList = await newsAPI?.getArticleList(category) else { return }
        self.articles = articleList.data
    }
}
