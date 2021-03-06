
// NanorepUI version number: v3.8.10 

// ===================================================================================================
// Copyright © 2018 bold360ai(LogMeIn).
// Bold360AI SDK.
// All rights reserved.
// ===================================================================================================

#import <UIKit/UIKit.h>
#import <BoldAIEngine/BoldAIEngine.h>

@interface NRGroupTableViewCell : UITableViewCell
@property (nonatomic) NRFAQGroup *group;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) UIImage *icon;
@end
