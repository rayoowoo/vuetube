<template>
  <div class="login">

    <div class="login-content">
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
      csrf: null
    }
  },
  methods: {
    signin() {
      plainAxiosInstance.post('/api/session', {username: this.username, password: this.password})
    }
  },
  created() {
    this.csrf = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.login {
  width: 80em;
  margin: 0 auto;
}
.login-content {
  margin: 10em auto;
  border-radius: 3px;
  padding: 6em 0;
  width: 30em;
  text-align: center;
  border: 1px solid black;
}

.login h1 {
  font-size: 2em;
  font-weight: bold;
  margin-bottom: 0.5em;
}

.login h2 {
  font-size: 1.25em;
  margin-bottom: 2em;
}

.login-content form {
  display: flex;
  flex-direction: column;
  text-align: center;
  margin-bottom: 3em;
}

input {
  border: 1px solid black;
  padding: 0.5em;
  width: 20em;
  align-self: center;
  margin-bottom: 0.25em;
  box-sizing: border-box;
}

button {
  margin-top: 2em;
  border: 1px solid black;
  align-self: center;
  padding: 0.5em 0;
  width: 20em;
  box-sizing: border-box;
}

button:hover {
  background-color: lightgray;
  cursor: pointer;
}

</style>
