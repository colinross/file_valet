<template>
  <div id="app">
    <h1>{{ title }}</h1>
    <slot></slot>
  </div>
</template>

<script>

export default {
  props: ["title"]
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
