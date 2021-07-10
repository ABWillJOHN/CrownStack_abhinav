//
//  SongViewModel.swift
//  CrownStack_abhinav
//
//  Created by Abhinav.prashar on 10/07/21.
//

import Foundation
protocol ResponceFromApi {
    func didReceiveResponceFromApi(apiResponce: SongsModel?)
}

struct SongViewModel {
    var responceFromApi : ResponceFromApi?

    init() {
        getDataFromApi()
    }
    func getDataFromApi() {
        let httpUtility = HttpUtility()
        let songUrl = URL(string: ApiEndpoints.songUrl)!
        httpUtility.getApiData(requestUrl: songUrl, resultType: SongsModel.self) { songsModel in
            DispatchQueue.main.async {
                self.responceFromApi?.didReceiveResponceFromApi(apiResponce: songsModel)
            }
        }
    }
}
