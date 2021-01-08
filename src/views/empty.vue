<template>
    <ut-nav-bar title="empty">
      <scroller class="scroller flex-row flex-items-center" scroll-direction="horizontal" show-scrollbar="false">
        <text v-for="(item, index) in tabs" :key="index" @click="tabIndex=index" :class="['p-20','font24','color-333', tabIndex==index?'select':'']">{{item.name}}</text>
      </scroller>
      <ut-empty :image="tabs[tabIndex].image" 
                :label="tabs[tabIndex].label" 
                :button="tabs[tabIndex].button"
                @btnClick="1"/>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';
  export default {
    mixins: [UtCommonMixin],
    data() {
      return {
        tabIndex: 0,
        tabs: [
          {name:'基础用法', image: 'error', label: '', button: ''},
          {name:'网络错误', image: 'network', label: '', button: ''},
          {name:'搜索结果', image: 'search', label: '', button: ''},
          {name:'自定义文本', image: 'error', label: '自定义文本', button: ''},
          {name:'自定义按钮', image: 'error', label: '', button: '自定义按钮'},
          {name:'自定义图片', image: 'https://img.yzcdn.cn/vant/custom-empty-image.png', label: '描述文字', button: ''}
        ]
      }
    }
  };
</script>

<style src='../assets/css/global.css' />
<style scoped>
.scroller {
    margin-top: 8px;
    width: 750px;
    height: 88px;
    background-color: #ffffff;
}
.select {
  background-color: cadetblue;
  color: #ffffff;
}
</style>