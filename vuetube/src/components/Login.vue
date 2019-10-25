<template>
  <div class="login">
      <h1>Sign in</h1>
      <h2>to continue to VueTube</h2>

    <form @submit.prevent="signin">
      <input type="hidden" name="authenticity_token" :value="csrf">
        <input v-model="username" type="username" placeholder="Username">
        <input v-model="password" type="password" placeholder="Password">
        <button>Submit</button>
    </form>

    <span>Create account</span>
  </div>
</template>

<script>
import {plainAxiosInstance} from '../backend/axios'
export default {
  name: "Login",
  data() {
    return {
      username: '',
      password: '',
      error: '',
      csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content')

    }
  },
  methods: {
    signin() {
      plainAxiosInstance.post('/api/session', {username: this.username, password: this.password})
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.login {
  width: 80em;
  height: 100em;
  margin: 0 auto;
}
</style>
