//
//  ColourSettingCoordinator.swift
//  iOSArchitectureKKSample
//
//  Created by Kota Kawanishi on 2019/06/27.
//  Copyright © 2019 Kota Kawanishi. All rights reserved.
//

import Foundation

final class AccountCoordinator: Coordinator {
    let settingVC: AccountViewController = {
        let settingVC: AccountViewController = .init()
        settingVC.tabBarItem.title = R.string.localizable.setting()
        return settingVC
    }()
    
    func start() {
        return
    }
    
}
