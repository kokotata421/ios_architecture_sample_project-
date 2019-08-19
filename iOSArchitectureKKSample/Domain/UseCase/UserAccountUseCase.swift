//
//  UserAccountUseCase.swift
//  iOSArchitectureKKSample
//
//  Created by Kota Kawanishi on 2019/08/19.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import Foundation

protocol UserAccountUseCaseInputPort: PhotoSelectable, CollectionSelectable {
    func selectPhotos()
    func selectCollections()
    func selectLikes()
    func createCollection()
}

protocol UserAccountUseCaseOutputPort: CollectionTransitionable {
    func selectPhotos()
    func selectCollections()
    func selectLikes()
    func createCollection()
}
