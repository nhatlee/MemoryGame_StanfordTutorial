//
//  Array+only.swift
//  Memorize
//
//  Created by nhatle on 6/7/20.
//  Copyright © 2020 VNG. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
