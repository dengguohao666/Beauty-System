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
            default-active="2"
            style="margin: 10px auto;"
            background-color="#545C64"
            text-color="#fff"
            active-text-color="#ffd04b">
              <template slot="title"><i class="el-icon-s-operation" >信息系统管理</i></template>
              <el-menu-item index="1-1">
              <router-link to="/person"><i class="el-icon-user">个人中心</i></router-link></el-menu-item>
              <el-menu-item index="1-2">
              <router-link to="/usermange"><i class="el-icon-s-custom">用户管理</i></router-link></el-menu-item>
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
          <header style="background-color:rgb(238, 241, 246); display: block;height: 45px;font-size: 20px;text-align: center;border-radius: 30px;line-height: 45px;">用户管理界面</header>
          <br>
          <el-form :inline="true" :model="searchForm" class="demo-form-inline">

                       <el-form-item label="用户id"> 
                        <el-input v-model="searchForm.id" placeholder="请输入用户id"></el-input>   
                        </el-form-item>
                        <el-form-item label="用户名">
                            <el-input v-model="searchForm.username" placeholder="请输入用户名"></el-input>
                        </el-form-item>
                        <el-form-item label="姓名"> 
                        <el-input v-model="searchForm.name" placeholder="请输入用户姓名"></el-input>   
                        </el-form-item>
                        <el-form-item label="用户密码"> 
                        <el-input v-model="searchForm.password" placeholder="请输入用户密码"></el-input>   
                        </el-form-item>
                        <el-form-item label="用户手机号"> 
                        <el-input v-model="searchForm.phone" placeholder="请输入用户手机号"></el-input>   
                        </el-form-item>
                        
                        <el-form-item>
                            <el-button type="primary" @click="onSearch">查询</el-button>
                        </el-form-item>
                    </el-form>

          <el-button type="success" icon="el-icon-edit" @click="add" style="margin-right:10px;">新增</el-button>

          <el-dialog title="新增数据" :visible.sync="formvisible" width="35%" ref="formRef">
            <el-form
              :model="form"
              label-width="80px"
              style="padding-right: 20px"
            >
            <el-form-item label="用户id">
                <el-input
                  v-model="form.id"
                  placeholder="请输入用户id"
                ></el-input>
              </el-form-item>
              <el-form-item label="用户名">
                <el-input
                  v-model="form.username"
                  placeholder="请输入用户名"
                ></el-input>
              </el-form-item>

              <el-form-item label="用户姓名">
                <el-input
                  v-model="form.name"
                  placeholder="请输入用户姓名"
                ></el-input>
              </el-form-item>

              <el-form-item label="用户密码">
                <el-input
                  v-model="form.password"
                  placeholder="请输入用户密码"
                ></el-input>
                </el-form-item>
                <el-form-item label="手机号">
                <el-input
                  v-model="form.phone"
                  placeholder="请输入用户手机号"
                ></el-input>
              </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
              <el-button @click="formvisible = false">取 消</el-button>
              <el-button type="primary" @click="save"
                >确 定</el-button
              >

              <el-button type="primary" @click="editCompleted">编辑完成</el-button
              >
            </div>
          </el-dialog>


          <el-button type="danger" icon="el-icon-delete" @click="del">批量删除</el-button>


          <el-table ref="table" :data="tableData" @selection-change="handleSelectionChange">
            <el-table-column
             type="selection"
            width="55">
           </el-table-column>

            <el-table-column prop="id" label="用户id" width="110">
            </el-table-column>
            <el-table-column prop="username" label="用户名" width="130">
            </el-table-column>
            <el-table-column prop="name" label="用户姓名" width="130">
            </el-table-column>
            <el-table-column prop="password" label="用户密码" width="130">
            </el-table-column>
            <el-table-column prop="phone" label="手机号" width="140">
            </el-table-column>
            <el-table-column label="操作" width="130">
              <el-button type="primary" size="mini" @click="editor">编辑</el-button>
              <el-button type="warn" size="mini" @click="del">删除</el-button>
            </el-table-column>

          </el-table>

        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      userName: '张三',
      tableData: [],
      formvisible: false,
      form: {},
      searchForm: {
        id: "",
        username: "",
        password: "",
        phone: "",
        name:""

      },
      ids:[]
    };
  },

  mounted () {

      // 在组件创建时配置axios实例
      this.axiosInstance = axios.create({
      headers: {
        'Content-Type': 'application/json', // 设置内容类型为JSON
        // 在这里添加其他你需要的请求头，例如认证令牌
        // 'Authorization': 'Bearer ' + yourToken,
      },
    });
        //发送异步请求,获取数据
        axios.get("http://localhost:10086/user/getAllUser").then((result) => {
            this.tableData = result.data.data;  
        });
    },

      methods: {  
        save(){
          // 发送 POST 请求将表单数据发送到后端保存
    axios.post('http://localhost:10086/admin/addUser', this.form)
      .then(response => {
        // 在此处处理保存成功的情况，例如显示成功消息或重新加载数据等
        console.log(response.data); // 假设服务器返回的数据包含一些有用的信息
        
        // 在这里可以选择重新加载数据列表等操作
        // 例如，如果使用了 Vuex 来管理数据，则可以提交一个 action 来重新加载数据列表
        // this.$store.dispatch('fetchData');
        // 关闭新增数据表单
        this.formvisible = false;
        this.tableData = response.data; 
        this.$message.success('数据保存成功！');
        window.location.reload();
        this.$message.success('数据保存成功！');
      })
      .catch(error => {
        // 在此处处理保存失败的情况，例如显示错误消息等
        console.error('保存数据时出错:', error);
        this.$message.error('保存数据时出错，请稍后重试！');
      });
          
        },

    //     delBatch(){
    //   if(!this.ids.length){
    //     this.$message.warning('请选择数据')
    //     return
    //   }
    //   this.$confirm('您确定批量删除这些数据吗','确认删除',{type:"warning"}).then(response=>{
    //     console.log(response)
    //     this.$request.delete('此处填写批量删除功能api',{data:this.ids}).then(res => {
    //       if(res.code === '200'){
    //         this.$message.success('操作成功')
    //         this.tableData=res.data//可能报错刷新页面
    //     }else{
    //         this.$message.error(res.msg)
    //     }
    //   })
    //     }).catch(()=>{})
    // },

    handleSelectionChange(row) {
        this.ids = row.map(v=>v.id)
    },

        add(){
          this.form = {}; //新增数据的时候清空表单数据
      // 弹出对话框或者跳转到增加用户页面，根据需求进行操作
      this.formvisible = true; // 假设使用Vue Router，跳转到增加用户页面
        },

        del() {
           // 获取选中的行数据
            const selectedRows = this.$refs.table.selection;
            if (selectedRows.length === 0) {
          // 如果没有选中任何行，给出提示
          this.$message.error('请选择要删除的数据！');
            return;
            }
          // 获取选中行的用户id，假设用户id存储在'id'字段中
            const selectedIds = selectedRows.map(row => row.id);
        // 在表单数据中过滤掉选中行的数据
              this.tableData = this.tableData.filter(row => !selectedIds.includes(row.id));
              // 发送异步请求,删除数据
              // this.selectedRows=JSON.parse(JSON.stringify(selectedRows))
              this.axios.post("http://localhost:10086/admin/deleteUser", {selectedIds}
              ).then((result) => {
                console.log(result.data.data); // 假设服务器返回的数据包含一些有用的信息
                this.$message.success('数据删除成功！');
                this.tableData  = this.tableData.filter(item => !selectedIds.includes(item.id));
                });
        //   可以在这里发送请求将删除的数据同步到后端数据库
    },

    editor(row) {
        this.form=JSON.parse(JSON.stringify(row))
        this.formvisible = true
    },

    editCompleted() {
    // 执行修改操作
        this.axios.post('http://localhost:10086/admin/modifyUser', this.form)
        .then(response => {
          let data =response.data
          if (data.success) {
          //  this.mounted;
           this.formvisible = false;
           this.tableData=data;
           this.$message.success('修改成功');
           window.location.reload();
          } else {
            this.$message.error('修改失败，请重试');
              }
            })
            },

        onSearch() {
          axios.post("http://localhost:10086/user/getUserByUserId", this.searchForm)
      .then((result) => {
         this.tableData=[result.data.data];
    })
  }
    ,
    mounted() {
      },
           // 发起请求获取用户信息的方法
     fetchUserInfo() {
      axios.get('放后端api地址') // 替换成你的用户信息API地址
        .then(response => {
          // 假设后台返回的用户信息格式如下：{ avatarUrl: '...', userName: '...' }
          this.userName = response.data.userName;
        })
        .catch(error => {
          console.error('Error fetching user info:', error);
          // 在这里处理错误，比如显示错误消息或重置用户信息
          this.userName = '';
        });
    },
      },
    }

</script>
<style scope>
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