//
//  ViewController.m
//  studentManager
//
//  Created by DQuang on 3/4/16.
//  Copyright © 2016 Rasia Ltd. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "ViewController.h"
#import "ListView.h"
#import "HighestScoreView.h"
#import "TableListView.h"
#import "Student.h"

NSInteger count;
UIStoryboard        *storyboard;
listView            *listViewController;
highestScoreView    *highestScoreViewColler;
tableListView       *tableListViewController;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    [self initVariable];
    [self cocau];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dismissKeyboard {
    [_fullName resignFirstResponder];
    [_birth resignFirstResponder];
    [_diemToan resignFirstResponder];
    [_diemLy resignFirstResponder];
    [_diemSu resignFirstResponder];
    [_diemVan resignFirstResponder];
}
- (IBAction)btnSave:(id)sender {
    if ([self checkStatement]) {
    [self getData];
        
    }
}
//
//- (IBAction)btnHightestScore:(id)sender {
//}

//- (IBAction)btnListView:(id)sender {
//}

-(void)initVariable {
    _listSV                         = [[NSMutableArray alloc] init];
    listViewController.listSV       = [[NSMutableArray alloc] init];
    highestScoreViewColler.listSV   = [[NSMutableArray alloc] init];
    tableListViewController.listSV  = [[NSMutableArray alloc] init];
    listViewController.indexSelected = 0;
    count = 0;
    storyboard                      = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    listViewController              = [storyboard instantiateViewControllerWithIdentifier:@"listView"];
    highestScoreViewColler          = [storyboard instantiateViewControllerWithIdentifier:@"highestScoreView"];
    tableListViewController         = [storyboard instantiateViewControllerWithIdentifier:@"tableListView"];
    [_fullName becomeFirstResponder];
    
}


-(void)getData {
    count++;
    _lblNoti.text                   = [NSString stringWithFormat:@"Đã lưu thành công %d sinh viên",count];
    NSMutableDictionary *student   = [NSMutableDictionary dictionaryWithDictionary:@{@"fullname"   : _fullName.text,
                                                                                    @"birth"        : _birth.text,
                                                                                    @"diemvan"      : [NSNumber numberWithFloat:[_diemVan.text floatValue]],
                                                                                    @"diemtoan"     : [NSNumber numberWithFloat:[_diemToan.text floatValue]],
                                                                                    @"diemly"       : [NSNumber numberWithFloat:[_diemLy.text floatValue]],
                                                                                    @"diemsu"       : [NSNumber numberWithFloat:[_diemSu.text floatValue]]
                                                                                      }];
//    Student *student = [[Student alloc] init];
//    [student setFullname:_fullName.text];
//    [student setBirthDate:_birth.text];
//    [student setDiemToan:[_diemToan.text floatValue] ];
//    [student setDiemVan:[_diemVan.text floatValue]];
//    [student setDiemLy:[_diemLy.text floatValue]];
    [_listSV addObject:student];
    _fullName.text = nil;
    _diemLy.text = nil;
    _birth.text = nil;
    _diemToan.text = nil;
    _diemSu.text = nil;
    _diemVan.text = nil;
    NSLog(@"%d",[_listSV count]);
}
-(BOOL)checkStatement {
    if (_fullName.text.length <= 4 ||
        _fullName.text.length >= 100) {
        [self showError:@"Họ và tên phải nhiều hơn 4 ký tự và ít hơn 100 ký tự"];
        return NO;
    }
    if (!([self checkMark:_diemVan] &&
        [self checkMark:_diemToan]  &&
        [self checkMark:_diemLy]    &&
        [self checkMark:_diemSu])) {
        [self showError:@"Điểm số phải nằm trong khoảng từ 0 đến 10"];
        return NO;
    }
    return YES;
}
-(void)showError:(NSString*)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lỗi"
                                                    message:error
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

