<template>
  <ut-list class="bg-container">
      <cell>
        <div class="top"></div>
      </cell>
      <cell>
        <ut-cell class="header" title="张三" label="优特号:zs2000" bottom border-bottom>
            <div slot="right-icon" class="flex-row">
              <ut-icon name="qrcode" size="32" class="color-999"/>
              <ut-icon name="arrow" size="32" class="color-999"></ut-icon>
            </div>
            <image class="image" slot="icon" src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2745141664,3289119620&fm=26&gp=0.jpg"></image>
        </ut-cell>
        <ut-cell class="mt-20 mb-20" icon="pay" title="支付" is-link :icon-style="{color:'#029e43'}" border></ut-cell>
        <ut-cell icon="collect" title="收藏" is-link :icon-style="{color:'#f37a2a'}" border-bottom></ut-cell>
        <ut-cell icon="photo" title="相册" is-link :icon-style="{color:'#1088f8'}" border-bottom></ut-cell>
        <ut-cell icon="wallet" title="卡包" is-link :icon-style="{color:'#1088f8'}" border-bottom></ut-cell>
        <ut-cell icon="emot" title="表情" is-link :icon-style="{color:'#e9da05'}" border-bottom></ut-cell>
        <ut-cell class="mt-20 mb-20" icon="setting" title="设置" is-link :icon-style="{color:'#1088f8'}" border></ut-cell>
      </cell>
  </ut-list>
</template>

<script>

import {UtCommonMixin} from "weex-unisoft";

export default {
  name: "my",
  mixins: [UtCommonMixin],
  data() {
    return {
     
    };
  },
  methods: {
    
  }
};
</script>

<style src='../assets/css/global.css'/>
<style scoped>
.top {
  height: 100px;
  background-image: linear-gradient(to bottom, #f2f2f2, #ffffff);
}
.header {
  padding: 30px 0;
  background-color: #ffffff;
}
.image {
  width: 100px;
  height: 100px;
  border-radius: 20px;
  margin-right: 10px;
}
</style>
