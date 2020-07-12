<template>
  <div>
    <div class="row center">
      <input
        type="text"
        v-model="shorturl"
        :class="[error ? 'errorborder' : '']"
        placeholder="http://...."
      />
      <button v-on:click="submit" :disabled="loading">
        <loading-icon
          w="32px"
          h="32px"
          class="ionicon"
          rootClass="rotate"
          v-if="loading"
        />
        <send-icon w="32px" h="32px" class="ionicon" v-else />
      </button>
    </div>
    <br />
    <url-item
      v-if="createdurl.shortURL"
      :url="createdurl"
      rootClass="center itemInfo"
    />
  </div>
</template>
<script lang="ts">
import Vue from "vue";
import SendIcon from "vue-ionicons/dist/ios-send.vue";
import LoadingIcon from "vue-ionicons/dist/ios-refresh.vue";
import config from "@/config";
import urlItem from "@/components/URLItem.vue";

export default Vue.extend({
  name: "shorturl-form",
  data() {
    return { shorturl: "", loading: false, error: false, createdurl: {} };
  },
  methods: {
    submit() {
      this.checkError();
      if (!this.error) {
        this.loading = true;
        fetch(config.API_URL + "/url", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({
            url: this.shorturl,
          }),
        })
          .then((r) => r.json())
          .then((j) => {
            if (j.success) {
              this.createdurl = j.data;
            }
            this.shorturl = "";
            this.loading = false;
          })
          .catch((e) => {
            console.error(e);
            this.loading = false;
          });
      }
    },
    checkError() {
      if (this.shorturl.length) {
        this.error = false;
      } else {
        this.error = true;
      }
    },
  },
  components: {
    SendIcon,
    LoadingIcon,
    urlItem,
  },
});
</script>
<style scoped>
.rotate {
  animation: rotation 0.6s 0s infinite ease;
}
@keyframes rotation {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}
.ionicon {
  fill: white;
}
input[type="text"] {
  border: 10px solid white;
  background: linear-gradient(to bottom, #e7eefc, #fafafa);
  height: 50px;
  width: 200px;
  border-radius: 20px;
  padding: 0px 10px;
  font-size: 1.2rem;
}
input:focus {
  outline: none;
}
input.errorborder {
  border: 10px solid tomato;
}
button {
  width: 70px;
  height: 70px;
  background-image: linear-gradient(225deg, #6586fd, #315bf1);
  border: 0px;
  border-radius: 15px;
  color: white;
  margin-left: 10px;
  font-weight: bold;
  cursor: pointer;
}
button:focus {
  outline: none;
}
.itemInfo {
  border: 10px solid white;
  border-radius: 25px;
  background: white;
}
</style>
