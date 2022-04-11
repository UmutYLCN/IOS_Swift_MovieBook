//
//  DownloaderClient.swift
//  Film Kitabı
//
//  Created by umut yalçın on 4.03.2022.
//

import Foundation
import SwiftUI



class DownloaderClient {
    
    func filmleriIndir(search : String , completion : @escaping(Result<[Film]? ,DownloaderError>) ->Void){
        
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(search )&apikey=33b34592") else {
            return completion(.failure(.yanlisUrl))
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.verilerIslenemedi))
            }
            completion(.success(filmCevabi.filmler))
        }.resume()
        
        
    
}
    
    func FilmDetayiniIndir(imdbId: String, completion: @escaping (Result<FilmDetail,DownloaderError>) -> Void ){
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId )&apikey=33b34592") else {
            return completion(.failure(.yanlisUrl))
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let gelenfilmDetayi = try? JSONDecoder().decode(FilmDetail.self, from: data) else {
                return completion(.failure(.verilerIslenemedi))
            }
            completion(.success(gelenfilmDetayi))
        }.resume()
    }
    
}


enum DownloaderError : Error {
    case yanlisUrl
    case veriGelmedi
    case verilerIslenemedi
}
