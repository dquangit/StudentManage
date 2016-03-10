//
//  highestScoreView.h
//  studentManager
//
//  Created by DQuang on 3/4/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface highestScoreView : UIViewController
@property NSMutableArray *listSV;
@property (strong, nonatomic) IBOutlet UITextField *fullName;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UITextField *score;
- (IBAction)diemVan:(id)sender;
- (IBAction)diemToan:(id)sender;
- (IBAction)diemSu:(id)sender;
- (IBAction)diemLy:(id)sender;

@end
