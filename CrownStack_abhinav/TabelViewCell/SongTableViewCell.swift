//
//  SongTableViewCell.swift
//  CrownStack_abhinav
//
//  Created by Abhinav.prashar on 10/07/21.
//

import UIKit
import SDWebImage
class SongTableViewCell: UITableViewCell {
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var songImage: UIImageView!
    @IBOutlet weak var longDescriptionLabel: UILabel!
    var song : Songs?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setUpView() {
        songLabel.text = song?.trackName
        if let imageUrl = URL(string: song?.artworkUrl100 ?? ""){
            songImage.sd_setImage(with: imageUrl, completed: nil)
        }
        longDescriptionLabel.text = song?.longDescription
    }
}
