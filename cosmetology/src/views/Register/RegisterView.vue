<template>
  <div id="poster">
    <el-form 
    v-model="ruleForm"
    ref="ruleForm" 
    label-width="0px"
    class="rcontainer"
    >
        <h3 class="rtitle">
          美容系统注册
          <el-button @click="toLogin()">去登陆</el-button>
        </h3>
      <el-form-item label="" prop="user" >
        <el-input
          type="text"
          v-model="ruleForm.user"
          autocomplete="off"
          placeholder="请输入用户账号"
          prefix-icon="el-icon-user"
          >
        </el-input>
      </el-form-item>
      <el-form-item label="" prop="password">
        <el-input 
        type="password"
        v-model.number="ruleForm.pass"
        autocomplete="off"
        placeholder="请输入密码"
        prefix-icon="el-icon-lock">
        
      </el-input>
      </el-form-item>

      <el-form-item label="" prop="checkPass">
        <el-input
          type="password"
          v-model="ruleForm.checkPass"
          autocomplete="off"
          placeholder="请确认密码"
          prefix-icon="el-icon-lock"
        ></el-input>
      </el-form-item>
   
      <el-form-item>
        <el-button type="primary" style="background: #505458;border: none;" @click="submitForm(ruleForm)">注册</el-button>
          <el-button @click="resetForm('ruleForm')">重置</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>
   
  <script>

  export default{
    name:'FormName',
    data() {
      var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.ruleForm.rulePass !== '') {
            this.$refs.ruleForm.validateField('checkPass')
          }
          callback();
        }
      };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.ruleForm.pass) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
      };
      return {
        ruleForm: {
          user:'',
          pass: '',
          checkPass: '',
      
        },
        rules: {
          user:[
            {require: true,message:"请输入你的名称",trigger:'blur'},
            {min: 2,max:9,message:"长度为2到9个字符",trigger:'blur'}
          ],
          pass: [
            { validator: validatePass, trigger: 'blur' }
          ],
          checkPass: [
            { validator: validatePass2, trigger: 'blur' }
          ],
        }
      };
    },
    methods: {
      submitForm() {
        this.axios.post('https://mock.apifox.cn/m1/3128855-0-default/emp/deleteById',this.ruleForm).then((resp)=>{
        let data = resp.data;
      if(data.success){
        this.ruleForm={}
        this.$message({
          message: '恭喜你注册成功,点击去登录按钮进行登录吧',
          type:'success'
        });
      }
    })
  },
    resetForm(formName) {
        this.$refs[formName].resetFields();
      },

    toLogin(){
      this.$router.push({path:'/login'})
    }
    },
  }


</script>

  <style>
  #poster{
    min-width: 1000px;
    background-position:center center;
    background-color:#2d3a4b ;
    height: 100%;
    width: 100%;
    background-size: cover;
    position: fixed;
    margin: 0px;
    padding: 0px;
    margin: -8px;
  }
    .rcontainer{
      border-radius: 15px;
      background-clip: padding-box;
      margin: 90px auto;
      width: 350px;
      padding: 35px 35px 15px 35px;
      background: #fff;
      border: 1px solid #eaeaea;
      /* box-shadow: 0 0 25px #cac6c6; */

    }

   .rtitle{
      margin: 0px auto 40px auto;
      text-align: center;
      color: #505458;
    }
</style>
