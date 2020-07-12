<template>
  <div id="app">
    <div id="nav">
      <router-link to="/">Home</router-link>&nbsp;|
      <router-link to="/list">List</router-link>
    </div>
    <router-view />
  </div>
</template>

<style>
body {
  background-color: #e7ebfa;
}
* {
  color: #445983;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #315bf1;
}
.row {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  align-items: center;
}
.center {
  width: fit-content;
  margin: auto;
}
.text-center {
  text-align: center;
}
</style>
