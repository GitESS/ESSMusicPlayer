//
//  SecondViewController.h
//  ESSAppLink
//  Log View To Check ALE/TDK Request & Response
//  Created by essadmin on 10/9/13.
//  Copyright (c) 2013 essadmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMConsoleController.h"

@interface SecondViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,FMDebugToolConsole>
{
    NSMutableArray *logArray;
    FMConsoleController *consoleController; // Console View Controller For Log View
    
}
@property (weak, nonatomic) IBOutlet UITableView *logTabbleView;

@end
