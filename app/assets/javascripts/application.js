// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.form
//= require jquery.remotipart
//= require jquery.Jcrop
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function(){
  var cities = ["北京", "上海", "重庆", "天津", "安徽 合肥", "安徽 宿州", "安徽 淮北", "安徽 阜阳", "安徽 蚌埠", "安徽 淮南", "安徽 滁州", "安徽 马鞍山", "安徽 芜湖", "安徽 铜陵", "安徽 安庆", "安徽 黄山", "安徽 六安", "安徽 巢湖", "安徽 池州", "安徽 宣城", "安徽 亳州", "安徽 界首", "安徽 明光", "安徽 天长", "安徽 桐城", "安徽 宁国", "福建 厦门", "福建 福州", "福建 南平", "福建 三明", "福建 莆田", "福建 泉州", "福建 漳州", "福建 龙岩", "福建 宁德", "福建 福清", "福建 长乐", "福建 邵武", "福建 武夷山", "福建 建瓯", "福建 建阳", "福建 永安", "福建 石狮", "福建 晋江", "福建 南安", "福建 龙海", "福建 漳平", "福建 福安", "福建 福鼎", "甘肃 兰州", "甘肃 嘉峪关", "甘肃 金昌", "甘肃 白银", "甘肃 天水", "甘肃 酒泉", "甘肃 张掖", "甘肃 武威", "甘肃 庆阳", "甘肃 平凉", "甘肃 定西", "甘肃 陇南", "甘肃 玉门", "甘肃 敦煌", "甘肃 临夏", "甘肃 合作", "广东  广州", "广东 深圳", "广东 清远", "广东 韶关", "广东 河源", "广东 梅州", "广东 潮州", "广东 汕头", "广东 揭阳", "广东 汕尾", "广东 惠州", "广东 东莞", "广东 珠海", "广东 中山", "广东 江门", "广东 佛山", "广东 肇庆", "广东 云浮", "广东 阳江", "广东 茂名", "广东 湛江", "广东 从化", "广东 增城", "广东 英德", "广东 连州", "广东 乐昌", "广东 南雄", "广东 兴宁", "广东 普宁", "广东 陆丰", "广东 恩平", "广东 台山", "广东 开平", "广东 鹤山", "广东 高要", "广东 四会", "广东 罗定", "广东 阳春", "广东 化州", "广东 信宜", "广东 高州", "广东 吴川", "广东 廉江", "广东 雷州", "贵州 贵阳", "贵州 六盘水", "贵州 遵义", "贵州 安顺", "贵州 清镇", "贵州 赤水", "贵州 仁怀", "贵州 凯里", "贵州 都匀", "贵州 兴义", "贵州 毕节", "贵州 铜仁", "贵州 福泉", "河北 石家庄", "河北 邯郸", "河北 唐山", "河北 保定", "河北 秦皇岛", "河北 邢台", "河北 张家口", "河北 承德", "河北 沧州", "河北 廊坊", "河北 衡水 ", "河北 辛集", "河北 藁城", "河北 晋州", "河北 新乐", "河北 鹿泉", "河北 丰南", "河北 遵化", "河北 迁安", "河北 霸州", "河北 三河", "河北 定州", "河北 涿州", "河北 安国", "河北 高碑店", "河北 泊头", "河北 任丘", "河北 黄骅", "河北 河间", "河北 冀州", "河北 深州", "河北 南宫", "河北 沙河", "河北 武安", "黑龙江 哈尔滨", "黑龙江 齐齐哈尔", "黑龙江 黑河", "黑龙江 大庆", "黑龙江 伊春", "黑龙江 鹤岗", "黑龙江 佳木斯", "黑龙江 双鸭山", "黑龙江 七台河", "黑龙江 鸡西", "黑龙江 牡丹江", "黑龙江 绥化", "黑龙江 双城", "黑龙江 尚志", "黑龙江 五常", "黑龙江 阿城", "黑龙江 讷河", "黑龙江 北安", "黑龙江 五大连池", "黑龙江 铁力", "黑龙江 同江", "黑龙江 富锦", "黑龙江 虎林", "黑龙江 密山", "黑龙江 绥芬河", "黑龙江 海林", "黑龙江 宁安", "黑龙江 安达", "黑龙江 肇东", "黑龙江 海伦", "河南 郑州", "河南 开封", "河南 洛阳", "河南 平顶山", "河南 安阳", "河南 鹤壁", "河南 新乡", "河南 焦作", "河南 濮阳", "河南 许昌", "河南 漯河", "河南 三门峡", "河南 南阳", "河南 商丘", "河南 周口", "河南 驻马店", "河南 信阳", "河南 济源", "河南 荥阳", "河南 新郑", "河南 登封", "河南 新密", "河南 巩义", "河南 邓州", "河南 偃师", "河南 孟州", "河南 沁阳", "河南 卫辉", "河南 辉县", "河南 林州", "河南 永城", "河南 禹州", "河南 长葛", "河南 舞钢", "河南 汝州", "河南 义马", "河南 灵宝", "河南 项城", "湖北 武汉", "湖北 十堰", "湖北 襄樊", "湖北 荆门", "湖北 孝感", "湖北 黄冈", "湖北 鄂州", "湖北 黄石", "湖北 咸宁", "湖北 荆州", "湖北 宜昌", "湖北 随州", "湖北 仙桃", "湖北 天门", "湖北 潜江", "湖北 丹江口", "湖北 老河口", "湖北 枣阳", "湖北 宜城", "湖北 钟祥", "湖北 汉川", "湖北 应城", "湖北 安陆", "湖北 广水", "湖北 麻城", "湖北 武穴", "湖北 大冶", "湖北 赤壁", "湖北 石首", "湖北 洪湖", "湖北 松滋", "湖北 宜都", "湖北 枝江", "湖北 当阳", "湖北 恩施", "湖北 利川", "湖南 长沙", "湖南 张家界", "湖南 常德", "湖南 益阳", "湖南 岳阳", "湖南 株洲", "湖南 湘潭", "湖南 衡阳", "湖南 郴州", "湖南 永州", "湖南 邵阳", "湖南 怀化", "湖南 娄底", "湖南 浏阳", "湖南 津市", "湖南 沅江", "湖南 汨罗", "湖南 临湘", "湖南 醴陵", "湖南 湘乡", "湖南 韶山", "湖南 耒阳", "湖南 常宁", "湖南 资兴", "湖南 武冈", "湖南 洪江", "湖南 冷水江", "湖南 涟源", "湖南 吉首", "吉林 长春", "吉林 吉林市", "吉林 白城", "吉林 松原", "吉林 四平", "吉林 辽源", "吉林 通化", "吉林 白山", "吉林 德惠", "吉林 九台", "吉林 榆树", "吉林 磐石", "吉林 蛟河", "吉林 桦甸", "吉林 舒兰", "吉林 洮南", "吉林 大安", "吉林 双辽", "吉林 公主岭", "吉林 梅河口", "吉林 集安", "吉林 临江", "吉林 延吉", "吉林 图们", "吉林 敦化", "吉林 珲春", "吉林 龙井", "吉林 和龙", "江西 南昌", "江西 九江", "江西 景德镇", "江西 鹰潭", "江西 新余", "江西 萍乡", "江西 赣州", "江西 上饶", "江西 抚州", "江西 宜春", "江西 吉安", "江西 瑞昌", "江西 乐平", "江西 瑞金", "江西 南康", "江西 德兴", "江西 丰城", "江西 樟树", "江西 高安", "江西 井冈山", "江西 贵溪", "江苏 南京", "江苏 徐州", "江苏 连云港", "江苏 宿迁", "江苏 淮安", "江苏 盐城", "江苏 扬州", "江苏 泰州", "江苏 南通", "江苏 镇江", "江苏 常州", "江苏 无锡", "江苏 苏州", "江苏 江阴", "江苏 宜兴", "江苏 邳州", "江苏 新沂", "江苏 金坛", "江苏 溧阳", "江苏 常熟", "江苏 张家港", "江苏 太仓", "江苏 昆山", "江苏 吴江", "江苏 如皋", "江苏 通州", "江苏 海门", "江苏 启东", "江苏 大丰", "江苏 东台", "江苏 高邮", "江苏 仪征", "江苏 江都", "江苏 扬中", "江苏 句容", "江苏 丹阳", "江苏 兴化", "江苏 姜堰", "江苏 泰兴", "江苏 靖江", "辽宁 沈阳", "辽宁 大连", "辽宁 朝阳", "辽宁 阜新", "辽宁 铁岭", "辽宁 抚顺", "辽宁 本溪", "辽宁 辽阳", "辽宁 鞍山", "辽宁 丹东", "辽宁 营口", "辽宁 盘锦", "辽宁 锦州", "辽宁 葫芦岛", "辽宁 新民", "辽宁 瓦房店", "辽宁 普兰店", "辽宁 庄河", "辽宁 北票", "辽宁 凌源", "辽宁 调兵山", "辽宁 开原", "辽宁 灯塔", "辽宁 海城", "辽宁 凤城", "辽宁 东港", "辽宁 大石桥", "辽宁 盖州", "辽宁 凌海", "辽宁 北宁", "辽宁 兴城", "山东  济南", "山东 青岛", "山东 聊城", "山东 德州", "山东 东营", "山东 淄博", "山东 潍坊", "山东 烟台", "山东 威海", "山东 日照", "山东 临沂", "山东 枣庄", "山东 济宁", "山东 泰安", "山东 莱芜", "山东 滨州", "山东 菏泽", "山东 章丘", "山东 胶州", "山东 胶南", "山东 即墨", "山东 平度", "山东 莱西", "山东 临清", "山东 乐陵", "山东 禹城", "山东 安丘", "山东 昌邑", "山东 高密", "山东 青州", "山东 诸城", "山东 寿光", "山东 栖霞", "山东 海阳", "山东 龙口", "山东 莱阳", "山东 莱州", "山东 蓬莱", "山东 招远", "山东 文登", "山东 荣成", "山东 乳山", "山东 滕州", "山东 曲阜", "山东 兖州", "山东 邹城", "山东 新泰", "山东 肥城", "陕西 西安", "陕西 延安", "陕西 铜川", "陕西 渭南", "陕西 咸阳", "陕西 宝鸡", "陕西 汉中", "陕西 榆林", "陕西 商洛", "陕西 安康", "陕西 韩城", "陕西 华阴", "陕西 兴平", "山西 太原", "山西 大同", "山西 朔州", "山西 阳泉", "山西 长治", "山西 晋城", "山西 忻州", "山西 吕梁", "山西 晋中", "山西 临汾", "山西 运城", "山西 古交", "山西 潞城", "山西 高平", "山西 原平", "山西 孝义", "山西 汾阳", "山西 介休", "山西 侯马", "山西 霍州", "山西 永济", "山西 河津", "四川  成都 ", "四川 广元", "四川 绵阳", "四川 德阳", "四川 南充", "四川 广安", "四川 遂宁", "四川 内江", "四川 乐山", "四川 自贡", "四川 泸州", "四川 宜宾", "四川 攀枝花", "四川 巴中", "四川 达州", "四川 资阳", "四川 眉山", "四川 雅安 ", "四川 崇州", "四川 邛崃", "四川 都江堰", "四川 彭州", "四川 江油", "四川 什邡", "四川 广汉", "四川 绵竹", "四川 阆中", "四川 华蓥", "四川 峨眉山", "四川 万源", "四川 简阳", "四川 西昌", "云南 昆明", "云南 曲靖", "云南 玉溪", "云南 丽江", "云南 昭通", "云南 思茅", "云南 临沧", "云南 保山", "云南 安宁", "云南 宣威", "云南 潞西", "云南 瑞丽", "云南 大理", "云南 楚雄", "云南 个旧", "云南 开远", "云南 景洪", "浙江 杭州", "浙江 宁波 ", "浙江 湖州", "浙江 嘉兴", "浙江 舟山", "浙江 绍兴", "浙江 衢州", "浙江 金华", "浙江 台州", "浙江 温州", "浙江 丽水", "浙江 临安", "浙江 富阳", "浙江 建德", "浙江 慈溪", "浙江 余姚", "浙江 奉化", "浙江 平湖", "浙江 海宁", "浙江 桐乡", "浙江 诸暨", "浙江 上虞", "浙江 嵊州", "浙江 江山", "浙江 兰溪", "浙江 永康", "浙江 义乌", "浙江 东阳", "浙江 临海", "浙江 温岭", "浙江 瑞安", "浙江 乐清", "浙江 龙泉", "青海 西宁", "青海 格尔木", "青海 德令哈", "广西 南宁", "广西 桂林", "广西 柳州", "广西 梧州", "广西 贵港", "广西 玉林", "广西 钦州", "广西 北海", "广西 防城港", "广西 崇左", "广西 百色", "广西 河池", "广西 来宾", "广西 贺州", "广西 岑溪", "广西 桂平", "广西 北流", "广西 东兴", "广西 凭祥", "广西 宜州", "广西 合山", "内蒙古 呼和浩特", "内蒙古 包头", "内蒙古 乌海", "内蒙古 赤峰", "内蒙古 呼伦贝尔", "内蒙古 通辽", "内蒙古 乌兰察布", "内蒙古 鄂尔多斯", "内蒙古 巴彦淖尔", "内蒙古 满洲里", "内蒙古 扎兰屯", "内蒙古 牙克石", "内蒙古 根河", "内蒙古 额尔古纳", "内蒙古 乌兰浩特", "内蒙古 阿尔山", "内蒙古 霍林郭勒", "内蒙古 锡林浩特", "内蒙古 二连浩特", "内蒙古 丰镇", "宁夏 银川", "宁夏 石嘴山", "宁夏 吴忠", "宁夏 中卫", "宁夏 固原", "宁夏 灵武", "宁夏 青铜峡", "西藏 拉萨", "西藏 日喀则", "新疆 乌鲁木齐", "新疆 克拉玛依", "新疆  石河子", "新疆 阿拉尔", "新疆 图木舒克", "新疆 五家渠", "新疆 喀什", "新疆 阿克苏", "新疆 和田", "新疆 吐鲁番", "新疆 哈密", "新疆 阿图什", "新疆 博乐", "新疆 昌吉", "新疆 阜康", "新疆 米泉", "新疆 库尔勒", "新疆 伊宁", "新疆 奎屯", "新疆 塔城", "新疆 乌苏", "新疆 阿勒泰", "美国 纽约州 纽约市", "美国 加利福尼亚州 洛杉矶", "美国 伊利诺州 芝加哥", "美国 德克萨斯州 休士顿", "美国 亚利桑那州 凤凰城", "美国 宾夕法尼亚州 费城", "美国 德克萨斯州 圣安东尼奥", "美国 加利福尼亚州 圣地牙哥", "美国 德克萨斯州 达拉斯", "美国 加利福尼亚州 圣荷西", "美国 密西根州 底特律", "美国 佛罗里达州 杰克逊维尔", "美国 印地安纳州 印第安纳波利斯", "美国 加利福尼亚州 旧金山", "美国 俄亥俄州 哥伦布", "美国 德克萨斯州 奥斯汀", "美国 田纳西州 孟菲斯", "美国 德克萨斯州 福和市", "美国 马里兰州 巴尔的摩", "美国 北卡罗莱纳州 夏洛特", "美国 德克萨斯州 厄尔巴索", "美国 威斯康辛州 密尔沃基", "美国 麻萨诸塞州 波士顿", "美国 华盛顿州 西雅图", "美国 哥伦比亚特区 华盛顿", "美国 科罗拉多州 丹佛", "美国 肯塔基州 路易维尔", "美国 内华达州 拉斯维加斯", "美国 田纳西州 纳什维尔", "美国 奥克拉荷马州 奥克拉荷马市", "美国 俄勒冈州 波特兰", "美国 亚利桑那州 图森", "美国 新墨西哥州 阿布奎基", "美国 乔治亚州 亚特兰大", "美国 加利福尼亚州 长滩", "美国 加利福尼亚州 弗雷斯诺", "美国 加利福尼亚州 萨克拉门托", "美国 亚利桑那州 梅萨", "美国 密苏里州 堪萨斯城", "美国 俄亥俄州 克里夫兰", "美国 维吉尼亚州 维吉尼亚比奇", "美国 内布拉斯加州 奥马哈", "美国 佛罗里达州 迈阿密", "美国 加利福尼亚州 奥克兰", "美国 奥克拉荷马州 图尔萨", "美国 夏威夷州 檀香山", "美国 明尼苏达州 明尼亚波利斯", "美国 科罗拉多州 科罗拉多泉", "美国 德克萨斯州 阿灵顿", "美国 堪萨斯州 威奇托", "美国 北卡罗莱纳州 罗利", "美国 密苏里州 圣路易斯", "美国 加利福尼亚州 圣安娜", "美国 加利福尼亚州 安那罕", "美国 佛罗里达州 坦帕", "美国 俄亥俄州 辛辛那提", "美国 宾夕法尼亚州 匹兹堡", "美国 加利福尼亚州 贝克斯菲尔德", "美国 科罗拉多州 奥罗拉", "美国 俄亥俄州 托莱多", "美国 加利福尼亚州 里弗塞得", "美国 加利福尼亚州 斯托克顿", "美国 德克萨斯州 科珀斯克里斯蒂", "美国 新泽西州 纽华克", "美国 阿拉斯加州 安克雷奇", "美国 纽约州 水牛城", "美国 明尼苏达州 圣保罗", "美国 肯塔基州 列克星顿", "美国 德克萨斯州 普拉诺", "美国 印地安纳州 韦恩堡", "美国 佛罗里达州 圣彼德斯堡", "美国 亚利桑那州 格伦代尔", "美国 新泽西州 泽西城", "美国 内布拉斯加州 林肯", "美国 内华达州 亨德森", "美国 亚利桑那州 钱德勒", "美国 维吉尼亚州 诺福克", "美国 北卡罗来纳州 格林斯伯勒", "美国 亚利桑那州 斯科茨代尔", "美国 路易斯安那州 巴吞鲁日", "美国 阿拉巴马州 伯明翰", "美国 威斯康辛州 麦迪逊", "美国 路易斯安那州 纽奥良", "美国 维吉尼亚州 切萨皮克", "美国 佛罗里达州 奥兰多", "美国 德克萨斯州 加兰", "美国 佛罗里达州 海厄利亚", "美国 德克萨斯州 拉雷多", "美国 加利福尼亚州 丘拉维斯塔", "美国 德克萨斯州 拉伯克", "美国 内华达州 雷诺", "美国 俄亥俄州 阿克伦", "美国 北卡罗莱纳州 德罕", "美国 纽约州 罗彻斯特", "美国 加利福尼亚州 莫德斯托", "美国 阿拉巴马州 蒙哥马利", "美国 加利福尼亚州 弗里蒙特", "美国 路易斯安那州 什里夫波特", "美国 维吉尼亚州 阿灵顿", "美国 加利福尼亚州 格伦代尔", "美国 加利福尼亚州 圣贝纳迪诺", "美国 爱达荷州 博伊西", "美国 华盛顿州 斯波坎", "美国 纽约州 扬克斯", "美国 内华达州 北拉斯维加斯", "美国 北卡罗莱纳州 温斯顿-塞勒姆", "美国 华盛顿州 塔科马", "美国 德克萨斯州 欧文", "美国 加利福尼亚州 亨丁顿滩", "美国 加利福尼亚州 尔湾", "美国 爱阿华州 德梅因", "美国 密西根州 大急流城", "美国 维吉尼亚州 里奇蒙", "美国 阿拉巴马州 莫比尔", "美国 亚利桑那州 吉尔伯特", "美国 乔治亚州 奥古斯塔", "美国 乔治亚州 哥伦布", "美国 佛罗里达州 劳德代尔堡", "美国 德克萨斯州 阿马里诺", "美国 加利福尼亚州 奥克斯纳德", "美国 阿肯色州 小石城", "美国 加利福尼亚州 莫雷诺谷", "美国 田纳西州 诺克斯维尔", "美国 犹他州 盐湖城", "美国 维吉尼亚州 纽波特纽斯", "美国 密西西比州 杰克逊", "美国 麻萨诸塞州 乌斯特", "美国 罗德岛州 普洛威顿斯", "美国 加利福尼亚州 安大略", "美国 德克萨斯州 布朗斯维尔", "美国 加利福尼亚州 库卡蒙格牧场", "美国 伊利诺州 奥罗拉", "美国 加利福尼亚州 方塔纳", "美国 亚利桑那州 坦佩", "美国 伊利诺州 罗克福德", "美国 阿拉巴马州 亨茨维尔", "美国 北卡罗莱纳州 费页特维", "美国 加利福尼亚州 圣塔克拉利塔", "美国 堪萨斯州 欧弗兰帕克", "美国 加利福尼亚州 园林市", "美国 加利福尼亚州 欧申赛德", "美国 佛罗里达州 塔拉哈西", "美国 华盛顿州 温哥华", "美国 俄亥俄州 代顿", "美国 田纳西州 查塔诺加", "美国 加利福尼亚州 波莫纳", "美国 加利福尼亚州 圣罗莎", "美国 德克萨斯州 大草原城", "美国 俄勒冈州 塞勒姆", "美国 佛罗里达州 开普科勒尔", "美国 麻萨诸塞州 斯普林菲尔德", "美国 密苏里州 斯普林菲尔德", "美国 加利福尼亚州 科洛纳", "美国 佛罗里达州 潘布鲁克派恩斯", "美国 新泽西州 帕特森", "美国 俄勒冈州 尤金", "美国 佛罗里达州 好莱坞", "美国 加利福尼亚州 萨利纳斯", "美国 维吉尼亚州 汉普顿", "美国 德克萨斯州 帕萨迪纳", "美国 加利福尼亚州 帕萨迪纳", "美国 佛罗里达州 圣露西港", "美国 堪萨斯州 堪萨斯城", "美国 伊利诺州 内珀维尔", "美国 伊利诺州 乔利埃特", "美国 南达科他州 苏瀑", "美国 加利福尼亚州 托伦斯", "美国 亚利桑那州 皮奥里亚", "美国 加利福尼亚州 兰开斯特", "美国 纽约州 雪城", "美国 加利福尼亚州 海沃德", "美国 科罗拉多州 莱克伍德", "美国 加利福尼亚州 棕榈谷", "美国 维吉尼亚州 亚历山德里亚", "美国 康乃狄克州 桥港", "美国 加利福尼亚州 橙市", "美国 密西根州 沃伦", "美国 加利福尼亚州 埃斯孔迪多", "美国 加利福尼亚州 富勒顿", "美国 德克萨斯州 梅斯基特", "美国 加利福尼亚州 森尼韦尔", "美国 佛罗里达州 科勒尔斯普林斯", "美国 科罗拉多州 科林斯堡", "美国 加利福尼亚州 埃尔克格罗夫", "美国 密西根州 斯特灵海茨", "美国 乔治亚州 沙瓦纳", "美国 德克萨斯州 麦卡伦", "美国 新泽西州 伊丽莎白", "美国 康乃狄克州 哈特福", "美国 爱阿华州 锡达拉皮兹", "美国 加利福尼亚州 千橡市", "美国 康乃狄克州 纽黑文", "美国 加利福尼亚州 埃尔蒙特", "美国 加利福尼亚州 康科德", "美国 堪萨斯州 托皮卡", "美国 德克萨斯州 卡罗尔顿", "美国 德克萨斯州 韦科", "美国 加利福尼亚州 西米谷", "美国 犹他州 西瓦利城", "美国 南卡罗莱纳州 哥伦比亚", "美国 康乃狄克州 斯坦福", "美国 华盛顿州 贝尔维尤", "美国 密西根州 弗林特", "美国 加利福尼亚州 瓦列霍", "美国 伊利诺州 斯普林菲尔德", "美国 印地安纳州 埃文斯维尔", "美国 加利福尼亚州 英格尔伍德", "美国 德克萨斯州 阿比林", "美国 堪萨斯州 奥拉西", "美国 密西根州 兰盛", "美国 路易斯安那州 拉法叶", "美国 犹他州 普若佛", "美国 加利福尼亚州 维塞利亚", "美国 密西根州 安娜堡", "美国 田纳西州 克拉克斯维尔", "美国 伊利诺州 皮奥里亚", "美国 北卡罗莱纳州 卡瑞市", "美国 乔治亚州 雅典", "美国 德克萨斯州 博蒙特", "美国 加利福尼亚州 科斯塔梅萨", "美国 德克萨斯州 登顿", "美国 新罕布夏州 曼彻斯特", "美国 密苏里州 独立城", "美国 加利福尼亚州 唐尼", "美国 科罗拉多州 桑顿", "美国 佛罗里达州 盖恩斯维尔", "美国 加利福尼亚州 圣克拉拉", "美国 佛罗里达州 米拉马尔", "美国 南卡罗莱纳州 查尔斯顿", "美国 加利福尼亚州 西柯汶纳", "美国 佛罗里达州 克利尔沃特", "美国 德克萨斯州 麦金尼", "美国 宾夕法尼亚州 阿伦敦", "美国 康乃狄克州 沃特伯里", "美国 加利福尼亚州 罗斯维尔", "美国 科罗拉多州 西敏", "美国 加利福尼亚州 诺沃克", "美国 印地安纳州 南本德", "美国 加利福尼亚州 费尔菲尔德", "美国 科罗拉多州 阿瓦达", "美国 佛罗里达州 庞帕诺比奇", "美国 加利福尼亚州 伯班克", "美国 加利福尼亚州 文图拉", "美国 科罗拉多州 普韦布洛", "美国 麻萨诸塞州 洛厄尔", "美国 奥克拉荷马州 诺曼", "美国 加利福尼亚州 里奇蒙", "美国 德克萨斯州 米德兰", "美国 宾夕法尼亚州 伊利", "美国 德克萨斯州 基林", "美国 伊利诺州 埃尔金", "美国 加利福尼亚州 柏克莱", "美国 维吉尼亚州 朴茨茅斯", "美国 麻萨诸塞州 剑桥", "美国 加利福尼亚州 戴利城", "美国 加利福尼亚州 安条克", "美国 威斯康辛州 绿湾", "美国 犹他州 西约旦", "美国 蒙大拿州 比灵斯"];
	
	$('#profile_hometown').typeahead({ source: cities });
	$('#profile_current_city').typeahead({ source: cities });
});



  