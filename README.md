# KatFacts

This is a demonstration of a simple application that uses a REST API to fetch an image and some data.

KatFacts is written completely in Swift ans the latest SwiftUI. It is targeted for iOS 16.2
and was developed using Xcode 14.2

This is all iOS code and no third party libraries were used in application.

This is build for iPhone in portrait mode.

The code was written so it would not explicitly fail for the user, 
but display a placeholder image and text telling the user to try again.
If the user has viewed images, but then image loading fails fails, the user will continue to be looking
at cached cat images, but the cat fact will default to the regular error text.

This took me about 7 hours to do, of the 2 days. 

The other time was spent on the phone with recruiters or sleeping!


Other things I would do if I had more time

- more error handling and logging of incorrect HTTPResponses
- Make landscape more work by having image and fact side by side
- Make it iPad friendly

Hope you like this.

