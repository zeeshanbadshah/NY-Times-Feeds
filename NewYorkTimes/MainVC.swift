//
//  ViewController.swift
//  NewYorkTimes
//
//  Created by Zeeshan Badshah on 26/02/2019.
//  Copyright © 2019 Zeeshan Badshah. All rights reserved.
//

import UIKit

class MainVC: UIViewController  {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    final let  segueDetail = "showDetailSegue"
    final let filterMostViewed = "mostpopular/v2/mostviewed/all-sections/7.json?api-key="
    var feeds = [Result]()
    var detailUrl : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        self.navigationItem.title = "NY Times Top Storeis"
        
        
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont(name: "NotoSansChakma-Regular", size: 18)!]
        
        let refreshControl: UIRefreshControl = {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action:
                #selector(MainVC.handleRefresh(_:)),
                                     for: UIControl.Event.valueChanged)
            refreshControl.tintColor = UIColor.red
            refreshControl.attributedTitle = NSAttributedString(string: "Looking for new stories")
            
            return refreshControl
        }()
        
        tblView.addSubview(refreshControl)
        loadFeeds()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl)  {
        
        
        WebAPI().getFeeds(filter: filterMostViewed) {
            (feedsResponse) in
            
            DispatchQueue.main.async {
                refreshControl.endRefreshing()
                if(feedsResponse.status != "ERROR"){
                    self.feeds.removeAll()
                    self.feeds.append(contentsOf: feedsResponse.results)
                    
                }else{
                    self.ShowErrorAlert(message: "Something went wrong! please retry.")
                }
                
            }
            
        }
        
        
    }
    
    func loadFeeds()  {
        
        self.tblView.isHidden = true
        self.activityIndicator.startAnimating()
        WebAPI().getFeeds(filter: filterMostViewed) {
            (feedsResponse) in
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                if(feedsResponse.status != "ERROR"){
                    self.feeds.removeAll()
                    self.feeds.append(contentsOf: feedsResponse.results)
                    
                    self.tblView.isHidden = false
                    self.tblView.reloadData()
                }else{
                
                    self.ShowErrorAlert(message: "Something went wrong! please retry.")
                }
            }
            
        }

    }
    
    
    func ShowErrorAlert(message: String)  {
        
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let retryAction = UIAlertAction(title: "RETRY", style: .default) { (alert) in
            
            alertController.dismiss(animated: true, completion: nil)
            self.loadFeeds()
        }
        alertController.addAction(retryAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? DetailVC{
            destination.detailURL = self.detailUrl
        }
        
    }
    
}

extension MainVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let feed = feeds[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedCell.Identifier, for: indexPath) as! FeedCell
        cell.txtTitle.text = feed.title
        cell.txtAuther.text = feed.byline
        cell.txtDated.text = feed.publishedDate
        cell.txtCategory.text = feed.section
        cell.imgView.imageFromServerURL(feed.media[0].mediaMetadata[0].url, placeHolder: UIImage(named: "placeholder"))
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let feed = feeds[indexPath.row]
        self.detailUrl = feed.url
        performSegue(withIdentifier: segueDetail, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}

