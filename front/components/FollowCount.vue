<template>
  <v-row>
    <v-col v-if="user.followings">
      <div class="d-flex justify-center">フォロー中</div>
      <div 
        class="cursor d-flex justify-center" 
        @click.stop="followingDialog = true"
      >
        {{ user.followings.length }}
      </div>
      <v-dialog
        v-model="followingDialog"
        scrollable
        max-width="450"
      >
        <v-card>
          <v-card-title>フォロー中</v-card-title>
          <v-divider></v-divider>
          <v-card-text style="height: 450px;">
            <v-col
              v-for="(following, i) in user.followings"
              :key="i"
            >
              <v-row dense>
                <div class="ma-2">
                  <v-avatar v-if="following.avatar.url" size="60">
                    <img :src="following.avatar.url">
                  </v-avatar>
                  <v-avatar v-else size="60" color="indigo">
                    <v-icon dark size="40">mdi-account</v-icon>
                  </v-avatar>
                </div>
                <v-col class="d-flex align-center justify-space-between">
                  <div>
                    <div class="text-h6">{{ following.name }}</div>
                    <div>@{{ following.user_id }}</div>
                  </div>
                  <FollowButton :user="following" />
                </v-col>
              </v-row>
            </v-col>
          </v-card-text>
        </v-card>
      </v-dialog>
    </v-col>

    <v-col v-if="user.followers">
      <div class="d-flex justify-center">フォロワー</div>
      <div
        class="cursor d-flex justify-center"
        @click.stop="followerDialog = true"
      >
        {{ user.followers.length }}
      </div>
      <v-dialog
        v-model="followerDialog"
        scrollable
        max-width="450"
      >
        <v-card>
          <v-card-title>フォロワー</v-card-title>
          <v-divider></v-divider>
          <v-card-text style="height: 450px;">
            <v-col
              v-for="(follower, i) in user.followers"
              :key="i"
            >
              <v-row dense>
                <div class="ma-2">
                  <v-avatar v-if="follower.avatar.url" size="60">
                    <img :src="follower.avatar.url">
                  </v-avatar>
                  <v-avatar v-else size="60" color="indigo">
                    <v-icon dark size="40">mdi-account</v-icon>
                  </v-avatar>
                </div>
                <v-col class="d-flex align-center justify-space-between">
                  <div>
                    <div class="text-h6">{{ follower.name }}</div>
                    <div>@{{ follower.user_id }}</div>
                  </div>
                  <FollowButton :user="follower" />
                </v-col>
              </v-row>
            </v-col>
          </v-card-text>
        </v-card>
      </v-dialog>
    </v-col>
  </v-row>
</template>

<script>
export default {
  props: ['user'],

  data: () => ({
    followingDialog: false,
    followerDialog: false

  })

}
</script>
