import { axios } from '../index.js';

export default {
  getUser(id) {
    return axios.$get(`users/${id}`)
  },

  getUsers() {
    return axios.$get(`users`)
  }
}