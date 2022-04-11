//
//  FilmListViewModel.swift
//  Film Kitabı
//
//  Created by umut yalçın on 4.03.2022.
//

import Foundation
import SwiftUI

class FilmListViewModel : ObservableObject {

    
    @Published var filmler = [FilmViewModel]()
    
    let downloadClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi: String){
        
        downloadClient.filmleriIndir(search: filmIsmi) { (sonuc) in
            switch sonuc {
            case.failure(let hata):
                print(hata)
            case.success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(FilmViewModel.init)
                    }
                    
                    
            }
    }
}
    
    
}
}

struct FilmViewModel {
    let film : Film
    
    var title : String {
        film.title
    }
    
    var year : String {
        film.year
    }
    
    var poster : String {
        film.poster
        
    }
    
    var imdbId : String {
        film.imdbId
    }
    
}
