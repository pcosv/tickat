//
//  Utilities.swift
//  tickat
//
//  Created by Paula Vaz on 30/11/18.
//  Copyright © 2018 Paula Vaz. All rights reserved.
//

import Foundation
import UIKit
import MapKit

extension UIViewController {
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
