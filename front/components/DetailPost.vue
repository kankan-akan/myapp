<template>
  <div>
    <v-dialog
      v-model="dialog"
      v-if="post"
      width="850"
    >
      <v-card>
        <div class="d-flex flex-nowrap justify-space-between">
          <v-img
            v-if="post.image.url"
            :src="post.image.url"
            max-height="500"
            max-width="480"
            contain
          ></v-img>
          <v-sheet
            v-else
            class="grey lighten-2 d-flex justify-center align-center"
            height="500"
            width="480"
          >
            <v-icon size="80">mdi-image</v-icon>
          </v-sheet>
          <v-col>
            <div class="d-flex justify-space-around">
              <UserIdLavel :user=post.user />
              <div>
                <v-icon large @click="close">mdi-close</v-icon>
              </div>
            </div>
            <v-col class="kaigyo">{{ post.content }}</v-col>
          </v-col>
        </div>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  props: ['dialog', 'post'],

  methods: {
    close() {
      this.$emit('result', { res: true})
    }

  }
}
</script>
