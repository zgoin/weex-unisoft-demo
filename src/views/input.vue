<template>
    <ut-nav-bar title="input">
      <ut-scroller>
        <text class="section">基础用法</text>
        <ut-input title="文本" placeholder="请输入文本" border />
        
        <text class="section">自定义类型</text>
        <ut-input title="文本" placeholder="请输入文本" type="text" border />
        <ut-input title="日期" placeholder="请选择日期" type="date" border-bottom />
        <ut-input title="时间" placeholder="请选择时间" type="time" border-bottom />
        <ut-input title="手机号" placeholder="请输入手机号" type="tel" border-bottom />
        <ut-input title="整数" placeholder="请输入整数" type="int" v-model="value" border-bottom />
        <ut-input title="数字" placeholder="请输入数字" type="float" v-model="value1" border-bottom />
        <ut-input title="密码" placeholder="请输入密码" type="password" border-bottom />
        
        <text class="section">禁用输入框</text>
        <ut-input title="只读" placeholder="输入框只读" disabled="true" border />
       
        <text class="section">显示图标</text>
        <ut-input title="显示图标" placeholder="请输入文本" border icon="emot" right-icon="tip"/>
        <ut-input title="显示清除图标" placeholder="请输入文本" v-model="value2" border-bottom icon="clock" clearable/>
        
        <text class="section">必填</text>
        <ut-input title="必填" placeholder="请输入文本" required border />
        
        <text class="section">插入按钮</text>
        <ut-input title="短信验证码" placeholder="请输入短信验证码" type="int" border center>
          <text slot="right-icon" class="btn">发送验证码</text>
        </ut-input>
        
        <text class="section">多行文本</text>
        <ut-input title="留言" placeholder="请输入留言" type="textarea" border />
        <ut-input title="字数统计" placeholder="请输入留言" type="textarea" show-word-limit maxlength="100" rows="3" v-model="value3" border-bottom/>
        <ut-input title="上下排列" placeholder="请输入留言" type="textarea" show-word-limit maxlength="100" rows="3" v-model="value4" border-bottom vertical/>
        <ut-input title="边框" placeholder="请输入留言" type="textarea" rows="3" border-bottom vertical input-border/>

        <text class="section">文字右对齐</text>
        <ut-input title="文字右对齐" placeholder="请输入文本" border :value-style="{textAlign: 'right'}"/>
        
        <div class="height-66"></div>
      </ut-scroller>
    </ut-nav-bar>
</template>

<script>
  import {UtCommonMixin} from 'weex-unisoft';
  export default {
    mixins: [UtCommonMixin],
    data() {
      return {
        value: '',
        value1: '',
        value2: '',
        value3: '',
        value4: ''
      }
    }
  };
</script>

<style src='../assets/css/global.css' />
<style scoped>
.section {
    padding: 30px;
    font-size: 28px;
    color: #999999;
}
.btn {
  font-size: 24px;
  text-align: center;
  color: white;
  padding: 0 16px;
  background-color:rgb(9, 160, 9);
  border-radius: 10px;
  height: 64px;
  line-height: 64px;
}
</style>