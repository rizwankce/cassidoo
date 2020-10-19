// Given a string that is an HTML-like code snippet, return whether or not the tags are valid.

import Foundation

func htmlValidator(_ html: String) -> Bool {
    var result = true
    var tags: [String] = []

    func verify(_ tag: String,_ push: Bool) {
        if push {
            tags.append(tag)
        }
        else {
            if tag == tags.last {
                tags.popLast()
            }
            else {
                result = false
            }
        }
    }

    var i = html.startIndex
    var tagStratI = html.startIndex
    while i < html.endIndex {
        let c = html[i]
        if c == "<" {
            tagStratI = i
        }
        if c == ">" {
            let start = html.index(after: tagStratI)
            let end = html.index(before: i)
            let tag = String(html[start ... end])
            let push = html[start] != "/"
            if html[end] != "/" {
                verify(tag.replacingOccurrences(of: "/", with: ""), push)
            }
        }

        i = html.index(after: i)
    }

    return result && tags.isEmpty
}

print(htmlValidator("<tag>I love coding <Component />!</tag>"))
print(htmlValidator("<tag>I love coding!</tag>"))
print(htmlValidator("<tag>I love coding!</br></tag>"))
print(htmlValidator("<tag>I love coding!</>"))
print(htmlValidator("<tag>I <tag>love</tag>coding!</tag>"))
print(htmlValidator("<tag>I <tag>love</tag>coding!<tag></tag>"))

