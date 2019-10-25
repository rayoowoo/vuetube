<template>
  <div class="signup">

    <div class="signup-content">
        <h1>Sign up</h1>
        <h2>to use VueTube</h2>

      <form @submit.prevent="signup">
          <input v-model="username" type="username" placeholder="Username">
          <input v-model="password" type="password" placeholder="Password">
          <button>Create Account</button>
      </form>

      <div class="signup-existing-acct" v-on:click="nav">Already have an account?</div>
    </div>
  </div>
</template>

<script>
import {plainAxiosInstance} from '../backend/axios'
export default {
  name: "Signup",
  data() {
    return {
      username: '',
      password: '',
      error: '',
    }
  },
  methods: {
    signup() {
      plainAxiosInstance.post('/api/users', {username: this.username, password: this.password})
          .then(this.$router.push('/'));
    },
    nav() {
        this.$router.push('/login')
    }
  },
  created() {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.signup {
  width: 80em;
  margin: 0 auto;
}
.signup-content {
  margin: 10em auto;
  border-radius: 3px;
  padding: 6em 0;
  width: 30em;
  text-align: center;
  border: 1px solid black;
}

.signup h1 {
  font-size: 2em;
  font-weight: bold;
  margin-bottom: 0.5em;
}

.signup h2 {
  font-size: 1.25em;
  margin-bottom: 2em;
}

.signup-content form {
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

.signup-existing-acct {
  margin-top: 1.5em;
}

.signup-existing-acct:hover {
  text-decoration: underline;
  cursor: pointer;
}

</style>
