//
//  ViewController.h
//  studentManager
//
//  Created by DQuang on 3/4/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "listView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *fullName;
@property (strong, nonatomic) IBOutlet UITextField *birth;
@property (strong, nonatomic) IBOutlet UITextField *diemVan;
@property (strong, nonatomic) IBOutlet UITextField *diemToan;
@property (strong, nonatomic) IBOutlet UITextField *diemLy;
@property (strong, nonatomic) IBOutlet UITextField *diemSu;
@property (strong, nonatomic) IBOutlet UILabel *lblNoti;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnHightestScore:(id)sender;
//- (IBAction)btnListView:(id)sender;
- (IBAction)btnListView:(id)sender;
- (IBAction)btnListSV:(id)sender;

@property NSMutableArray *listSV;

@end

