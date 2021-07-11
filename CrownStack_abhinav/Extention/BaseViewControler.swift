//
//  BaseViewControler.swift
//  CrownStack_abhinav
//
//  Created by Abhinav.prashar on 11/07/21.
//

import UIKit

class BaseViewControler: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = ColorConstants.singleton.navigationColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: ColorConstants.singleton.navigationTitelColor]
    }
}

