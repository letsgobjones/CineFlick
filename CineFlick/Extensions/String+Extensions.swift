//
//String+Extensions.swift
//  CineFlick
//
//  Created by Brandon Jones on 9/24/24.
//

import Foundation

extension String {
  
  var urlEncoded: String? {
    return addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
  }
  
}
