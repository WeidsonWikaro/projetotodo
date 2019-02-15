//
//  Aluno.swift
//  ProjectFinal
//
//  Created by aluno on 07/02/19.
//  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
//

import Foundation


class Aluno: NSObject, NSCoding {
    
    var studentDescription: String?
    var latitude: Double?
    var longitude: Double?
   
    
    init(description: String, latitude: Double, longitude: Double) {
        self.studentDescription = description
        self.latitude = latitude
        self.longitude = longitude
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(studentDescription, forKey: "studentDescription")
        aCoder.encode(latitude, forKey: "latitude")
        aCoder.encode(longitude, forKey: "longitude")
    }
    
    required init?(coder aDecoder: NSCoder) {
        studentDescription = aDecoder.decodeObject(forKey: "studentDescription") as? String
        latitude = aDecoder.decodeObject(forKey: "latitude") as? Double
        longitude = aDecoder.decodeObject(forKey: "longitude") as? Double
       
    }
}
