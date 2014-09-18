namespace :db do
  desc "Fill database with sample data"

  task populate: :environment do
    # adduser
    # addmicropost
    # make_relationships
    # addpianqu
    # addglj
    addTollstation
  end
end
def adduser 
  User.create!(name: "Example User",
               email: "example@railstutorial.org",
               password: "foobar",
               password_confirmation: "foobar")
   User.create!(name: "moyuanming",
               email: "mo_yuan_ming@126.com",
               password: "future",
               password_confirmation: "future")
  10.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name: name,
                 email: email,
                 password: password,
                 password_confirmation: password)  
  end    
end


 def addmicropost 
     users = User.all
    10.times do 
      content = Faker::Lorem.sentence(5)
      users.each { |user| Micropost.create!(content: content,user_id:user.id)}
    end   
  end


def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def  addpianqu

    @alls = Pianqudaima.all 
    @alls.each { |chr| chr.destroy  }

    Pianqudaima.create!(name:"吐鲁番哈密片区"   ,no: "01" ,desc: "");
    Pianqudaima.create!(name:"乌鲁木齐片区 "    ,no: "02" ,desc: "");  
    Pianqudaima.create!(name:"阿勒泰片区  "     ,no: "03" ,desc: "");  
    Pianqudaima.create!(name:"奎屯片区   "      ,no: "04" ,desc: ""); 
    Pianqudaima.create!(name:"库尔勒片区  "     ,no: "05" ,desc: ""); 
    Pianqudaima.create!(name:"喀什片区   "      ,no: "06" ,desc: "");
end
def  addglj

  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"01").id ,name:"哈密局"     ,no:"01" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"01").id  ,name:"吐鲁番局"   ,no:"02" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"02").id ,name:"乌鲁木齐局" ,no:"03" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"02").id ,name:"昌吉局"     ,no:"04" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"03").id ,name:"阿勒泰局"   ,no:"05" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"03").id  ,name:"塔城局"     ,no:"06" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"04").id ,name:"石河子局"   ,no:"07" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"04").id  ,name:"奎屯局"     ,no:"08" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"04").id  ,name:"博乐局"     ,no:"09" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"04").id  ,name:"伊犁局"     ,no:"10" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"05").id ,name:"库尔勒局"   ,no:"11" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"06").id ,name:"阿克苏局"   ,no:"12" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"06").id  ,name:"阿图什局"   ,no:"13" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"06").id  ,name:"喀什局"     ,no:"14" ,desc: "");
  Gljdaima.create!(pianqudaima_id: Pianqudaima.find_by(no:"06").id ,name:"和田局"     ,no:"15" ,desc: "");
end    
def addTollstation
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"头屯河收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"昌吉收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"玛纳斯收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"玛纳斯匝道收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"乌兰乌苏收费站 ")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"沙湾收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"安集海收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"奎屯收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"四棵树收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"托托收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"八家户收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"五台收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"四棵树主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"高泉")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"古尔图")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"托托")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"沙泉子")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"精河敖包")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"精河")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"八十三团")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"大河沿子")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"五台")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"博乐岔口")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "博乐局").id,name:"五台主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"果子沟")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"惠远东")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"惠远东主线")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"六十六团匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"巴彦岱主线")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"达达木图匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"潘津匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"伊宁县匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"伊东工业园匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "伊犁局").id,name:"墩麻扎主线")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"榆树沟")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"玛河")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"安集海东")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"新湖")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"沙门子")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"小拐")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "石河子局").id,name:"恰夏")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"奎屯北")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"乌尔禾收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"乌图布拉克收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"布尔津收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"天北")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"克拉玛依")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"克南主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"西郊匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"克西匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"白碱滩")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"百口泉")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "奎屯局").id,name:"乌尔禾匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"和什托洛盖")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"乌图布拉克")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"巴音托海")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"福海渔场")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"福海匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"阿尔达")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"丰庆湖")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"187团")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"北屯匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"切尔克齐")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"塔斯塔克")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"阿勒泰主线")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"哈图匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "塔城局").id,name:"铁厂沟")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "塔城局").id,name:"S318匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "塔城局").id,name:"额敏东")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "塔城局").id,name:"额敏匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "塔城局").id,name:"团结农场")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "塔城局").id,name:"塔城主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"乌拉泊")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"柴窝堡匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"盐湖")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"小草湖")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"吐鲁番")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"阜康")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"南泉子")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "乌鲁木齐局").id,name:"甘河子")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"克孜哈巴克收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"恰库尔图收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"大黄山")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"双涝坝")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"萨尔乔克")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"芨芨湖")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿勒泰局").id,name:"萨尔托海")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"鸣沙山")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"三塘湖")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"火烧山")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"五彩湾")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"红旗农场")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"三台油库")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"紫泥泉子")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"南泉子")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"三台收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"吉木萨尔")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"泉子街")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"奇台收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"中心团场")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"老奇台收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"双涝坝")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"木垒收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"博斯坦收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"大浪沙收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"木垒主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"白杨河")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "昌吉局").id,name:"白山泉主线收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"白山泉匝道站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"镜儿泉匝道站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"工业园匝道站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"骆驼圈子主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"星星峡")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"烟墩")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"二堡")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "哈密局").id,name:"一碗泉")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "吐鲁番局").id,name:"鄯善东")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "吐鲁番局").id,name:"吐峪沟")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "吐鲁番局").id,name:"库米什")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"和硕主线收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"和硕匝道收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"高桥匝道收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"焉耆匝道收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"紫泥泉匝道收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"塔什店匝道收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"库尔勒主线收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"二十七团")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "库尔勒局").id,name:"库尔楚")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"库车")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"新和")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"新和东")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"新和")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"新和西")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"英买力")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"玉尔滚")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"五团")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"温宿工业园")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"佳木镇")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"温宿")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"阿克苏东")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"格达良收费站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"沙井子主线")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"沙井子匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"启浪匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"阿恰匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"一间房匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿克苏局").id,name:"三岔口匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"三道班匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"伽师总场匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"西克尔匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"大山口匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"格达良匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"阿图什东")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"阿图什西")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"阿图什轻工业园")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "阿图什局").id,name:"塔库提南")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"乌恰")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"库曲湾主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"巴楚匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"48团匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"色力布亚匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"阿瓦提匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"艾里西湖匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"莎车北匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"莎车西匝道")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"莎车主线")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"麦盖提")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"牌楼")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"塔吉克")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"四十二团")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"岳普湖")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"江巴孜")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"夏普吐勒")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"阿克喀什")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"喀什")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"工业园匝道站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"上阿图什主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"康苏主线站")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"塔孜洪")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"莎车")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "喀什局").id,name:"叶城")
  Tollstation.create(gljdaima_id: Gljdaima.find_by(name: "和田局").id,name:"皮山")
end




  
