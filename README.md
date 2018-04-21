![SwiftResources](https://github.com/LiveUI/SwiftResources/raw/master/Other/logo.png)

##

[![Slack](https://img.shields.io/badge/join-slack-745EAF.svg?style=flat)](http://bit.ly/2B0dEyt)
[![Jenkins](https://ci.liveui.io/job/LiveUI/job/SwiftResources/job/master/badge/icon)](https://ci.liveui.io/job/LiveUI/job/SwiftResources/)
[![Platforms](https://img.shields.io/badge/platforms-macOS%2010.13%20|%20Ubuntu%2016.04%20LTS-ff0000.svg?style=flat)](https://github.com/LiveUI/SwiftResources)
[![Swift Package Manager](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/)
[![Swift 4](https://img.shields.io/badge/swift-4.1-orange.svg?style=flat)](http://swift.org)
[![Vapor 3](https://img.shields.io/badge/vapor-3.0-blue.svg?style=flat)](https://vapor.codes)


## What is this even good for?!

Have you ever had an issue with SPM not supporting resources? How do you get your templates, demo files and I don't know what else from your submodules into your app?

Well, I hope **SwiftResources** will make your experience with resource files a tiny bit easier.

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
.package(url: "https://github.com/LiveUI/SwiftResources.git", .branch("master"))
```

## Usage

### Basic usage

```swift
import SwiftResources

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

### Remote resources

```swift
let resource = BasicWebResource(resourceUrl: "http://www.example.com/Resources/email-template.leaf", destinationPath: "Resources/email-template.leaf")
try ResourcesManager.default.add(resource)
```

### Github resources

```swift
let resource = BasicGithubResource(
                    organization: "LiveUI", 
                    repository: "YourRepo", 
                    branch: "master", 
                    path: "Resources/email-template.leaf", 
                    destinationPath: "Resources/email-template.leaf"
               )
try ResourcesManager.default.add(resource)
```

### Run the installer

And when you are ready, run the installer

```swift
try ResourcesManager.default.run()
```

You can obviously run multiple types and whatever amount of files you need

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

SwiftResources is distributed under an Apache 2 license and can be shared or used freely within the bounds of the license itself.
Most third party components used (like Vapor framework and all it’s components) in this software are MIT licensed.
List of all used software is listed in the repository. All components should be available in the dependencies folder.

See the LICENSE file for more info.

