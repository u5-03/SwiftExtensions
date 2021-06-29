//
//  CLLocationCoordinate2D.swift
//  
//
//  Created by 杉山優悟 on 2021/03/31.
//

import Foundation
import MapKit

public extension CLLocationCoordinate2D {
    func reverseGeocoded(completion: @escaping (Result<String, Error>) -> Void) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        CLGeocoder().reverseGeocodeLocation(location) { (marks, error) in
            if let error = error {
                completion(.failure(error))
            } else if let placeMark = marks?.first {
                var address = ""
                address += placeMark.administrativeArea.unwrapped("")
                address += placeMark.locality.unwrapped("")
                address += placeMark.thoroughfare.unwrapped("")
                address += placeMark.subThoroughfare.unwrapped("")
                completion(.success(address))
            }
        }
    }
}
