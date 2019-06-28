//
//  MainTabCoordinator.swift
//  iOSArchitectureKKSample
//
//  Created by Kota Kawanishi on 2019/06/28.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import UIKit

final class MainTabCoordinator: Coordinator {
    let mainTabBarController: UITabBarController = .init()
    private let categoryCoordinator: ColourCategoryCoordinator = .init()
    private let searchCoordinator: ColourSearchCoordinator = .init()
    private let favoritesCoordinator: ColourFavoritesCoordinator = .init()
    private let settingCoordinator: ColourSettingCoordinator = .init()
    
    init() {
        
    }
    
    func start() {
        let tabBarControllers: [UIViewController] = [ categoryCoordinator.categoryVC,
                                                      searchCoordinator.searchVC,
                                                      favoritesCoordinator.favoritesVC,
                                                      settingCoordinator.settingVC]
        mainTabBarController.setViewControllers( tabBarControllers, animated: false)
        
        return
    }
}
