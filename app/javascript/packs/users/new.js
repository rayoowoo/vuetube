import Vue from 'vue/dist/vue';
import UsersNewView from 'views/users/new';

new Vue({
    el: '#users-new-view',
    components: {
        'users-new-view': UsersNewView
    }
});