//
//  NewsModels.swift
//  Take Home 1
//
//  Created by Ricardo Rodriguez on 1/29/20.
//  Copyright © 2020 Ricardo Rodriguez. All rights reserved.
//



struct Articles: Decodable {
    let articles: [News]
}
struct Source: Decodable {
    let id: String?
    let name: String?
    
}
struct News: Decodable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let content: String?
    
}
