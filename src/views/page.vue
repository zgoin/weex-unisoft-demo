<template>
    <ut-nav-bar title="页面跳转及传值">
        <ut-list>
            <cell>
                <ut-cell class="mt-20" :value-style="{flex:2}" border title="传递值:"  :value="value"/>
                <ut-cell class="mt-20" :value-style="{flex:2}" border title="回调值:"  :value="rvalue"/>
                <ut-cell class="mt-20" :value-style="{flex:2}" border title="传递或回调参数:">
                  <ut-input class="input" v-model="inputValue" placeholder="请输入"/>
                </ut-cell>
                <ut-cell class="mt-20" border title="跳转" is-link @click="pagepush"/>
                <ut-cell class="mt-20" border title="返回" is-link @click="pagepop" arrow-direction="left"/>
            </cell>
        </ut-list>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';
  export default {
    mixins: [UtCommonMixin],
    data() {
      return {
        value: '',
        rvalue: '',
        inputValue: ''
      }
    },
    methods: {
      init(param) {
        this.value = param;
      },
      pagepush() {
        this.push('page.js', this.inputValue, ret=>{
          this.rvalue = ret.value;
        });
      },
      pagepop() {
        this.pop({value: this.inputValue});
      }
    }
  };
</script>

<style src='../assets/css/global.css' />
<style scoped>
.input {
  flex: 2;
  padding-left: 20px;
  text-align: right;
}
</style>