/**
 *  LAShell.m
 *  Lattice
 *
 *  Created by zhang hailong on 14-1-10.
 *  Copyright 9vteam 2014年. All rights reserved.
 */

#import "LAShell.h"


@implementation LAShell

@synthesize appDBContext = _appDBContext;
@synthesize beaconKey = _beaconKey;
@synthesize deviceSet = _deviceSet;

-(id) init{
    if((self = [super initWithConfig:[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cfg" ofType:@"plist"]] bundle:nil])){
        
    }
    return self;
}

-(BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    NSLog(@"%@",NSHomeDirectory());
    
    [_window setRootViewController:self.rootViewController];
    [_window makeKeyAndVisible];
    
    self.beaconKey = @"";
    self.deviceSet = [NSMutableSet set];

    [_beaconMonitor startRangingForBeacons];
    [_beaconMonitor startAdvertisingBeacon];
    
    return YES;
}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application{
    [self didReceiveMemoryWarning];
}

-(void) applicationDidEnterBackground:(UIApplication *)application{
    [self didReceiveMemoryWarning];
}


-(VTDBContext *) appDBContext{
    if(_appDBContext == nil){
        
        VTSqlite * db = [[VTSqlite alloc] initWithPath:[NSHomeDirectory() stringByAppendingPathComponent:@"Documents/app.db"]];
        
        _appDBContext = [[VTDBContext alloc] init];
        [_appDBContext setDb:db];
        
        for(id item in [self.config valueForKey:@"app-db"]){
            
            Class clazz = NSClassFromString(item);
            
            if(clazz){
                [_appDBContext regDBObjectClass:clazz];
            }
            
        }
    }
    return _appDBContext;
}

- (void)setDeviceSet:(NSMutableSet*)deviceSet {
    if (![_deviceSet isEqualToSet:deviceSet]) {
        NSLog(@"device change:%@",deviceSet);
        _deviceSet = deviceSet;
        [[NSNotificationCenter defaultCenter] postNotificationName:LALatticeObjectChangedNotification object:nil userInfo:nil];
    }
}

@end
