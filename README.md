NSNotificationCenter-CLFBlockNotifications
==========================================

A category on NSNotificationCenter to make creating notifications with blocks a little cleaner.

## Motivation
If you're like me, you prefer to set up your notifications using blocks instead of selectors. Although I prefer this method, I wanted a little cleaner syntax than having to use:
```objective-c
self.myNotificationObserver = [[NSNotificationCenter defaultCenter] addObserverForName:MyNotificationName
												 					    		object:nil
												   								 queue:nil
																    		usingBlock:^(NSNotification *note) {
    [self doSomethingAboutIt];
}];
```

So I created this category to clean it up a little bit. Now the same notification can be registered like this:
```objective-c
[[NSNotificationCenter defaultCenter] addObserverAtAddress:&_myNotificationObserver
												   forName:MyNotificationName
												usingBlock:^(NSNotification *note) {
    [self doSomethingAboutIt];
}];
```

There are also methods to register for notifications with an object, with a queue, or with both.


## Example Usage
```objective-c
@interface FooViewController ()
{
	_id myNotificationObserver;
}

@end


@interface FooViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserverAtAddress:&_myNotificationObserver
    												   forName:MyNotificationName
    											    usingBlock:^(NSNotification *note) {
        [self doSomethingAboutIt];
    }];
    // _myNotificationObserver is now set
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserverAtAddress:&_myNotificationObserver];
    // _myNotificationObserver is now nil
}


- (void)doSomethingAboutIt
{
   NSLog(@"Noted.");
}
@end

```

## License Info
Released under an MIT License.

Copyright (c) 2013 Chris Flesner

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
