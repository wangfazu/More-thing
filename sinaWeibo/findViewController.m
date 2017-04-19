//
//  findViewController.m
//  sinaWeibo
//
//  Created by app on 17/4/13.
//  Copyright © 2017年 Feizj. All rights reserved.
//

#import "findViewController.h"

@interface findViewController ()

@end

@implementation findViewController
{
    
    UIScrollView *hotOrStarView;
    UITableView *hotTableView ;
    UITableView *starTableView ;
    NSArray *arr;
}
/**
 *  在视图即将加载的时候，隐藏findViewController的navigationBar上面的所有东西，包括文字
 */
- (void)viewWillAppear:(BOOL)animated{
   
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden=YES;
    
    self.tabBarController.tabBar.hidden=NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"发现";
    
    /**
     通过BUtton来进入hotView，或者starView
     */
    UIButton *hotBtn = [[UIButton alloc]initWithFrame:CGRectMake(w/2-60, 10, 40, 40)];
    //hotBtn.backgroundColor = [UIColor purpleColor];
    [hotBtn setTitle:@"热门" forState:normal];
    [self.view addSubview:hotBtn];
    [hotBtn addTarget:self action:@selector(goToHotView) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *starBtn = [[UIButton alloc]initWithFrame:CGRectMake(w/2+30, 10, 40, 40)];
    //starBtn.backgroundColor = [UIColor redColor];
    [starBtn setTitle:@"明星" forState:normal];
    [self.view addSubview:starBtn];
    [starBtn addTarget:self action:@selector(goToStarView) forControlEvents:UIControlEventTouchUpInside];
    /**
     *  初始化UIScrollView
     */
    hotOrStarView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, w, h)];
    hotOrStarView.backgroundColor = [UIColor purpleColor];
    hotOrStarView.contentSize = CGSizeMake(2*w, h);
    [self.view addSubview:hotOrStarView];
    /**
      测试UIScrollView是否可行的lab
     */
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 88, 100)];
    lab.backgroundColor= [UIColor whiteColor];
    [hotOrStarView addSubview:lab];
    /**
     *初始化，已经创建的hotTableView &  starTableView
     */
    hotTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, w, h) style:UITableViewStyleGrouped];
    hotTableView.delegate = self;
    hotTableView.dataSource = self;
    [hotOrStarView addSubview:hotTableView];
    /**
     *  初始化
     *
     *
     */
    starTableView = [[UITableView alloc]initWithFrame:CGRectMake(w, 0, w, h) style:UITableViewStyleGrouped];
    starTableView.delegate = self;
    starTableView.dataSource = self;
    [hotOrStarView addSubview:starTableView];
    
    
    


}
- (void)goToHotView{//通过UIScrollView 偏移量进入hotView
//    hotViewController *hotView = [[hotViewController alloc]init];
//    [self presentViewController:hotView animated:YES completion:nil];
    
    [UIView animateWithDuration:0.75 animations:^{
          hotOrStarView.contentOffset = CGPointMake(0, 0);
    }];
}
- (void)goToStarView{////通过UIScrollView 偏移量进入starView
    /**
     *  用动画效果来实现，动画效果
     */
    [UIView animateWithDuration:0.75 animations:^{
        hotOrStarView.contentOffset = CGPointMake(w, 0);
    }];
}
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        UILabel *useID = [[UILabel alloc]initWithFrame:CGRectMake(w/4, 10, w/2, h/20)];
        [cell addSubview:useID];
        useID.text = @"海贼王";
        useID.textColor = [UIColor redColor];
       // useID.backgroundColor = [UIColor blackColor];
        UILabel *usePushTime = [[UILabel alloc]initWithFrame:CGRectMake(w/4, 10+h/19, w/4, h/20)];
        [cell addSubview:usePushTime ];
        
        
      NSDate *nowdate =  [NSDate dateWithTimeIntervalSince1970:19990909];
        NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
        NSString *formatterString = @"yyyy-MM-dd HH:mm:ss";
        [formatter2 setDateFormat:formatterString];
        NSString *returnString = [formatter2 stringFromDate:nowdate];
//        NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
//        [formatter2 setDateFormat:formatterString];
//        NSString *returnString = [formatter2 stringFromDate:date];
        usePushTime.text = returnString;
        usePushTime.textColor = [UIColor blackColor];
        //usePushTime.backgroundColor = [UIColor blackColor];
        UILabel *useFrom = [[UILabel alloc]initWithFrame:CGRectMake(w/2+2, 10+h/19, w/4, h/20)];
        [cell addSubview:useFrom];
        useFrom.text = @"from China";
        useFrom.textColor = [UIColor blackColor];
        usePushTime.font = [UIFont systemFontOfSize:9];
        //useFrom.backgroundColor = [UIColor blackColor];
    }
    
    
    UIButton *headBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, w/6, h/10)];
    
    /**
     *  为 headBtn 添加 图片 通过[UIImage imageNamed:@"tx"] 这种格式来电用，因为 [UIImage imageNamed:@"tx"] 方法，返回一个一个 Image 的对象
     */
    [headBtn setImage:[UIImage imageNamed:@"tx"]  forState:normal];
    headBtn.layer.cornerRadius = h/20 ;
    headBtn.clipsToBounds = YES;
    [cell addSubview:headBtn];
    cell.selectionStyle = UITableViewCellStyleDefault;
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /**
     *  定义表格中没一个CELL的高度
     */
    return h*3/5;
}

