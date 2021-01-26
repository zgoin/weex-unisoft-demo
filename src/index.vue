<template>
    <ut-tab-bar titleType="iconFont" 
                :tab-titles="tabTitles" 
                :tab-styles="tabStyles" 
                ref="tabbar" 
                fullScreen
                @tabSelected="tabSelected">
        <message ref="message"></message> 
        <home ref="home"></home>
        <my ref="my"></my>
    </ut-tab-bar>
</template>

<script>
  import {UtTabBar} from 'weex-unisoft';
  import message from './views/message.vue';
  import my from './views/my.vue';
  import home from './views/home.vue';
  const dom = weex.requireModule('dom');
  
  export default {
    components: {UtTabBar, message, my, home},
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
        fontFamily: 'unisoft-iconfont'
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
        if (e.page == 0) {
          this.$refs.message.init();
        } else if (e.page == 1) {
          this.$refs.home.init();
        } else if (e.page == 2) {
          this.$refs.my.init();
        }
      }
    },
    mounted() {
      this.$refs.tabbar.setPage(1);
    }
  };
</script>