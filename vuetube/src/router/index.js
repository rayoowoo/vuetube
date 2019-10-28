import Vue from 'vue';
import Router from 'vue-router';
import Home from '../components/Home.vue';
import Login from '../components/Login.vue'
import Signup from '../components/Signup.vue'
import VideoPage from '../components/VideoPage.vue'
import PlaylistPage from '../components/PlaylistPage.vue'

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            name: 'Home',
            component: Home
        },
        {
            path: '/login',
            name: 'Login',
            component: Login
        },
        {
            path: '/signup',
            name: 'Signup',
            component: Signup
        },
        {
            path: '/videos/:videoId',
            name: 'VideoPage',
            component: VideoPage
        },
        {
            path: '/playlists/:playlistId',
            name: 'PlaylistPage',
            component: PlaylistPage
        }
    ]
})