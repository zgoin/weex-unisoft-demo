<template>
    <ut-nav-bar title="icon">
      <scroller>
        <div class="flex-row flex-wrap bg-fff border-radius-20 m-20">
          <div class="flex-items-center p-20 item" v-for="(value, key) in icon" :key="key">
            <ut-icon :name="key"/>
            <text class="color-333 font24 text-center">{{key}}</text>
          </div>
          </div>
      </scroller>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';
  import Icon from 'weex-unisoft/ut-icon/type';
  export default {
    mixins: [UtCommonMixin],
    data() {
      return {
        icon: Icon
      }
    }
  };
</script>

<style src='../assets/css/global.css' />
<style scoped>
.item {
  width: 175px;
  height: 125px;
}
</style>