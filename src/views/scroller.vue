<template>
    <ut-nav-bar title="Scroller">
      <ut-scroller v-if="list.length" @refresh="refresh" @loadmore="loadmore"
        :refreshing="refreshing"
        :loading="loading"
        :noMore="noMore"
        :noNextLabel="list.length > 15?'没有下一页了':''">
        <ut-cell v-for="(item, index) in list" :key="index" border-top :value="item.value" :label="item.label" :title="item.title" />
      </ut-scroller>
      <ut-empty v-else class="border-top border-bottom" />
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';

  export default {
    mixins: [UtCommonMixin],
    data: () => ({
      list: [],
      refreshing: false,
      loading: false,
      noMore: false,
    }),
    methods: {
      init() {
          this.list = [];
          for (let index = 0; index < 15; index++) {
              this.list.push({
                  title: `${index+1}、标题`,
                  label: "自定义单元格最右侧的额外内容自定义单元格最右",
                  value: '12:56'
              });
          }
      },
      refresh() {
          this.refreshing = true;
          this.noMore = false;
          setTimeout(() => {
              this.init();
              this.refreshing = false;
          }, 1000);
      },
      loadmore() {
          setTimeout(() => {
              for (let index = 0; index < 10; index++) {
                  this.list.push({
                    title: `${this.list.length+1}、标题`,
                    label: "自定义单元格最右侧的额外内容自定义单元格最右",
                    value: '12:56'
                  })
              }
              this.loading = false;
              this.noMore = true;
          }, 100);
      }
    }
  };
</script>

<style src='../assets/css/global.css'>
</style>