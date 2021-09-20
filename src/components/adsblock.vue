<template>
  <div class="thumbnailDiv">รูปโฆษณา {{ data }}</div>
</template>

<script>
export default {
  props: {
    data: Object,
    required: true
  }
};
</script>

<style lang="scss" scoped>
.thumbnailDiv {
  width: 95%;
  margin: auto;
  padding: 10px;
  background-color: #05001e;
  border-radius: 10px;
}
</style>
