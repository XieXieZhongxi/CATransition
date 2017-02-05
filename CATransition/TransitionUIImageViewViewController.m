//
//  TransitionUIImageViewViewController.m
//  CATransition
//
//  Created by Zhongxi on 2017/2/5.
//  Copyright © 2017年 zhongxi. All rights reserved.
//

#import "TransitionUIImageViewViewController.h"
#import "CALayer+transition.h"
@interface TransitionUIImageViewViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray * optionsArray;
    NSInteger selectedIndex;
    NSInteger imageIndex;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation TransitionUIImageViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    optionsArray = @[@"fade",@"push",@"moveIn",@"reveal",@"cube",@"oglFlip",@"suckEffect",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"];
}
- (IBAction)transitionAction:(id)sender {
    [self.imageView.layer addAnimationDuration:0.25 type:(CATransitionType)selectedIndex subtype:(CATransitionSubtype)self.segmentedControl.selectedSegmentIndex];
    if (imageIndex == 5) {
        imageIndex = 0;
    }else{
        imageIndex++;
    }
    self.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"image_%ld.jpg",imageIndex]];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedIndex = indexPath.row;
    [tableView reloadData];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = optionsArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row == selectedIndex) {
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        label.text = @"✓";
        label.textColor = [UIColor whiteColor];
        cell.accessoryView = label;
    }else{
        cell.accessoryView = nil;
    }
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return optionsArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
