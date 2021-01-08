<template>
    <ut-nav-bar :title="title">
      <ut-search placeholder="搜索" backgroundColor="#ffffff" @focus="isSearch=true"/>
      <ut-list v-if="list.length" 
                @refresh="refresh" 
                @loadmore="loadmore" 
                :refreshing="refreshing" 
                :loading="loading" 
                :noMore="noMore"
                :noNextLabel="list.length > 15?'没有下一页了':''">
        <cell v-for="(item, index) in list" :key="index">
          <ut-cell 
                border-bottom
                value="12:56" 
                label="自定义单元格最右侧的额外内容自定义单元格最右"
                :title="`${item}、标题标题标题标题标题标题标题标题标题标题标题`"
                :icon-style="{color:'#589acb'}"
                :value-style="{fontSize:26}"
                :title-style="{flex:5}"
                @click="push('messageList.js', `${item}、测试`)">
          </ut-cell>
        </cell>
      </ut-list>
      <ut-empty v-else class="border-top border-bottom"></ut-empty>
      
      <div class="flex-row bg-fff">
        <text class="bg-theme color-fff pt-20 pb-20 m-30 text-center border-radius-20 flex1" @click="add">添加</text>
        <text class="bg-82CE45 color-fff pt-20 pb-20 m-30 text-center border-radius-20 flex1" @click="del">删除</text>
      </div>
      <ut-loading :show="loading" :needMask="true"></ut-loading>

      <ut-search v-if="isSearch" placeholder="搜索" :fullscreen="true" v-model="inputdata" @change="search" @cancel="cancel">
        <ut-list v-if="searchlist.length">
          <cell v-for="(item, index) in searchlist" :key="index">
            <text class="color-333 bg-fff font26 p-30 border-top border-dashed">{{item}}、测试</text>
          </cell>
          <cell style="height:64px"></cell>
        </ut-list>
        <ut-empty v-else image="search" class="border-top border-bottom"></ut-empty>
      </ut-search>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';

  export default {
    mixins: [UtCommonMixin],
    data: () => ({
      title: '消息',
      list: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19],
      searchlist: [],
      inputdata: '',
      refreshing: false,
      loading: false,
      noMore: false,
      isSearch: false,
    }),
    methods: {
      init(param) {
        this.title = param;
      },
      refresh() {
          this.refreshing = true;
          this.noMore = false;
          setTimeout(() => {
              this.list = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19];
              this.refreshing = false;
          }, 1000);
      },
      loadmore() {
          this.loading = true;
          setTimeout(() => {
              for (let index = 0; index < 10; index++) {
                this.list.push(this.list.length+1);
              }
              this.loading = false;
              this.noMore = true;
          }, 1000);
      },
      search() {
        this.searchlist = [];
        if (!this.inputdata) {
          return;
        }
        this.list.forEach(item =>{
          if (item.toString().indexOf(this.inputdata) != -1) {
            this.searchlist.push(item);
          }
        })
      },
      cancel() {
        this.isSearch = false;
        this.searchlist = [];
      },
      rightClick() {
        this.toast('刷新~');
      },
      add() {
        this.list.push(this.list.length+1);
      },
      del() {
        this.list.splice(this.list.length - 1, 1);
      }
    }
  };
</script>

<style src='../assets/css/global.css'>
</style>