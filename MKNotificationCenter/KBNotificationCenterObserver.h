//
//  KBNotificationCenterObserver.h
//  WeiSh
//
//  Created by xulingjiao on 2017/10/30.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//


#import "KBNotificationCenterObserverProtocol.h"

@interface KBNotificationCenterObserver : NSObject<KBNotificationCenterObserverProtocol>

- (instancetype)initWithObserver:(id<KBNotificationCenterObserverProtocol>)observer;

@end
