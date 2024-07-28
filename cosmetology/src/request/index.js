import axios from 'axios'
import store from '@/store'
import {getToken} from '@/request/token'
axios.defaults.withCredentials=true;//允许使用cookie
const service = axios.create({
  baseURL: process.env.BASE_API,
  timeout: 10000
})
//request拦截器
service.interceptors.request.use(config => {
  if (store.state.token) {
    config.headers['Oauth-Token'] = getToken()
  }
  return config
}, error => {
  Promise.reject(error)
})
export default service