//
//  ViewController.m
//  CATransition
//
//  Created by Zhongxi on 2017/2/5.
//  Copyright © 2017年 zhongxi. All rights reserved.
//

#import "ViewController.h"
#import "TransitionFromViewController.h"
#import "TransitionUIImageViewViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *optionsTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"CATransition";
    [self.navigationController.navigationBar setTranslucent:NO];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    if (indexPath.row == 0) {
        cell.textLabel.text = @"UIViewController";
    }else{
        cell.textLabel.text = @"UIImageView";
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        TransitionFromViewController * transitionFormVC = [[TransitionFromViewController alloc]init];
        [self.navigationController pushViewController:transitionFormVC animated:YES];
    }else{
        TransitionUIImageViewViewController * transitionUIImageViewVC = [[TransitionUIImageViewViewController alloc]init];
        [self.navigationController pushViewController:transitionUIImageViewVC animated:YES];
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
