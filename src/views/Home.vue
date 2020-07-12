<template>
  <div class="home">
    <Header />
    <br />
    <FormCreator />
    <br />
    <Footer />
  </div>
</template>

<script>
import Header from "@/components/Header";
import FormCreator from "@/components/FormCreator";
import Footer from "@/components/Footer";

export default {
  name: "Home",
  components: {
    Header,
    FormCreator,
    Footer
  }
};
</script>
