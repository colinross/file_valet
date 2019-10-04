<template>
  <b-table :data="items" 
           :columns="columns">
  </b-table>
</template>

<script>
import axios from 'axios';

export default {
  props: { 
    'endpoint-url': String,
    'columns': Array 
  },
  data() {
    return {
      errors: [],
      items: []
    }
  },
  mounted() {
    this.loading = true;
    axios
      .get(this.endpointUrl)
      .then(response => {
        console.log(response.data)
        response.data.forEach((item) => {
          this.items.push(item)
        })
      this.loading = false;
      })
      .catch(error => {
        this.loading = false;
        console.log(error);
      });
  }
}
</script>
