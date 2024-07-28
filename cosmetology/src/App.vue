<template>
<div>
  <router-view></router-view>
  <!-- <admin-view>
    
  </admin-view> -->
<!-- <login-view>
  
</login-view> -->
</div>
</template>

<script>

// import AdminView from './views/Homepage/AdminView.vue'
// import LoginView from './views/Login/LoginView.vue'
export default{
  // components: { AdminView },
  // components:{LoginView},
  data(){
    return {

    }
  },
  methods:{

  }
}
</script>
<style>

/* 覆盖Vue Router链接的默认样式 */
.router-link-exact-active, .router-link-active {
  display: block;
  color: #FFD04B; /* 这里设置您想要的活跃链接的颜色 */
  text-decoration: none; /* 移除下划线 */
  font-weight: bold; /* 设置加粗字体 */
}
 
/* 覆盖普通链接的默认样式 */
a {
  display:block;
  color: #FFD04B; /* 这里设置普通链接的颜色 */
  text-decoration: none; /* 移除下划线 */
}

/* 添加一个自定义的类来指定悬停时的文字颜色 */
.custom-menu .el-menu-item:hover {
  color: #FFD04B; /* 这里设置为红色 */
}

</style>
