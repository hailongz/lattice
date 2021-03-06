//
//  LAContainerViewController.h
//  Lattice
//
//  Created by zhang hailong on 14-1-10.
//  Copyright (c) 2014年 9vteam. All rights reserved.
//

#import "LALatticeViewController.h"

#import "LAContainerDataController.h"

@interface LAContainerViewController : LALatticeViewController<IVTUplinkTaskDelegate,LAContainerDataControllerDelegate>

@property (strong, nonatomic) IBOutlet VTStatusView * statusView;
@property (strong, nonatomic) IBOutlet LAContainerDataController *listController;
@property (strong, nonatomic) IBOutlet LAContainerDataController *fallsController;
@property (strong, nonatomic) IBOutlet LAContainerDataController *boardController;
@property (strong, nonatomic) IBOutlet VTContainerView *containerView;


@end
