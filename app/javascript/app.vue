<template>
  <div id="app">
    <div class="container">
      <h1 class="title">{{ title }}</h1>
      <h2 class="subtitle">{{ subtitle }}</h2>
        <slot></slot>      
    </div>
  </div>
</template>

<script>

export default {
  props: ["title", "subtitle"]
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
