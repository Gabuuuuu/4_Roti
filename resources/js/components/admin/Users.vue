<template>
  <div>
    <section>
      <TheHeader></TheHeader><br />
      <div class="p-4">
        <router-link to="/adminp">
          <button class="btn btn-dark btn-outline-light btn-lg px-6 mb-4">
            Inapoi
          </button>
        </router-link>
        <table class="table table-striped">
          <thead class="thead-dark table-dark">
            <tr>
              <th scope="col"><div class="text-center">ID Utilizator</div></th>
              <th scope="col">
                <div class="text-center">Nume Utilizator</div>
              </th>
              <th scope="col"><div class="text-center">Email</div></th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="user in users" :key="user.index">
              <td scope="row">
                <div class="text-center">{{ user.user_id }}</div>
              </td>
              <td scope="row">
                <div class="text-center">{{ user.name }}</div>
              </td>
              <td scope="row">
                <div class="text-center">{{ user.email }}</div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <TheFooter class="fixed-bottom"></TheFooter>
    </section>
  </div>
</template>

<script>
import TheFooter from "../layout/TheFooter.vue";
import TheHeader from "../layout/TheHeader.vue";
export default {
  components: { TheHeader, TheFooter },
  data() {
    return {
      users: [],
    };
  },
  created() {
    this.loadUsers();
  },
  methods: {
    async loadUsers() {
      const response = await axios.get("api/users");
      this.users = response.data;
    },
  },
};
</script>

<style scoped></style>
