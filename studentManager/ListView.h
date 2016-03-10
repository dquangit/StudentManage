//
//  listView.h
//  studentManager
//
//  Created by DQuang on 3/4/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
//#import "Header.h"
//NSMutableArray *_listSV;
@protocol sendData <NSObject>
-(void)sendDataToA:(NSMutableArray *)array;
@end

@interface listView : UIViewController
//@property NSArray* listSV;
@property NSMutableArray *listSV;
@property int indexSelected;
@property NSInteger count;
@property (strong, nonatomic) IBOutlet UILabel *counter;
@property (strong, nonatomic) IBOutlet UITextField *fullName;
@property (strong, nonatomic) IBOutlet UITextField *birth;
@property (strong, nonatomic) IBOutlet UITextField *diemVan;
@property (strong, nonatomic) IBOutlet UITextField *diemToan;
@property (strong, nonatomic) IBOutlet UITextField *diemLy;
@property (strong, nonatomic) IBOutlet UITextField *diemSu;
- (IBAction)btnFirst:(id)sender;
- (IBAction)btnPrevious:(id)sender;
- (IBAction)btnNext:(id)sender;
- (IBAction)btnLast:(id)sender;
- (IBAction)btnDelete:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
- (void)showInformationOfIndex:(int)index;
@property (nonatomic,assign)id delegate;


@end
