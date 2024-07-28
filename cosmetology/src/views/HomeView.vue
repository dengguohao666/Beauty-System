<template>
    <div>
      <el-container style="height: 800px; border: 1px solid #eee">
    
        <el-header style="padding: 0;">
        <el-menu class="nav-menu" mode="horizontal" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
          <el-menu-item index="1">首页</el-menu-item>
          <el-menu-item index="2">关于我们</el-menu-item>
          <el-menu-item index="3">联系我们</el-menu-item>
        </el-menu>
  
        <!-- 用户信息区域 -->
        <el-dropdown class="user-dropdown">
          <span class="user-info">

            <span class="user-name">{{ userName }}</span>
          </span>
          <el-dropdown-menu slot="dropdown">
            <el-dropdown-item divided>
              <router-link to="/login">退出登录</router-link>
            </el-dropdown-item>
  
          </el-dropdown-menu>
        </el-dropdown>
  
        </el-header>
        <el-container>
          <el-aside width="200px" style="background-color:#545C64">
            <el-menu
            style="margin: 10px auto;"
              default-active="2"
              class="el-menu-vertical-demo"
              background-color="#545C64"
              text-color="#fff"
              active-text-color="#ffd04b"
            >
              <template slot="title"
                ><i class="el-icon-s-operation">信息系统管理</i></template
              >
              <el-menu-item index="1-1">
                <router-link to="/person"
                  ><i class="el-icon-user">个人中心</i></router-link
                ></el-menu-item
              >
              <el-menu-item index="1-2">
                <router-link to="/usermange"
                  ><i class="el-icon-s-custom">用户管理</i></router-link
                ></el-menu-item
              >
              <el-menu-item index="1-3">
              <router-link to="service">
              <i class="el-icon-bank-card">服务项目管理</i></router-link>
              </el-menu-item>
  
              <el-menu-item index="1-4">
                  <router-link to="/booking">
                  <i class="el-icon-bell">预约管理</i></router-link>
              </el-menu-item>
              
              <el-menu-item index="1-5">
                  <router-link to="/message">
                      <i class="el-icon-message">通知管理</i>
                  </router-link></el-menu-item>
                  
            </el-menu>
          </el-aside>
  
          <el-main>
         
          </el-main>
        </el-container>
      </el-container>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  export default {
    data() {
      return {
        userName: '张三',

        imageUrl: '',
        personalInfo: {
          name: "",
          age: "",
          username: "",
          email: "",
          phone: "",
          // 其他个人信息字段
        },
        originalPersonalInfo: {}, // 保存原始的个人信息，用于编辑时的恢复
        isEditing: false // 标志是否处于编辑状态
      };
    },
    methods: {
   // 发起请求获取用户信息的方法
   fetchUserInfo() {
        axios.get('放后端api地址') // 替换成你的用户信息API地址
          .then(response => {
            // 假设后台返回的用户信息格式如下：{ avatarUrl: '...', userName: '...' }
            this.userAvatar = response.data.avatarUrl;
            this.userName = response.data.userName;
          })
          .catch(error => {
            console.error('Error fetching user info:', error);
            // 在这里处理错误，比如显示错误消息或重置用户信息
            this.userAvatar = '';
            this.userName = '';
          });
      },
    },
  };
  </script>
  
  <style scope>
  
  h2 {
    text-align: center;
  }
  
  
  .box-card {
    width: 500px;
    margin: auto auto;
    position: absolute;
    
  }
  
  .avatar-uploader .el-upload {
      border: 1px dashed #d9d9d9;
      border-radius: 6px;
      cursor: pointer;
      position: relative;
      overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
      border-color: #409EFF;
    }
    .avatar-uploader-icon {
      font-size: 28px;
      color: #8c939d;
      width: 178px;
      height: 178px;
      line-height: 178px;
      text-align: center;
    }
    .avatar {
      width: 178px;
      height: 178px;
      display: block;
    }
  
    .demo-input-suffix{
      text-align: center;
  }
  
  .header-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  
  .user-info {
    display: flex;
    align-items: center;
  }
  
  .user-info .el-avatar {
    margin-top: 5px; /* 根据需要调整头像与名字之间的间距 */
  }
  
  .title-col {
    display: flex;
    align-items: center;
  }
  
  .el-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 20px;
    background-color: #545C64;
  }
  
  .nav-menu {
    margin-right: auto; /* 将导航菜单推到左侧 */
  }
  
  .user-dropdown {
    display: flex;
    align-items: center;
  }
  
  .user-name { 
  
    align-items: center;
    color: #faf9f7;
    font-size: 16px;
    margin-left:10px;
    margin-right:10px;
  }
  </style>
  
    
    