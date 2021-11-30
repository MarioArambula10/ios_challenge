//
//  CarListTableViewCellViewModel.swift
//  IOSChallenge
//
//  Created by TL on 11/30/21.
//

import Foundation

extension CarListTableViewCell {
    final class ViewModel: CarListMapperInjected, DatabaseInjected {
        func favoriteButtonWasPressed(item: CarListViewModel, competion: @escaping ((String?) -> Void)) {
            guard let adModel = carListMapper.asAdModelList([item]).first else { return }
//            sender.isSelected.toggle()
            db.addNewFavorite(adModel) { result in
                switch result {
                case .success(let isSccess):
                    competion(nil)
                    
                case .failure(let error):
                    competion(error.localizedDescription)
                }
            }
        }
    }
}
