# MKNotificationCenter

Installation by Carthage:

1.Add github "tsingbx/MKNotificationCenter" to your Cartfile.

2.Run carthage update --platform ios and add the framework to your project.

3.Import <MKNotificationCenter/MKNotificationCenter.h>.


Usage sample:

@interface KBRootViewController ()<KBNotificationCenterObserverProtocol>

@property (nonatomic, strong) KBNotificationCenterObserver* observer;

@end

@implementation KBRootViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
    self.observer = [[KBNotificationCenterObserver alloc] initWithObserver:self];
    
}

- (void)onBack {
    
    //when tap the back button of UINavigationBar, set it to nil to remove observer.
    
    self.observer = nil;
    
}

- (NSArray<NSString *> *)myInterestedNotificationNames {

    return @[UIDeviceOrientationDidChangeNotification];
    
}

- (void)handleNotification:(NSNotification *)note {

    if ([note.name isEqualToString:UIDeviceOrientationDidChangeNotification]) {
    
        //todo
        
    }
    
}

- (void)dealloc {
    
    self.observer = nil;
    
}

@end



