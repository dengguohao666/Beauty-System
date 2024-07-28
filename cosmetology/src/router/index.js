import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'login',
    component: () => import( '../views//Login/LoginView.vue')
  },

  {
    path: '/person',
    name: 'person',
    component: () => import( '../views/Service/PersonView.vue')
  },

  {
    path: '/usermange',
    name: 'usermange',
    component: () => import('../views/Homepage/UserMangerView.vue')
  },

  {
    path: '/service',
    name: 'service',
    component: () => import('../views/ServiceProject/ServiceView.vue')
  },

  {
    path: '/message',
    name: 'message',
    component: () => import('../views/Message/MessageView.vue')
  },


  {
    path: '/booking',
    name: 'booking',
    component: () => import('../views/Booking/BookingView.vue')
  },

  {
    path: '/register',
    name: 'register',
    component: () => import('../views/Register/RegisterView.vue')
  },

  {
    path: '/home',
    name: 'home',
    component: () => import('../views/HomeView.vue')
  },


 {
  path: '/',
  redirect:'/login'
} 

]

const router = new VueRouter({
  routes
})

export default router
