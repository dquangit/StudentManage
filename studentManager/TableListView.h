//
//  tableListView.h
//  studentManager
//
//  Created by DQuang on 3/6/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@protocol sendData <NSObject>
- (void)sendDataToA:(NSMutableArray *)array;
@end

@interface tableListView : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet TableViewCell *tableView;
@property NSMutableArray *listSV;
@property (strong, nonatomic) IBOutlet UITableView *tableListView;
@property (strong, nonatomic) IBOutlet UILabel *lblTittle;
- (IBAction)diemToan:(id)sender;
- (IBAction)diemLy:(id)sender;
- (IBAction)diemVan:(id)sender;
- (IBAction)diemSu:(id)sender;
@property (nonatomic,assign)id delegate;

@end
