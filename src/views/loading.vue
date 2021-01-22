<template>
    <ut-nav-bar title="Loading">
      <ut-scroller>
        <ut-cell class="mt-20" title="默认加载" is-link border @click="type=1;loading()"/>
        <ut-cell class="mt-20" title="trip" is-link border @click="type=2;loading()"/>
        <ut-cell class="mt-20" title="文字" is-link border @click="type=3;loading()"/>
        <ut-cell class="mt-20" title="延时显示" is-link border @click="type=4;loading()"/>
        <ut-cell class="mt-20" title="显示遮罩" is-link border @click="type=5;loading()"/>
      </ut-scroller>
      <ut-loading :show="show&&type==1"/>
      <ut-loading :show="show&&type==2" type="trip"/>
      <ut-loading :show="show&&type==3" loadingText="加载中..."/>
      <ut-loading :show="show&&type==4" interval="1000"/>
      <ut-loading :show="show&&type==5" need-mask/>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';
  export default {
    mixins: [UtCommonMixin],
    data() {
        return {
            show: false,
            type: 1
        }
    },
    methods: {
        loading() {
            this.show = true;
            setTimeout(() => {
                this.show = false;
            }, 2000);
        }
    }
  };
</script>

<style src='../assets/css/global.css' />