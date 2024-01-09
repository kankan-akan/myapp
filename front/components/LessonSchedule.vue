<template>
  <div>
    <v-col class="d-flex align-center">
      <div class="mr-4 font-weight-bold">レッスン時間: </div>
      <div>{{ calendar.lesson_time }} 分</div>
    </v-col>
    <v-col class="d-flex align-center">
      <div class="mr-4 font-weight-bold">開始時間:</div>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time1"
      >
        {{ calendar.start_time1 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time2"
      >
        {{ calendar.start_time2 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time3"
      >
        {{ calendar.start_time3 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time4"
      >
        {{ calendar.start_time4 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time5"
      >
        {{ calendar.start_time5 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time6"
      >
        {{ calendar.start_time6 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time7"
      >
        {{ calendar.start_time7 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time8"
      >
        {{ calendar.start_time8 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time9"
      >
        {{ calendar.start_time9 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time10"
      >
        {{ calendar.start_time10 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time11"
      >
        {{ calendar.start_time11 }}
      </v-chip>
      <v-chip
        class="youbi"
        color="indigo"
        v-if="calendar.start_time12"
      >
        {{ calendar.start_time12 }}
      </v-chip>
    </v-col>
    <v-col class="d-flex align-center">
      <div class="mr-4 font-weight-bold">休業日:</div>
      <v-chip v-if="calendar.sun" class="youbi" color="blue darken-1">{{ calendar.sun }}</v-chip>
      <v-chip v-if="calendar.mon" class="youbi" color="blue darken-1">{{ calendar.mon }}</v-chip>
      <v-chip v-if="calendar.tue" class="youbi" color="blue darken-1">{{ calendar.tue }}</v-chip>
      <v-chip v-if="calendar.wed" class="youbi" color="blue darken-1">{{ calendar.wed }}</v-chip>
      <v-chip v-if="calendar.thu" class="youbi" color="blue darken-1">{{ calendar.thu }}</v-chip>
      <v-chip v-if="calendar.fri" class="youbi" color="blue darken-1">{{ calendar.fri }}</v-chip>
      <v-chip v-if="calendar.sat" class="youbi" color="blue darken-1">{{ calendar.sat }}</v-chip>
    </v-col>
  </div>
</template>

<script>
export default {
  props:['calendar']
}
</script>

<style scoped>
  .youbi {
    margin-right: 10px;
    color: white;

  }

</style>