<template>
  <div class="flex1">
    <image class="background-image" resize="cover" src="https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2443968735,3769558783&fm=26&gp=0.jpg"/>
    <ut-list class="bg-container opacity">
        <cell>
          <div class="top"></div>
        </cell>
        <cell>
          <ut-cell class="header" title="张三" label="职位:iOS高级研发工程师" bottom border-bottom>
              <div slot="right-icon" class="flex-row">
                <ut-icon name="qrcode" size="32" class="color-999"/>
                <ut-icon name="arrow" size="32" class="color-999"></ut-icon>
              </div>
              <image class="image" slot="icon" src="https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2745141664,3289119620&fm=26&gp=0.jpg"></image>
          </ut-cell>
          <ut-cell class="mt-20 mb-20" :icon="weather.wea_img" :title="`${weather.wea}  ${weather.tem}°C`" :value="weather.city" :icon-style="colors[weather.wea_img]" border></ut-cell>
          <ut-cell class="mb-20" icon="pay" title="支付" is-link :icon-style="{color:'#029e43'}" border></ut-cell>
          <ut-cell icon="collect" title="收藏" is-link :icon-style="{color:'#f37a2a'}" border-bottom></ut-cell>
          <ut-cell icon="photo" title="相册" is-link :icon-style="{color:'#1088f8'}" border-bottom></ut-cell>
          <ut-cell icon="wallet" title="卡包" is-link :icon-style="{color:'#1088f8'}" border-bottom></ut-cell>
          <ut-cell icon="emot" title="表情" is-link :icon-style="{color:'#e9da05'}" border-bottom></ut-cell>
          <ut-cell class="mt-20 mb-20" icon="setting" title="设置" is-link :icon-style="{color:'#1088f8'}" border></ut-cell>
        </cell>
    </ut-list>
  </div>
</template>

<script>

import {UtCommonMixin} from "weex-unisoft";

export default {
  name: "my",
  mixins: [UtCommonMixin],
  data() {
    return {
      colors: {
        xue: {color:'#7dc5eb'},
        lei: {color:'#7dc5eb'},
        shachen: {color:'#7dc5eb'},
        wu: {color:'#7dc5eb'},
        bingbao: {color:'#7dc5eb'},
        yun: {color:'#7dc5eb'},
        yu: {color:'#7dc5eb'},
        yin: {color:'#7dc5eb'},
        qing: {color:'#f39c1f'}
      },
      weather: {
        city: '长沙',
        wea_img: 'yin',
        wea: '阴',
        tem: '25',
      }
    };
  },
  methods: {
    init() {
      let param = {
        url: 'https://v0.yiketianqi.com/api?version=v61&appid=21692921&appsecret=b46nhvV5',
        data: {city: '长沙'}
      }
      this.get(param).then(ret =>{
          this.weather = ret;
      }).catch(err =>{
          this.toast(err);
      });
    }
  }
};
</script>

<style src='../assets/css/global.css'/>
<style scoped>
.background-image {
  position:absolute;
  width: 750px;
  top: 0;
  bottom: 0;
}
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
.opacity {
  opacity: 0.95;
}
</style>
