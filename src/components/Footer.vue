<template>
  <img src="@/assets/slogan.svg" />
</template>
<style scoped>
img {
  width: 20%;
  margin: auto;
  object-fit: contain;
}
@media screen and (max-width: 1080px) {
  img {
    width: 60%;
  }
}
@media screen and (max-width: 375px) {
  img {
    width: 100%;
  }
}
</style>
