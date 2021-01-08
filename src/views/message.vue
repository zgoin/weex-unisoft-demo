<template>
    <ut-nav-bar title="消息" :showBack="false" backgroundColor="#ffffff" textColor="#333333">
      <ut-icon slot="right" name="more" @click="rightClick"></ut-icon>
      <ut-list>
        <cell v-for="(item, index) in list" :key="index">
          <ut-cell class="mt-20" border-bottom :icon="item.icon" :title="item.title" :icon-style="item.iconStyle"
          is-link center border @click="push(item.url)" />
        </cell>
      </ut-list>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';

  export default {
    mixins: [UtCommonMixin],
    data: () => ({
      list: [
        {title: 'cell', icon:'cell', iconStyle: {color:'#029e43'}, url: 'views/cell.js'},
        {title: 'empty', icon:'empty', iconStyle: {color:'#f37a2a'}, url: 'views/empty.js'},
        {title: 'icon', icon:'single', iconStyle: {color:'#1088f8'}, url: 'views/icon.js'},
        {title: 'input', icon:'input', iconStyle: {color:'#1088f8'}},
        {title: 'list', icon:'list', iconStyle: {color:'#029e43'}},
        {title: 'loading', icon:'loading', iconStyle: {color:'#029e43'}},
        {title: 'navBar', icon:'navbar', iconStyle: {color:'#1088f8'}},
        {title: 'scroller', icon:'scroller', iconStyle: {color:'#029e43'}},
        {title: 'search', icon:'search', iconStyle: {color:'#1088f8'}},
        {title: 'tabBar', icon:'tabbar', iconStyle: {color:'#029e43'}}
      ],
    }),
    methods: {
      rightClick() {
        this.toast('刷新~');
      }
    }
  };
</script>

<style src='../assets/css/global.css'>
</style>