-(BOOL)checkMark:(UITextField *)mark {
    if ([mark.text floatValue] < 0 || [mark.text floatValue] > 10) {
        return NO;
    }
    return YES;
}
- (IBAction)btnListView:(id)sender {
    listViewController.listSV       = [NSMutableArray arrayWithArray:_listSV];
    listViewController.delegate     = self;
    [self.navigationController pushViewController:listViewController animated:YES];
}

- (IBAction)btnListSV:(id)sender {
    tableListViewController.listSV = [NSMutableArray arrayWithArray:_listSV];
    tableListViewController.delegate = self;
    [self.navigationController pushViewController:tableListViewController animated:YES];

}
- (IBAction)btnHightestScore:(id)sender {
    highestScoreViewColler.listSV = [NSMutableArray arrayWithArray:_listSV];
    [self.navigationController pushViewController:highestScoreViewColler animated:YES];
}
- (void)cocau{

    NSMutableDictionary *tmp1 = [NSMutableDictionary dictionaryWithDictionary:@{@"fullname":@"Quang Pham",
                                  @"birth"      : @"12/06/94",
                                  @"diemtoan"   : [NSNumber numberWithFloat:10.0],
                                  @"diemly"     : [NSNumber numberWithFloat:5.0],
                                  @"diemsu"     : [NSNumber numberWithFloat:6.0],
                                  @"diemvan"    : [NSNumber numberWithFloat:7.0]}];
    
    NSMutableDictionary *tmp2 = [NSMutableDictionary dictionaryWithDictionary:@{@"fullname":@"Dung Thuy",
                                  @"birth"      : @"15/09/90",
                                  @"diemtoan"   : [NSNumber numberWithFloat:9.0],
                                  @"diemly"     : [NSNumber numberWithFloat:10.0],
                                  @"diemsu"     : [NSNumber numberWithFloat:7.0],
                                  @"diemvan"    : [NSNumber numberWithFloat:6.0]}];
    NSMutableDictionary *tmp3 = [NSMutableDictionary dictionaryWithDictionary:@{@"fullname":@"Ha Giang",
                                  @"birth"      : @"19/06/94",
                                  @"diemtoan"   : [NSNumber numberWithFloat:6.0],
                                  @"diemly"     : [NSNumber numberWithFloat:7.0],
                                  @"diemsu"     : [NSNumber numberWithFloat:8.0],
                                  @"diemvan"    : [NSNumber numberWithFloat:9.0]}];
    NSMutableDictionary *tmp4 = [NSMutableDictionary dictionaryWithDictionary: @{@"fullname":@"Steven Jobs",
                                  @"birth"      : @"19/08/80",
                                  @"diemtoan"   : [NSNumber numberWithFloat:10.0],
                                  @"diemly"     : [NSNumber numberWithFloat:9.0],
                                  @"diemsu"     : [NSNumber numberWithFloat:9.0],
                                  @"diemvan"    : [NSNumber numberWithFloat:9.0]}];
    NSMutableDictionary *tmp5 = [NSMutableDictionary dictionaryWithDictionary:@{@"fullname":@"Bill Gate",
                                  @"birth"      : @"18/09/82",
                                  @"diemtoan"   : [NSNumber numberWithFloat:9.0],
                                  @"diemly"     : [NSNumber numberWithFloat:9.0],
                                  @"diemsu"     : [NSNumber numberWithFloat:6.0],
                                  @"diemvan"    : [NSNumber numberWithFloat:7.0]}];
    [_listSV addObjectsFromArray:[NSArray arrayWithObjects:
                                  tmp1,     tmp2,
                                  tmp3,     tmp4,
                                  tmp5,     nil]];
    NSLog(@"co cau: %d",[_listSV count]);
}

-(void)sendDataToA:(NSMutableArray *)array {
    
    [_listSV removeAllObjects];
    _listSV = [NSMutableArray arrayWithArray:array];
    NSLog(@"%d",[_listSV count]);
}

@end
