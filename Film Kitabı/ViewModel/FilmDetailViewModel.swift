//
//  FilmDetailViewModel.swift
//  Film Kitabı
//
//  Created by umut yalçın on 5.03.2022.
//

import Foundation
import SwiftUI

class FilmDetailViewModel : ObservableObject {
    
   @Published  var filmDetail : FilmDetailsViewModel?
    
    
    let downloaderClient = DownloaderClient()
    
    func filmDetailAl(imdbId : String){
       
        
        downloaderClient.FilmDetayiniIndir(imdbId: imdbId) { (sonuc) in
            
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                DispatchQueue.main.async {
                    self.filmDetail = FilmDetailsViewModel(detay: filmDetay)
                }
                
            }
            
        }
    }
    
}

struct FilmDetailsViewModel {
    
    let detay : FilmDetail
    
    var title : String {
        detay.title
    }
    
    var poster : String {
        detay.poster
    }
    
    var year : String {
        detay.year
    }
    var imdbId : String {
        detay.imdbId
    }
    var director : String {
        detay.director
    }
    
    var writer : String {
        detay.writer
    }
    
    var awards : String {
        detay.awards
    }
    var plot : String {
        detay.plot
    }
    
}
