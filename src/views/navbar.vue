<template>
    <ut-nav-bar title="NavBar">
        <ut-scroller>
            <ut-nav-bar title="默认" class="mt-20"/>
            <ut-nav-bar title="左侧文字" left-text="返回" class="mt-20"/>
            <ut-nav-bar title="右侧文字" right-text="按钮" class="mt-20"/>
            <ut-nav-bar title="标题颜色" text-color="#FF0000" class="mt-20"/>
            <ut-nav-bar title="背景颜色" background-color="#20B759" text-color="#FFFFFF" class="mt-20"/>
            <ut-nav-bar title="隐藏返回" :show-back="false" class="mt-20"/>
            <ut-nav-bar title="隐藏状态栏高度" :show-status-bar="false" class="mt-20"/>
            <ut-nav-bar title="自定义右侧按钮" class="mt-20">
                <ut-icon slot="right" name="more" />
            </ut-nav-bar>
        </ut-scroller>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';

  export default {
    mixins: [UtCommonMixin],
  };
</script>

<style src='../assets/css/global.css'>
</style>