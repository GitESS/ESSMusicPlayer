//  ConsoleViewController.h
//  AppLinkTester
//  Copyright (c) 2012 Ford Motor Company. All rights reserved.

#import <UIKit/UIKit.h>
#import "FMConsoleController.h"

@interface ConsoleViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,FMDebugToolConsole> {
    UITableView* consoleView;
    FMConsoleController *consoleController;
    
    
}

@property (nonatomic, retain) IBOutlet UITableView* consoleView;


@end
