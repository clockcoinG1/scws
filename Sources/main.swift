import Foundation
import ArgumentParser
import scraper
import utils

struct MyWebScraper: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A command-line tool for web scraping.",
        version: "1.0.0",
        subcommands: [Scrape.self],
        defaultSubcommand: Scrape.self
    )
}

struct Scrape: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Scrape data from a website.",
        shouldDisplay: true
    )
    
    @Argument(help: "The URL to scrape.")
    var url: String
    
    func run() throws {
        let scraper = Scraper()
        let result = try scraper.scrape(url: url)
        print(result)
    }
}

MyWebScraper.main()