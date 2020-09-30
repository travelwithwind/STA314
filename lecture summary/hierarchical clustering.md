# hierarchical clustering

## 对比 k-means 
    * k-means 需要提前确定k centers，得到的结果每次都不一样。 hierarchical 不需要，结果是唯一的，因此很有层次感，经常是用heat map 来展示
      ![](https://2.bp.blogspot.com/-38wWn7KD6v0/TgTJskG1ujI/AAAAAAAAC5g/0k33b0L5fL8/s400/heatmap.png)
    * k-means 每次迭代要算所有point 到不同center 的距离，但是不确定要算多少次，所有complexity O(n)
      hierarchical 每次迭代要算所有 point 之间的距离，而且每次迭代只能确定一个point 的归属，
      所以感觉 complexity是 O(n^3)

## linkage
* single linkage: 两个群，有两个人是朋友，那么大家都是朋友   
* complete linkage：两个群，所有人都是朋友，那么大家才都是朋友   

   啥时候用哪个呢？我的感觉是如果是研究事物的起源，就用single linkage。 比如广东人已经和
   所有其他省份的人形成一个cluster 了， 现在判断广西人是不是属于这个cluster。 广西人讲粤语，cluster 里面
   只有广东人讲粤语，这就够了，广东人和广西人肯定有同一个起源，应该放在一起。

   如果是研究事物的作用，就用complete linkage。      
