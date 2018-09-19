//
//  QuoteViewController.swift
//  FoundingFathersQuoteBook
//
//  Created by Emily Prigmore on 9/17/18.
//  Copyright © 2018 IS 543. All rights reserved.
//

import UIKit
import WebKit

class QuoteViewController : UIViewController {
    
    // CONSTANTS
    private struct Storyboard {
        static let QuoteOfTheDayTitle = "Quote of the Day"
        static let ShowTopicsSegueIdentifier = "ShowTopics"
        static let TodayTitle = "Today"
        static let TopicsTitle = "Topics"
    }
    
    // OUTLETS
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
    // PROPERTIES
    var currentQuoteIndex = 0
    var quotes: [Quote]!    // implicitly unwrapped optional, if try to use quotes ad it is nil, you have programming mistake
    var topic: String?
    
    // VIEW CONTROLLER LIFECYLCE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    // ACTIONS
    @IBAction func showQuoteOfTheDay() {
        topic = nil
        configure()
    }

    @IBAction func toggleTopics(_ sender: UIBarButtonItem) {
        if sender.title == Storyboard.TopicsTitle {
            performSegue(withIdentifier: Storyboard.ShowTopicsSegueIdentifier, sender: sender)
        } else {
            showQuoteOfTheDay()
        }
    }
    // HELPERS
    private func configure() {
        if let currentTopic = topic {
            quotes = QuoteDeck.sharedInstance.quotesForTag(currentTopic)
            currentQuoteIndex = 0
        } else {
            quotes = QuoteDeck.sharedInstance.quotes
            chooseQuoteOfTheDay()
        }
         updateUI()
    }
    
    private func updateUI() {
        let currentQuote = quotes[currentQuoteIndex]
        
        if let currentTopic = topic {
            toggleButton.title = Storyboard.TodayTitle
            title = "\(currentTopic.capitalized) (\(currentQuoteIndex + 1) of \(quotes.count))"
        } else {
            toggleButton.title = Storyboard.TopicsTitle
            title = Storyboard.QuoteOfTheDayTitle
        }
        webView.loadHTMLString(currentQuote.htmlPage(), baseURL: nil)
    }
    
    private func chooseQuoteOfTheDay() {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "DDD"
        if let dayInYear = Int(formatter.string(from: Date())) {
            currentQuoteIndex = dayInYear % QuoteDeck.sharedInstance.quotes.count
        }
    }
    
    // SEGUES
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        // in this case, there is nothing to do; but we need a target.
    }
    
    @IBAction func showTopicQuotes(_ segue: UIStoryboardSegue) {
        configure()
    }
}
