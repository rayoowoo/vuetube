import Vue from 'vue'
import App from './App'
import router from './router'
import VueAxios from 'vue-axios'
import { securedAxiosInstance, plainAxiosInstance } from './backend/axios'

Vue.config.productionTip = false
Vue.use(VueAxios, {
    secured: securedAxiosInstance,
    plain: plainAxiosInstance
})

new Vue({
    el: '#app',
    router,
    securedAxiosInstance,
    plainAxiosInstance,
    render: h => h(App)
})