# Just a quick example of how to make a Swift Package that includes a library target in C++ and a Swift target that calls into that library C++ code

_**UPDATE**_:  This (threelayer) branch now has more layers of Swift before the C++

It has three Swift layers and a base C++ layer.
(“->” means depends on and calls into):

Swift Executable (“testCmd”) -> Swift lib (“SwiftMurmurLib”) -> Swift lib (“MurmurTest”) -> C++ lib (“Murmur”)

I had to add `swiftSettings: [.interoperabilityMode(.Cxx)]` to each Swift target above the C++ target all the way up the chain of target dependencies to the final executable.   ¯\_(ツ)_/¯
Kind of makes sense since each one needs to support C++ interoperability to be able to use the one below it in the chain.

---

A developer on Mastodon posted a query:

> I want to use some C++ code from a Swift Package, so I:
> 
> 1) Added a target with the C++ code
> 2) Added an umbrella header
> 3) Added this new target as a dependency to the client target
> 4) Import the new module in the client target
> 
>But now when I try to call a C++ function, which I can autocomplete to, the linker throws “Undefined symbol”.

I’d never done this before so I thought I’d take a look. The definitive documentation I could find seemed to be “Setting up Mixed-Language Swift and C++ Projects” on Swift.org.

The poster on Mastodon wanted to use a couple of C++ files from https://github.com/aappleby/smhasher/tree/master, specifically MurmurHash3.h / MurmurHash3.cpp. Not really sure what this repo is all about, but I grabbed those files and played around some.

Got it linking and executing without crashing :) and you can see a test repo here in this repo.
(ignore the hacky Swift code trying to make some test parameters to call the C++ `MurmurHash3_…` function with; not sure what this function is really expecting but I was just trying to solve the linking issue the poster was running into.)

The key to getting this to work is the addition of:

`swiftSettings: [.interoperabilityMode(.Cxx)])`

on the target that is going to use the C++ containing target.

(Repo was tested with Xcode 16.2, macOS 14.7.5).