- (void)btttnClick:(UIButton *)btn{
    
    /**
     *  index所得到的是 tag 所对应的那个 button
     */

    NSInteger index=btn.tag-1000;
    /**
     初始化：热门人物，特别推荐，娱乐明星，当地名人这四个页面
     并在 navigationController 中进行 push操作，向右弹出相应的界面，自带返回方法
     */
    hotPeopleViewController *hotPeopleView = [[hotPeopleViewController alloc ]init];
    specialRecommendViewController *specialRecommendView = [[specialRecommendViewController alloc]init];
    amusementStarViewController *amusementStarView = [[amusementStarViewController alloc]init];
    localFamousPersonViewController *localFamousPersonView = [[localFamousPersonViewController alloc]init];
    /**
     *  通过 switch 来对 index 所对应的 button 进行事件点击相应
     0=> 热门人物
     1=> 特别推荐
     2=> 娱乐明星
     3=> 当地名人
      */

    switch (index) {
        case 0:
            [self.navigationController pushViewController:hotPeopleView animated:YES];
            break;
            
        case 1:
            [self.navigationController pushViewController:specialRecommendView animated:YES];

            break;
        case 2:
            [self.navigationController pushViewController:amusementStarView animated:YES];

            break;
        case 3:
            [self.navigationController pushViewController:localFamousPersonView animated:YES];

            break;
            
        default:
            break;
    }
        NSLog(@"你点击了第%ld个按钮",index);
    
    
    

}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == starTableView) {
        for (int i = 0; i<4; i++) {
            /**
              创建四个 Button 分别对应 “热门人物，特别推荐，娱乐明星，当地名人”
             */
            UIButton *btttn = [[UIButton alloc]initWithFrame:CGRectMake(14+w/4*i, 44, 70, 70)];
            btttn.backgroundColor = [UIColor redColor];
            btttn.tag=1000+i;
            [btttn addTarget:self action:@selector(btttnClick:) forControlEvents:UIControlEventTouchUpInside];
            [tableView addSubview:btttn];
            /**
             创建 四个 lab 分别为 “热门人物，特别推荐，娱乐明星，当地名人”
             */
            UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(14+w/4*i, 44+70+10, 70, 30)];
            //lab.backgroundColor = [UIColor greenColor];
            lab.tag = 2000 + i;
            [tableView addSubview:lab];
            NSArray *arr = @[@"热门人物",@"特别推荐",@"娱乐明星",@"当地名人"];
            lab.text = arr[i];
          
            }
     }
    if (tableView == hotTableView) {
        /**
         创建 button 分别 i = 0~3 对应最热门的 四个话题， 话题可以从微博直接获取
         */
        
        for (int i=0; i<4; i++) {
            /**
             i = 0,1,2,3
             i%2 = 0,1,0,1
             i/2 = 0,0.5,1,1.5
             一个最简单的算法，取余运算！！！
             */
            UIButton *btnnn1 = [[UIButton alloc]initWithFrame:CGRectMake(3.5+(7+w/2-7+7)*(i%2), 44+(7+30)*(i/2), w/2, 30)];
            /**
             *  将 btnnn1 上的字体颜色，更改为 黑色，系统默认为：白色；
             */
            [btnnn1 setTitleColor:[UIColor blackColor] forState:normal];
            btnnn1.tag=300+i;
            [btnnn1 addTarget:self action:@selector(goToHotTopicalDetialViewClick:) forControlEvents:UIControlEventTouchUpInside];
              arr = @[@"#朗读者王源#",@"#咸鱼如我#",@"#徐海乔生日快乐#",@"更多热门话题"];
            [btnnn1 setTitle:arr[i] forState:normal];
            [tableView addSubview:btnnn1];
        }
        
      
        
        
        
        
    }
    
    
    /**
     *  创建搜索框
     */
    UITextField *serchView = [[UITextField alloc]initWithFrame:CGRectMake(7, 7, w-14, 30)];
    serchView.placeholder = @"请输入你想要搜索的内容";
    serchView.backgroundColor = [UIColor whiteColor];
    [tableView addSubview:serchView];

    
    if (tableView==hotTableView) {
        return  120;
    }
    
    return  160;
}

- (void)goToHotTopicalDetialViewClick:(UIButton *)btn{
    NSInteger index = btn.tag-300;
    hotTopicDetailViewController *hotTopicDetailView = [[hotTopicDetailViewController alloc]init];
    /**
     *  将 arr 数组里面的东西，通过 array 这个数组传递到 hotTopicDetailView 中，hotTopicDetailView界面中就可以使用里面的内容了
     */
    hotTopicDetailView.array= arr[index];
    [self.navigationController pushViewController:hotTopicDetailView animated:YES];
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
