K clustering 把数据根据到cluster centre的距离分成K组。有什么用？降维。原来是n个feature，分组就变为K个feature，每个feature就是到各个到cluster centre的距离。

在处理图片上，可以把n种颜色的图片简化成只有k种颜色，比如红外卫星图片，可以用k clustering识别植被，水域，建筑等K个类别的东西。

<br/><br/>

### local minimum

初始点不同，K clustering 的结果也不同，结果往往不是global optimal的，那么有两个解决方法：
1. 多试几次(20-30次)
2. 在选初始 K clusters 的时候多费点心，让他们尽量分散。这种方法计算量大，不如用方法1简单粗暴

### choosing K

分组越多，cost 越低。但是分组太多，也就失去分组的意义了。怎么选择K呢？ 
- Plot cost vs K。这个plot 很像一只手臂，拐角处就是最佳的K。 
- 有时候一开始的cost 特别大，导致后面的 cost reduction很难在图片中看出来，那么用RATIO OF SUCCESSIVE COSTS
