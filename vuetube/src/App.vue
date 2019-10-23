<template>
  <div id="app">
    <Navbar />
  </div>
</template>

<script>
import Navbar from './components/Navbar'

export default {
  name: 'app',
  components: {
    Navbar
  },
  data() {
    return {
      // videos // an array of objects, video objects
    }
  }
}
</script>

<style>
/* CSS reset parameters */
 body, h1, h2, h3, p, li, ul, ol, nav, section, header, footer, strong, div, span, aside, a, button, form, input, textarea {
    margin: 0;
    padding: 0;
    border: 0;
    outline: 0;
    font: inherit;
    text-decoration: inherit;
    background: transparent;
 }

 ul, ol {
     list-style: none;
 }

 a:-webkit-any-link {
     color: rgb(136, 54, 54);
 }
</style>
