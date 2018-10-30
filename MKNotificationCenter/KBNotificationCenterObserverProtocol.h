//
//  KBNotificationCenterProtocol.h
//  WeiSh
//
//  Created by xulingjiao on 2017/10/20.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol KBNotificationCenterObserverProtocol <NSObject>

- (NSArray<NSString *> *)myInterestedNotificationNames;

@optional
- (void)handleNotification:(NSNotification *)note;

@end
