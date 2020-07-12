<template>
  <div class="wrapper" :class="rootClass">
    <div class="container row front" @click="openURL">
      <p>{{ url.fullURL }}</p>
    </div>
    <div class="container row back" @click="openURL">
      <p>{{ url.shortURL }}</p>
    </div>
  </div>
</template>
<script lang="ts">
import Vue from "vue";

export default Vue.extend({
  name: "URLItem",
  props: {
    url: Object,
    rootClass: String,
  },
  methods: {
    openURL: function() {
      const a = document.createElement("a");
      a.href = this.url.shortURL;
      a.target = "_blank";
      a.click();
    },
  },
});
</script>

<style scoped>
.wrapper {
  position: relative;
  width: 300px;
  height: 100px;
}
.wrapper .back {
  transform: rotateY(180deg);
  z-index: 1;
  transition: all 0.4s ease-in-out;
}
.wrapper .front {
  z-index: 2;
  transform: rotateY(0deg);
  transition: all 0.4s ease-in-out;
}
.wrapper:hover .back {
  box-shadow: 0px 4px 6px #eee9;
  transform: rotateY(0deg);
  z-index: 2;
}
.wrapper:hover .front {
  box-shadow: 0px 4px 6px #eee9;
  transform: rotateY(180deg);
  z-index: 1;
}

.container {
  justify-content: space-between;
  background: linear-gradient(45deg, #eee, #efefef);
  border-radius: 25px;
  padding: 10px;
  margin-bottom: 10px;
  cursor: pointer;

  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;

  transition: box-shadow 0.4s ease-in-out;
}

span {
  width: 20px;
}
</style>
