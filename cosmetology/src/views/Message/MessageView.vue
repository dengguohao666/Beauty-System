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
            class="el-menu-vertical-demo"
            @close="handleClose"
            default-active="2"
            style="margin: 10px auto;"
            background-color="#545C64"
            text-color="#fff"
            active-text-color="#ffd04b">
              <template slot="title"><i class="el-icon-s-operation" >信息系统管理</i></template>
              <el-menu-item index="1-1">
              <router-link to="/person"><i class="el-icon-user">个人中心</i></router-link></el-menu-item>
              <el-menu-item index="1-2">
              <router-link to="/usermange"><i class="el-icon-s-custom">用户管理   </i></router-link></el-menu-item>
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

          <el-table :data="tableData" @selection-change="handleSelectionChange">
            <el-table-column type="selection" width="55"> </el-table-column>
            <el-table-column prop="id" label="订单id" width="110">
            </el-table-column>
            <el-table-column prop="userId" label="用户id" width="120">
            </el-table-column>
            <el-table-column prop="createdTime" label="预约时间" width="130">
            </el-table-column>
            <el-table-column prop="updatedTime" label="修改时间" width="130">
            </el-table-column>
            <el-table-column prop="content" label="服务描述" width="120">
            </el-table-column>
            <el-table-column label="操作" width="130">
              <el-button type="primary" size="mini" @click="editor"
                >编辑</el-button
              >
              <el-button type="warn" size="mini" @click="del"
                >删除</el-button
              >
            </el-table-column>
          </el-table>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import axios from 'axios';
 export default {
    data(){
       return{
        tableData:[],
        userName: '张三',
        content:'',
        id:'',
        userId:'',
        createdTime:'',
        updatedTime:''
       } 
    },

    mounted () {
        // 发送异步请求,获取数据
        axios.get("http://localhost:10086/info/getAllInfo").then((result) => {
            this.tableData = result.data;  
        });
    },
    methods: {
     // 发起请求获取用户信息的方法
    //  fetchUserInfo() {
    //   axios.get('放后端api地址') // 替换成你的用户信息API地址
    //     .then(response => {
    //       // 假设后台返回的用户信息格式如下：{ avatarUrl: '...', userName: '...' }
    //       this.userName = response.data.userName;
    //     })
    //     .catch(error => {
    //       console.error('Error fetching user info:', error);
    //       // 在这里处理错误，比如显示错误消息或重置用户信息
    //       this.userName = '';
    //     });
    // },

}
 }
</script>

<style scope>
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