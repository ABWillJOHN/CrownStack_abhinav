//
//  SongDetilsViewController.swift
//  CrownStack_abhinav
//
//  Created by Abhinav.prashar on 11/07/21.
//

import UIKit

class SongDetilsViewController: BaseViewControler {
    var songDetail: Songs?
    @IBOutlet weak var albamImage: UIImageView!
    @IBOutlet weak var discrptiontext: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = songDetail?.trackName ?? "No Name"
        if let imageUrl = URL(string: songDetail?.artworkUrl100 ?? ""){
            albamImage.sd_setImage(with: imageUrl, completed: nil)
        }
        discrptiontext.text = songDetail?.longDescription ?? "No Description Available!!!"
    }
}
