import ArgumentParser

class ArgumentParser {
    let parser: ArgumentParser

    init() {
        parser = ArgumentParser(usage: "<url>",
                                overview: "A command-line tool for web scraping.")
    }

    func parse() -> String {
        do {
            let url = try parser.parse()
            return url.trimmed()
        } catch {
            print(error.localizedDescription)
            exit(1)
        }
    }
}

extension ArgumentParser: ParsableArguments {
    func validate() throws {
        guard !CommandLine.arguments.dropFirst().isEmpty else {
            throw ValidationError("Missing URL argument.")
        }
    }
}

extension String: ExpressibleByArgument {
    public init?(argument: String) {
        self = argument
    }
}