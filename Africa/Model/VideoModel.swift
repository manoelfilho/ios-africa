//
//  VideoModel.swift
//  Africa
//
//  Created by Manoel Filho on 16/04/21.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    //computed property
    var thumbnail: String{
        "video-\(id)"
    }
}

