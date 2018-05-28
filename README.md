![Configure](https://github.com/LiveUI/Configure/raw/master/Other/logo.png)

##

[![Slack](https://img.shields.io/badge/join-slack-745EAF.svg?style=flat)](http://bit.ly/2B0dEyt)
[![Jenkins](https://ci.liveui.io/job/LiveUI/job/Configure/job/master/badge/icon)](https://ci.liveui.io/job/LiveUI/job/Configure/)
[![Platforms](https://img.shields.io/badge/platforms-macOS%2010.13%20|%20Ubuntu%2016.04%20LTS-ff0000.svg?style=flat)](https://github.com/LiveUI/Configure)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)
[![Swift 4](https://img.shields.io/badge/swift-4.1-orange.svg?style=flat)](http://swift.org)
[![Vapor 3](https://img.shields.io/badge/vapor-3.0-blue.svg?style=flat)](https://vapor.codes)


## What is this even good for?!

Have you ever had an issue with SPM not supporting resources? How do you get your templates, demo files and I don't know what else from your submodules into your app?

Well, I hope **Configure** will make your experience with resource files a tiny bit easier.

> No dependencies so will work with Vapor, Perfect, Kitura and others ...

#### Functionality

- [x] Install resources from a string
- [x] Install resources from a github.com repo (un-authenticated)
- [ ] Install resources from a github.com repo (authenticated)
- [x] Install resources from anywhere in the inter-the-web
- [x] Override existing files on each run if needed
- [x] Run your install script synchronously (good when you need stuff in before your app fully starts)
- [ ] Run your install script asynchronously

> **Note** System is mainly designed for server-side-swift but will compile fine on any iOS/tvOS or macOS!

## Install

Just add following line package to your `Package.swift` file.

```swift
.package(url: "https://github.com/LiveUI/Configure.git", .branch("master"))
```

## Usage

### Remote resources

```swift
let resource = BasicWebResource(
                    resourceUrl: "http://www.example.com/Resources/email-template.leaf", 
                    destinationPath: "Resources/email-template.leaf" // Where to install the file to
               )
try ResourcesManager.default.add(resource)
```

### Github resources

```swift
let resource = BasicGithubResource(
                    organization: "LiveUI", 
                    repository: "YourRepo", 
                    branch: "master", 
                    path: "Resources/email-template.leaf", 
                    destinationPath: "Resources/email-template.leaf" // Where to install the file to
               )
try ResourcesManager.default.add(resource)
```

### String resource

```swift
import Configure

// Create a string resource
let template = """
Hi #(user.firstname) #(user.lastname)

This is an email template for you

Bye,

LiveUI team!
"""
let resource = template.asResource(destination: "Resources/email-template.leaf")
try ResourcesManager.default.add(resource)
```

### Run the installer

And when you are ready, run the installer

```swift
try ResourcesManager.default.run()
```

### Further convenience methods

There is a plenty convenience methods to help you create your templates like the one previously mentioned `asResource` on a string. There is one for a URL, an array or URL's and strings.

### Custom resource installers

You can also create your own completely custom installers very easily by using one of the premade protocols, imagine something like this:

```swift
public struct ModelResource<T>: Resource where T: Codable {

    /// Your model which conforms to Codable
    public let model: T

    /// Where the final file will be saved
    public let destinationPath: String

    /// Make the resource to be rewritten every time it runs
    public var alwaysOverride: Bool {
        return true
    }

    /// Converting to data
    public func data() throws -> Data {
        let data = try JSONEncoder().encode(model)
        return data
    }

    /// Intializer
    public init(model: T, destinationPath: String) {
        self.model = model
        self.destinationPath = destinationPath
    }

}
```

## Use with Vapor 3

This package has no dependencies on purpose so a little trick to get into your `Resources` folder on Vapor 3 just give the Resource a `destination` that could be made somehow like this:

```swift
extension Request {
    /// Gives absolute path URL for the Resources folder
    var resourcesUrl: URL {
        let config = DirectoryConfig.detect()
        var url: URL = URL(fileURLWithPath: config.workDir).appendingPathComponent("Resources")
        return url
    }
}
```

## Support

Join our [Slack](http://bit.ly/2B0dEyt), channel <b>#help-boost</b> to ... well, get help :) 

## Boost AppStore

Core package for <b>[Boost](http://www.boostappstore.com)</b>, a completely open source enterprise AppStore written in Swift!
- Website: http://www.boostappstore.com
- Github: https://github.com/LiveUI/Boost

## Other core packages

* [BoostCore](https://github.com/LiveUI/BoostCore/) - AppStore core module
* [ApiCore](https://github.com/LiveUI/ApiCore/) - API core module with users and team management
* [MailCore](https://github.com/LiveUI/MailCore/) - Mailing wrapper for multiple mailing services like MailGun, SendGrig or SMTP (coming)
* [DBCore](https://github.com/LiveUI/DbCore/) - Set of tools for work with PostgreSQL database
* [VaporTestTools](https://github.com/LiveUI/VaporTestTools) - Test tools and helpers for Vapor 3

## Code contributions

We love PR’s, we can’t get enough of them ... so if you have an interesting improvement, bug-fix or a new feature please don’t hesitate to get in touch. If you are not sure about something before you start the development you can always contact our dev and product team through our Slack.

## Author

Ondrej Rafaj (@rafiki270 on [Github](https://github.com/rafiki270), [Twitter](https://twitter.com/rafiki270), [LiveUI Slack](http://bit.ly/2B0dEyt) and [Vapor Slack](https://vapor.team/))

## License

See the LICENSE file for more info.

