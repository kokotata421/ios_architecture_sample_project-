//
//  PhotoUseCase.swift
//  iOSArchitectureKKSample
//
//  Created by Kota Kawanishi on 2019/08/17.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import Foundation

protocol PhotoUseCaseInputPort: PhotoSelectable, PhotoLikeable, CollectionEditable, PhotoDownloadable {
    func showDetail()
    func otherPhotosSlideUp()
}

protocol PhotoUseCaseOutputPort: PhotoLikeUpdatale, PhotoTransitionable {
    func showDetail()
    func slideUpOtherPhotoView()
}
