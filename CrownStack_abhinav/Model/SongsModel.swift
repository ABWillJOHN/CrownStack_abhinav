//
//  SongsModel.swift
//  CrownStack_abhinav
//
//  Created by Abhinav.prashar on 08/07/21.
//

import Foundation

struct SongsModel: Decodable {
    let resultCount: Int
    let results : [Songs]
}
struct Songs:Decodable {
    let artistName:String?
    let wrapperType:String?
    let artistId:Int?
    let collectionId:Int?
    let collectionName:String?
    let collectionCensoredName:String?
    let artistViewUrl:String?
    let collectionViewUrl:String?
    let artworkUrl60:String?
    let artworkUrl100:String?
    let collectionPrice:Double?
    let collectionExplicitness:String?
    let description:String?
    let previewUrl:String?
    let primaryGenreName:String?
    let releaseDate:String?
    let currency:String?
    let country:String?
    let copyright:String?
    let trackCount:Int?
    let trackName:String?
    let longDescription: String?
}
