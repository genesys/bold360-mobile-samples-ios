
// NanorepUI version number: v3.8.10 

// ===================================================================================================
// Copyright © 2018 bold360ai(LogMeIn).
// Bold360AI SDK.
// All rights reserved.
// ===================================================================================================

#import <Foundation/Foundation.h>

@protocol ChatEventHandler <NSObject>
- (void)handleClickedLink:(NSURL *)link;
- (void)handleEvent:(NSDictionary *)eventParams;
@end