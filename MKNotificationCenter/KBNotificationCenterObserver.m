//
//  KBNotificationCenterObserver.m
//  WeiSh
//
//  Created by xulingjiao on 2017/10/30.
//  Copyright © 2017年 Kuaibao. All rights reserved.
//

#import "KBNotificationCenterObserver.h"

@interface KBNotificationCenterObserver()

@property (nonatomic, strong) id<KBNotificationCenterObserverProtocol> observer;

@end

@implementation KBNotificationCenterObserver

- (instancetype)initWithObserver:(id<KBNotificationCenterObserverProtocol>)observer {
    self = [super init];
    if (self) {
        _observer = observer;
        [self registerNotificationCenterObserver];
    }
    return self;
}

- (void)registerNotificationCenterObserver {
    NSArray<NSString *> *notificationNames = [self myInterestedNotificationNames];
    for (NSString *notificationName in notificationNames) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:notificationName
                                                      object:nil];
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(handleNotification:)
         name:notificationName
         object:nil];
    }
}

- (void)handleNotification:(NSNotification *)note {
    if ([self.observer respondsToSelector:@selector(handleNotification:)]) {
        [self.observer handleNotification:note];
    }
}

- (void)removeNotificationCenterObserver {
    NSArray<NSString *> *notificationNames = [self myInterestedNotificationNames];
    for (NSString *notificationName in notificationNames) {
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:notificationName
                                                      object:nil];
    }
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSArray<NSString *> *)myInterestedNotificationNames {
    if ([self.observer respondsToSelector:@selector(myInterestedNotificationNames)])
        return [self.observer myInterestedNotificationNames];
    return @[];
}

- (void)dealloc {
    [self removeNotificationCenterObserver];
}

@end
