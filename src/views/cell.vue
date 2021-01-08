<template>
    <ut-nav-bar title="cell">
      <ut-scroller>
        <text class="section">基础用法</text>
        <ut-cell title="标题" value="内容" border />
        <ut-cell title="标题" value="内容" label="描述信息" border-bottom />

        <text class="section">展示图标</text>
        <ut-cell icon="address" title="标题" value="内容" border />

        <text class="section">只设置 title</text>
        <ut-cell title="标题" border />

        <text class="section">展示箭头</text>
        <ut-cell title="标题" is-link border />
        <ut-cell title="标题" value="内容" is-link border-bottom />
        <ut-cell title="标题" value="内容" is-link arrow-direction="down" border-bottom />
        <ut-cell title="标题" value="内容" is-link arrow-direction="up" border-bottom />

        <text class="section">对齐方式</text>
        <ut-cell title="上对齐" label="描述信息" is-link border />
        <ut-cell title="居中对齐" label="描述信息" center is-link border-bottom />
        <ut-cell title="下对齐" label="描述信息" bottom is-link border-bottom />

        <text class="section">使用插槽</text>
        <ut-cell value="内容" is-link border center>
            <div slot="title" class="flex-row flex-items-center">
                <text class="font30 color-333">标题</text>
                <text class="ml-20 font24 color-fff bg-CE4545 p-10">标签</text>
            </div>
        </ut-cell>
        <ut-cell icon="shop" title="标题" border-bottom>
            <ut-icon name="search" slot="right-icon"/>
        </ut-cell>
        <div class="height-66"></div>
      </ut-scroller>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';
  export default {
    mixins: [UtCommonMixin],
  };
</script>

<style src='../assets/css/global.css' />
<style scoped>
.section {
    padding: 30px;
    font-size: 28px;
    color: #999999;
}
</style>