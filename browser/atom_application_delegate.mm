// Copyright (c) 2013 GitHub, Inc. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#import "browser/atom_application_delegate.h"

#import "browser/atom_application.h"

@implementation AtomApplicationDelegate

- (void)applicationDidFinishLaunching:(NSNotification*)notify {
  NSAppleEventManager* em = [NSAppleEventManager sharedAppleEventManager];
  [em setEventHandler:self
          andSelector:@selector(handleQuitEvent:withReplyEvent:)
        forEventClass:kCoreEventClass
           andEventID:kAEQuitApplication];
}

- (void)handleQuitEvent:(NSAppleEventDescriptor*)event
         withReplyEvent:(NSAppleEventDescriptor*)replyEvent {
  [[AtomApplication sharedApplication] closeAllWindows:self];
}

@end