//
//  ViewController.swift
//  GithubDemo
//
//  Created by Nhan Nguyen on 5/12/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var searchBar: UISearchBar!
    var searchSettings = GithubRepoSearchSettings()
    
    var gitHubRepos: [GithubRepo]?

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize UISearchBar
        searchBar = UISearchBar()
        searchBar.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // add search bar to navigation bar
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120
        
        doSearch()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if gitHubRepos != nil {
            return gitHubRepos!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GitCell", forIndexPath: indexPath) as! GitCell
        
        
        cell.name = gitHubRepos[indexPath.row]
        
        return cell
        
    }
    
    private func doSearch() {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        GithubRepo.fetchRepos(searchSettings, successCallback: { (repos) -> Void in
            for repo in repos {
                println("[Name: \(repo.name!)]")
                println("\n\t[Description: \(repo.description!)]")
                println("\n\t[Stars: \(repo.stars!)]")
                println("\n\t[Forks: \(repo.forks!)]")
                println("\n\t[Owner: \(repo.ownerHandle!)]")
                println("\n\t[Avatar: \(repo.ownerAvatarURL!)]")
            }
            MBProgressHUD.hideHUDForView(self.view, animated: true)
        }, error: { (error) -> Void in
            println(error)
        })
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchSettings.searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}