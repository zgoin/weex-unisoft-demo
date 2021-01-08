<template>
    <ut-nav-bar title="优特" :showBack="false" backgroundColor="#f2f2f2" textColor="#333333">
      <ut-icon slot="right" :name="`\ue726`"></ut-icon>
      <ut-list>
          <cell>
            <ut-search placeholder="搜索" inputBgColor="#ffffff" backgroundColor="#f2f2f2" v-model="inputdata" @search="search"/>
          </cell>
          <cell v-for="(item, index) in list" :key="index">
            <ut-cell :title="item.title" :label="item.value" :value="item.time"
              border-bottom
              :value-style="{fontSize: '26px', color: '#999999'}"
              :title-style="{flex:4}">
              <image class="image" slot="icon" :src="item.icon"></image>
            </ut-cell>
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
        {title: '移动事业部', value: '小钉：组织公益树每日成长汇报', time: '11:01', icon:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ftupian.qqw21.com%2Farticle%2FUploadPic%2F2020-1%2F20201822245146096.jpg&refer=http%3A%2F%2Ftupian.qqw21.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611468042&t=36ee3f4417a6dc705bec739246cc58dd'},
        {title: '湖南优特信息咨询有限公司', value: '小钉：组织公益树每日成长汇报', time: '10:52', icon:'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=152607778,3693296992&fm=11&gp=0.jpg'},
        {title: 'ABI Developer', value: '小钉：欢迎陈新入群', time: '10:12', icon:'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=2260208376,2414227365&fm=26&gp=0.jpg'},
        {title: '工作通知：湖南优特信息咨询有限公司', value: '考勤打卡：今天团队出勤率为87.2%', time: '09:59', icon:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ftupian.qqw21.com%2Farticle%2FUploadPic%2F2020-1%2F202011422483669230.jpg&refer=http%3A%2F%2Ftupian.qqw21.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611468084&t=c7845124fc5a611fbd1ef8ad20b39b5c'},
        {title: '工作通知：移动事业部', value: '考勤打卡：09:18上班打开成功，点击查看详情', time: '09:18', icon:'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Ftupian.qqw21.com%2Farticle%2FUploadPic%2F2020-4%2F202041217214170315.jpg&refer=http%3A%2F%2Ftupian.qqw21.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611468084&t=25ceee65c3752c80274c445fd7569f91'}
      ],
      inputdata: ''
    }),
    methods: {
      search() {
        
      }
    }
  };
</script>

<style src='../assets/css/global.css'>
</style>
<style scoped>
.image {
  width: 88px;
  height: 88px;
  border-radius: 20px;
  margin-right: 10px;
}
</style>