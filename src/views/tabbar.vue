<template>
    <ut-tab-bar titleType="iconFont" 
                :tab-titles="tabTitles" 
                :tab-styles="tabStyles" 
                ref="tabbar" 
                @tabSelected="tabSelected">
        <ut-nav-bar title="第一个页面"/>
        <ut-nav-bar title="第二个页面"/>
        <ut-nav-bar title="第三个页面"/>
    </ut-tab-bar>
</template>

<script>
  import {UtTabBar,UtNavBar} from 'weex-unisoft';
  const dom = weex.requireModule('dom');
  
  export default {
    components: {UtTabBar,UtNavBar},
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
    },
    methods: {
      tabSelected(e) {
        console.log('点击page'+e.page);
      }
    },
    mounted() {
      this.$refs.tabbar.setPage(1);
    }
  };
</script>