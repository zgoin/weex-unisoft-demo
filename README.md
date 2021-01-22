# 介绍

为了方便开发与简化代码，基于weex项目基础架构weex-unisoft. 

## 快速开始

``` bash
$ npm install weex-unisoft
```

## 使用

以UtTabBar为例：

```
<template>
    <ut-tab-bar titleType="iconFont" 
                :tab-titles="tabTitles" 
                :tab-styles="tabStyles" 
                ref="tabbar" 
                @tabSelected="tabSelected">
        <div></div> 
        <div></div> 
        <div></div> 
    </ut-tab-bar>
</template>

<script>
  import {UtTabBar} from 'weex-unisoft';
  const dom = weex.requireModule('dom');
  
  export default {
    components: {UtTabBar},
    data: () => ({
      tabTitles: [
        {
          title: '消息',
          codePoint: '\ue763',
          activeCodePoint: '\ue762'
        },
        {
          title: '主页',
          codePoint: '\ue729',
          activeCodePoint: '\ue60a'
        },
        {
          title: '我的',
          codePoint: '\ue75e',
          activeCodePoint: '\ue75d'
        }
      ],
      tabStyles: {
        bgColor: '#FFFFFF',
        titleColor: '#333333',
        activeTitleColor: '#40a704',
        activeBgColor: '#FFFFFF',
        activeIconFontColor: '#40a704',
        iconFontColor: '#666666',
        isActiveTitleBold: true,
        iconWidth: 70,
        iconHeight: 70,
        width: 150,
        height: 120,
        fontSize: 24,
        textPaddingLeft: 10,
        textPaddingRight: 10,
        fontFamily: 'unisoft-iconfont',
        iconFontSize: 42,
      }
    }),
    beforeCreate () {
      dom.addRule('fontFace', {
        'fontFamily': "unisoft-iconfont",
        'src': "url('https://at.alicdn.com/t/font_2282197_n2dl1zgbw7e.ttf')"
      });
    }
  };
</script>
```

如果要全部引入：

```
<script>
  import {UtCommonMixin} from 'weex-unisoft';
  export default {
    mixins: [UtCommonMixin],
  }
</script>
```

页面间传值：

```
<script>
  import {UtCommonMixin} from 'weex-unisoft';
  export default {
    mixins: [UtCommonMixin],
    methods: {
      init(param, pageParam) {
        //param 上个界面传递的值
        //pageParam url后所传的值（eg:"index.js?type=1"; pageParam={type:1}）
      },
      pagepush() {
        this.push('page.js', {data: '传值'}, ret=>{
           //ret 页面回调的值
        });
      },
      pagepop() {
        this.pop({value: '回调'});
      }
    }
  }
</script>
```

## Demo
请用WeexPlayground扫描二维码
![Image text](https://raw.githubusercontent.com/zgoin/weex-unisoft-demo/main/src/assets/img/qrcode.png)