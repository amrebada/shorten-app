<template>
  <div class="center container">
    <p class="emptyArea" v-if="!urls.length">
      No URL has created
    </p>
    <ul v-else>
      <urlItem v-for="url in urls" :key="url.id" :url="url" />
    </ul>
    <button class="prev" @click="prev" v-if="urls.length">prev</button>
    <p v-if="urls.length">
      {{ offset / limit + 1 }} / {{ (count / limit) | round }}
    </p>
    <button class="next" @click="next" v-if="urls.length">next</button>
  </div>
</template>
<script lang="ts">
import Vue from "vue";
import urlItem from "@/components/URLItem.vue";
import config from "@/config";

export default Vue.extend({
  name: "list",
  mounted() {
    this.loadUrls();
  },
  data() {
    return {
      urls: [],
      count: 0,
      offset: 0,
      limit: 3,
    };
  },
  components: {
    urlItem,
  },
  methods: {
    loadUrls() {
      fetch(`${config.API_URL}/url?limit=${this.limit}&offset=${this.offset}`, {
        method: "GET",
      })
        .then((r) => r.json())
        .then((j) => {
          if (j.success) {
            this.urls = j.data.urls;
            this.count = j.data.count;
          }
        })
        .catch((e) => console.error(e));
    },
    prev() {
      if (this.offset > 1) {
        this.offset -= this.limit;
        this.loadUrls();
      }
    },
    next() {
      const diff = this.count - this.offset;
      if (diff > this.limit) {
        this.offset += this.limit;
        this.loadUrls();
      }
    },
  },
  filters: {
    round(num: number) {
      return Math.ceil(num);
    },
  },
});
</script>

<style scoped>
.container {
  background: white;
  border: 10px solid white;
  border-radius: 25px;
  margin-top: 10px;
  position: relative;
  padding-bottom: 20px;
}
ul {
  list-style: none;
  padding: 0px;
}
button {
  border: 0px;
  color: white;
  width: 80px;
  height: 40px;
  border-radius: 10px;
  position: absolute;
  bottom: -30px;
  cursor: pointer;
  font-weight: bold;
  transition: box-shadow 0.4s ease-in-out;
}

button:focus {
  outline: none;
}
button:hover {
  box-shadow: 0px 4px 8px #ccc;
}

.next {
  background-image: linear-gradient(225deg, #6586fd, #315bf1);
  right: 10%;
}
.prev {
  background-image: linear-gradient(225deg, #fe7150, #f75734);
  left: 10%;
}
</style>
