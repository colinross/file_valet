<template>
  <div class="section file-manager">
    <div v-for="item in items" v-bind:key="item.uuid">
      <payload-card :title="item.label" 
                    :description="item.description" 
                    :qrCodeDataUrl="item.qr_code"
                    >
      </payload-card>
    </div>
  </div>
</template>

<script>
import axios from 'axios';
import PayloadCard from './payload-card.vue'

export default {
  components: {
    'payload-card': PayloadCard
  },
  props: { 
    'endpoint-url': String
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

<style scoped>
.file-manager {
  flex-wrap: wrap;
}
</style>