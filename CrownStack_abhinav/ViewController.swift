//
//  ViewController.swift
//  CrownStack_abhinav
//
//  Created by Abhinav.prashar on 06/07/21.
//

import UIKit

class ViewController: BaseViewControler {

    @IBOutlet weak var activityIndecatoer: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var songsData : SongsModel? {
        didSet{
            (songsData?.results.count ?? 0 <= 0) ? addBackGroundView() : tableView.reloadData()
        }
    }
    var newModel = SongViewModel()
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
                                    #selector(handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.black
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refress:UIRefreshControl)  {
        newModel.getDataFromApi()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.addSubview(self.refreshControl)
        newModel.responceFromApi = self
        title = "SONGS"
        startActivityIndecator()
        newModel.getDataFromApi()
        setupTabelView()
    }
    
    fileprivate func startActivityIndecator() {
        activityIndecatoer.isHidden = false
        activityIndecatoer.startAnimating()
    }
    
    fileprivate func setupTabelView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "SongTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "SongTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    func addBackGroundView() {
        let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: self.tableView.frame.size.height))
        let noRecordsLabel = UILabel(frame: CGRect(x: 16, y: 0, width: backgroundView.frame.size.width - 32, height: 100))
        noRecordsLabel.text = "Please Try Again!!"
        noRecordsLabel.numberOfLines = 0
        noRecordsLabel.center = backgroundView.center
        noRecordsLabel.textAlignment = .center
        backgroundView.addSubview(noRecordsLabel)
        tableView.backgroundView = backgroundView
    }
}
extension ViewController:ResponceFromApi {
    func didReceiveResponceFromApi(apiResponce: SongsModel?) {
        songsData = apiResponce
        activityIndecatoer.stopAnimating()
        refreshControl.endRefreshing()
    }
}
extension ViewController: UITableViewDelegate {
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell", for: indexPath) as! SongTableViewCell
        cell.song = songsData?.results[indexPath.row]
        cell.setUpView()
        return cell
    }
}
class BaseViewControler: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = ColorConstants.singleton.navigationColor
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: ColorConstants.singleton.navigationTitelColor]
    }
}
