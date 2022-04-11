//
//  DetayView.swift
//  Film Kitabı
//
//  Created by umut yalçın on 5.03.2022.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    @ObservedObject var filmDetailViewModel = FilmDetailViewModel()
    
    
    var body: some View {
        
        VStack{
            OzelImage(url: filmDetailViewModel.filmDetail?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.5, alignment: .center)
           
            Text(filmDetailViewModel.filmDetail?.title ?? "Film ismi")
                .foregroundColor(.blue)
                .font(.largeTitle)
            Text(filmDetailViewModel.filmDetail?.year ?? "Film yılı")
                .foregroundColor(.red)
            Text("Yönetmen :\(filmDetailViewModel.filmDetail?.director ?? "Film yönetmeni gösterilecek.")")
                .padding()
            Text("Yazar : \(filmDetailViewModel.filmDetail?.writer ?? "Film yönetmeni gösterilecek.")")
                .padding()
            Text(filmDetailViewModel.filmDetail?.awards ?? "Film Ödüller Gösterilecek")
                .padding()
            
            
        }.onAppear(perform: {
            self.filmDetailViewModel.filmDetailAl(imdbId: imdbId)
        })
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "Umut")
    }
}
