<template>
  <div class="loginbody">
    <div class="logindata">
      <div class="logintext title-wrap">
        <span class="title">
          {{ "美容管理中心" }}
        </span>
      </div>
      <div class="formdata">
        <el-form ref="form" :model="form" :rules="rules">
          <el-form-item prop="username">
            <el-input
              v-model="form.username"
              clearable
              placeholder="请输入账号"
            >
              <template slot="prepend"
                ><i style="font-size: 20px" class="el-icon-user"></i
              ></template>
            </el-input>
          </el-form-item>
          <el-form-item prop="password">
            <el-input
              v-model="form.password"
              clearable
              placeholder="请输入密码"
              show-password
            >
              <template slot="prepend"
                ><i style="font-size: 20px" class="el-icon-key"></i
              ></template>
            </el-input>
          </el-form-item>
        </el-form>
      </div>
      <div class="tool">
        <div>
          <el-checkbox v-model="checked" @change="remenber"
            >记住密码</el-checkbox
          >
        </div>
        <div>
          <span class="shou" @click="forgetpas">忘记密码？</span>
        </div>
      </div>
      <div class="butt">
        <el-button type="primary" @click="handleLogin">立即登录</el-button>

        <!-- <el-button ><router-link to="/register">注册</router-link></el-button> -->
      </div>
    </div>
  </div>
</template>
  
  <script>
// import { login } from "@/api/login";
// import { setToken } from "@/request/auth";
import axios from 'axios';
export default {
  // eslint-disable-next-line vue/multi-word-component-names
  name: "login",
  data() {
    return {    
      form: {
        password: "",
        username: "",
      },
      checked: false,
      rules: {
        username: [
          { required: true, message: "请输入用户名", trigger: "blur" },
          { max: 10, message: "不能大于10个字符", trigger: "blur" },
        ],
        password: [
          { required: true, message: "请输入密码", trigger: "blur" },
          { max: 10, message: "不能大于10个字符", trigger: "blur" },
        ],
      },
    };
  },
  mounted() {
    if (localStorage.getItem("news")) {
      this.form = JSON.parse(localStorage.getItem("news"));
      this.checked = true;
    }
  },
  created() {
    // 在组件创建时配置axios实例
    this.axiosInstance = axios.create({
      headers: {
        'Content-Type': 'application/json', // 设置内容类型为JSON
        // 在这里添加其他你需要的请求头，例如认证令牌
        // 'Authorization': 'Bearer ' + yourToken,
      },
    });
  },
  methods: {
  handleLogin() {
    // 将表单数据转换为JSON字符串
    const formData = JSON.stringify(this.form);
    
    // 使用配置好的axios实例来发送POST请求
    this.axiosInstance.post('http://localhost:10086/user/login', formData)
      .then((resp) => {
        let data = resp.data;
        if (data.success) {
          this.$message({
            message: '登录成功,欢迎来到后台管理系统',
            type: 'success'
          });
          this.$router.push({ path: '/home' });
        } else {
          // 登录失败时的处理逻辑
          console.error('登录失败:', data.message);
          // 可以给用户显示错误消息
        }
      })
      .catch((error) => {
        // 处理请求错误
        console.error('请求失败:', error);
      });
  },
    goToRegister() {
      this.$router.push('/register'); // 使用 Vue Router 导航到注册页面
    },
    remenber() {
      // 处理“记住密码”复选框的变化
      console.log('记住密码状态：', this.checked);
    },
    forgetpas() {
      // 处理“忘记密码？”点击事件
      console.log('点击了忘记密码');
      // 这里可以添加跳转到忘记密码页面的逻辑
    },
  },
};
</script>
  
  <style scoped lang="less">
.loginbody {
  width: 100%;
  height: 100%;
  min-width: 1000px;
  background-color: #2d3a4b;
  background-size: 100% 100%;
  background-position: center center;
  overflow: auto;
  background-repeat: no-repeat;
  position: fixed;
  line-height: 100%;
  padding-top: 150px;
  margin: -8px;
}

.logintext {
  margin-bottom: 20px;
  line-height: 50px;
  text-align: center;
  font-size: 30px;
  font-weight: bolder;
  color: white;
  text-shadow: 2px 2px 4px #000000;
}

.logindata {
  width: 400px;
  height: 300px;
  transform: translate(-50%);
  margin-left: 50%;
}

.tool {
  display: flex;
  justify-content: space-between;
  color: #606266;
}

.butt {
  margin-top: 10px;
  text-align: center;

}

.shou {
  cursor: pointer;
  color: #606266;
}
.title-wrap {
  filter: contrast(30);
  @keyframes showup {
    0% {
      letter-spacing: -20px;
    }

    100% {
      letter-spacing: 4px;
    }
  }
}

.title {
  letter-spacing: 4px;
  animation: showup 3s forwards;
}

// .el-form-item__label {
//     font-weight: bolder;
//     font-size: 15px;
//     text-align: left;
//   }
  
//  .el-button {
//     width: 100%;
//     margin-bottom: 10px;
  
//   } 
.router-link-exact-active, .router-link-active {
  display: block;
  color: #FFD04B; /* 这里设置您想要的活跃链接的颜色 */
  text-decoration: none; /* 移除下划线 */
  font-weight: bold; /* 设置加粗字体 */
}

a {
  display:block;
  color: #FFD04B; /* 这里设置普通链接的颜色 */
  text-decoration: none; /* 移除下划线 */
}
</style>
  