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
            class="el-menu-vertical-demo"
            @close="handleClose"
            default-active="2"
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
          <header style="background-color:rgb(238, 241, 246); display: block;height: 45px;font-size: 20px;text-align: center;border-radius: 30px;line-height: 45px;">服务项目管理界面</header>
          <br>
          <el-form :inline="true" :model="searchForm" class="demo-form-inline">
                        <el-form-item label="服务类型">
                            <el-input v-model="searchForm.name" placeholder="服务类型"></el-input>
                        </el-form-item>
                        <el-form-item label="价格"> 
                        <el-input v-model="searchForm.price" placeholder="价格"></el-input>   
                        </el-form-item>
                        <el-form-item>
                            <el-button type="primary" @click="onSearch">查询</el-button>
                        </el-form-item>
                    </el-form>


          <el-button type="success" icon="el-icon-edit" @click="add" style="margin-right:10px;">新增</el-button>

          <el-dialog title="新增表单" :visible.sync="formvisible" width="35%" ref="formRef">
            <el-form
              :model="form"
              label-width="80px"
              style="padding-right: 20px"
            >
                      <el-form-item label="服务id">
                      <el-input v-model="form.id" placeholder="请输入服务id"></el-input>
                      </el-form-item>
                      <el-form-item label="服务类型"> 
                      <el-input v-model="form.name" placeholder="请输入服务类型"></el-input>   
                      </el-form-item>
                      <el-form-item label="服务描述"> 
                      <el-input v-model="form.description" placeholder="请输入服务描述"></el-input>   
                      </el-form-item>
                      <el-form-item label="价格"> 
                      <el-input v-model="form.price" placeholder="请输入价格"></el-input>   
                      </el-form-item>
            </el-form>
               <div slot="footer" class="dialog-footer">
              <el-button @click="formvisible = false">取 消</el-button>
              <el-button type="primary" @click="formvisible = false,save"
                >确 定</el-button
              >
            </div>
            </el-dialog>



          <el-button type="danger" icon="el-icon-delete" @click="delBatch">批量删除</el-button>

            <el-table :data="tableData" @selection-change="handleSelectionChange">
              <el-table-column
             type="selection"
            width="55">
           </el-table-column>
              <el-table-column prop="id" label="服务id" width="130">
            </el-table-column>
            <el-table-column prop="name" label="服务类型" width="130">
            </el-table-column>
            <el-table-column prop="description" label="服务描述" width="200">
            </el-table-column>
            <el-table-column prop="price" label="价格" width="140">
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
               name:"",
               price:"",
      
            },
            ids:[]
    };
  },

  mounted () {
        //发送异步请求,获取数据
        axios.get("http://localhost:10086/care/getAllCare").then((result) => {
            this.tableData = result.data;  
        });
    },

  methods: {

    save(){
        this.$refs.formRef.validate((valid)=>{
          if(valid){
            this.$request({
              url:this.form.id?'此处放后端更新功能api':'此处放后端新增功能api',
              methods:this.form.id?'put':'post',
              data:this.form
            }).then(res=>{
              if(res.code === '200'){
                this.$message.success('保存成功')
                this.formvisible=false
              }else{
                this.$message.error(res.msg)
              }
            })
            }    
        })
    },


    delBatch(){
      if(!this.ids.length){
        this.$message.warning('请选择数据')
        return
      }
      this.$confirm('您确定批量删除这些数据吗','确认删除',{type:"warning"}).then(response=>{
        console.log(response)
        this.$request.delete('此处填写批量删除功能api',{data:this.ids}).then(res => {
          if(res.code === '200'){
            this.$message.success('操作成功')
            this.tableData=res.data//可能报错刷新页面
        }else{
            this.$message.error(res.msg)
        }
      })
        }).catch(()=>{})
    },

     handleSelectionChange(row) {
        this.ids = row.map(v=>v.id)

    },
      
       add(){
        this.form = {}; //新增数据的时候清空表单数据
      // 弹出对话框或者跳转到增加用户页面，根据需求进行操作
      this.formvisible = true; // 假设使用Vue Router，跳转到增加用户页面

      },  
      
      del(id) {
        this.$confirm('您确定删除吗','确认删除',{type:"warning"}).then(response=>{
          console.log(response)
        this.$request.delete('此处填写删除功能api'+id).then(res => {
          if(res.code === '200'){
            this.$message.success('操作成功')
            this.tableData=res.data//可能报错刷新页面
        }else{
            this.$message.error(res.msg)
        }
      })
        }).catch(()=>{})
    },

    editor(row) {
        this.form=JSON.parse(JSON.stringify(row))
        this.formvisible = true
    },

    onSearch() {
              // 查询功能
            // 向后端发送查询请求，根据searchForm中的数据进行查询
          axios.post('http://localhost:10086/care/getCareByPrice', this.searchForm )
      .then(response => {
        this.tableData =[response.data.data]; // 将查询结果赋值给tableData，用于渲染表格
      })
      .catch(error => {
        console.error('查询失败:', error);
      });
    },

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
    
      // handleSelect(key, keyPath) {
      //   console.log(key, keyPath);
      // }
    },
    onSearch() {
      // 执行搜索操作
    }
};
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