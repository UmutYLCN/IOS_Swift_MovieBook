//
//  ContentView.swift
//  Film Kitabı
//
//  Created by umut yalçın on 4.03.2022.
//

import SwiftUI

struct FilmListView: View {
    
   @ObservedObject var filmListViewModel  : FilmListViewModel
    
    @State var aranacakFilm = ""
    
    init (){
        self.filmListViewModel = FilmListViewModel()
        
    }
        
    var body: some View {
        
      
        NavigationView{
            
            VStack {
            
                TextField("Film Ara", text: $aranacakFilm, onEditingChanged: {_ in} ,onCommit:{
                self.filmListViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)  ?? aranacakFilm)
            }).padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            
            List(filmListViewModel.filmler, id : \.imdbId) {
                film in
                
                NavigationLink(destination: DetayView(imdbId: film.imdbId)) {
                    
                    HStack (){
                        OzelImage(url : film.poster)
                            .frame(width: 90, height: 130)
                            
                        
                        VStack(alignment : .leading ) {
                            Text(film.title)
                                .font(.title3)
                                .foregroundColor(.blue)
                                .padding()
                            Text(film.year)
                                .foregroundColor(.orange)
                                .padding()
                        }
                    }
                }
            }
            .navigationBarTitle("Film Kitabı")
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
