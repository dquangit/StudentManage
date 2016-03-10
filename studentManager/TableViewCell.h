//
//  TableViewCell.h
//  studentManager
//
//  Created by DQuang on 3/6/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *fullName;
@property (strong, nonatomic) IBOutlet UILabel *info;
@property (strong, nonatomic) IBOutlet UIImageView *medal;

@end
