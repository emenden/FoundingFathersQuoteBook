//
//  TopicsViewController.swift
//  FoundingFathersQuoteBook
//
//  Created by Emily Prigmore on 9/17/18.
//  Copyright © 2018 IS 543. All rights reserved.
//

import UIKit

class TopicsViewController : UITableViewController {
    
    // CONSTANTS
    private struct Storyboard {
        static let ShowQuoteSegueIdentifier = "ShowQuote"
        static let TopicCellIdentifier = "TopicCell"
    }
    
    // PROPERTIES
    var selectedTopic: String?
    
    // VIEW CONTROLLER LIFECYCLE
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? QuoteViewController {
            destinationVC.topic = selectedTopic
        }
    }
    
    // TABLE VIEW DATA SOURCE
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TopicCellIdentifier,
                                                 for: indexPath)
        
        cell.textLabel?.text = QuoteDeck.sharedInstance.tagSet[indexPath.row].capitalized
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuoteDeck.sharedInstance.tagSet.count
    }
    
    
    // TABLE VIEW DELEGATE
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTopic = QuoteDeck.sharedInstance.tagSet[indexPath.row]
        performSegue(withIdentifier: Storyboard.ShowQuoteSegueIdentifier, sender: self)
    }
}
