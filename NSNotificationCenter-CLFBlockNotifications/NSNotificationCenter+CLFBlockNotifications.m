//
//  NSNotificationCenter+CLFBlockNotifications.m
//  
//
//  Created by Chris Flesner on 4/23/13.
//  Copyright (c) 2013 Chris Flesner
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
//  documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of
//  the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO
//  THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
//  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#import "NSNotificationCenter+CLFBlockNotifications.h"


@implementation NSNotificationCenter (CLFBlockNotifications)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Adding Observers

- (void)addObserverAtAddress:(id __strong *)observerAddress
                     forName:(NSString *)name
                      object:(id)object
                       queue:(NSOperationQueue *)queue
                  usingBlock:(void (^)(NSNotification *))block
{
    *observerAddress = [self addObserverForName:name object:object queue:queue usingBlock:block];
}


- (void)addObserverAtAddress:(id __strong *)observerAddress
                     forName:(NSString *)name
                      object:(id)object
                  usingBlock:(void (^)(NSNotification *))block
{
    [self addObserverAtAddress:observerAddress forName:name object:object queue:nil usingBlock:block];
}


- (void)addObserverAtAddress:(id __strong *)observerAddress
                     forName:(NSString *)name
                       queue:(NSOperationQueue *)queue
                  usingBlock:(void (^)(NSNotification *))block
{
    [self addObserverAtAddress:observerAddress forName:name object:nil queue:queue usingBlock:block];
}


- (void)addObserverAtAddress:(id __strong *)observerAddress
                     forName:(NSString *)name
                  usingBlock:(void (^)(NSNotification *))block
{
    [self addObserverAtAddress:observerAddress forName:name object:nil queue:nil usingBlock:block];
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Removing Observers

- (void)removeObserverAtAddress:(id __strong *)observerAddress
{
    [self removeObserver:*observerAddress];
    *observerAddress = nil;
}

@end
