<template>
  <div class="tile is-child card">
    <div class="card-content">
      <div class="media-content">
        <p class="title">{{ this.title }}</p>
        <p class="subtitle">{{ this.description }}</p>
        <button class="button is-primary is-medium"
            @click="isQrModalActive = true">
            View QRCode
        </button>

        <b-modal :active.sync="isQrModalActive">
            <figure class="image is-128x128">
                <img :src="this.qrCodeDataUrl" width="200px" />
            </figure>
        </b-modal>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    title: String,
    description: String,
    qrCodeDataUrl: String,
    isQrModalActive: Boolean
  },
  data() {
    return {
      data: this.data
    }
  },
}
</script>

<style scoped>

</style>