<template>
  <div class="thumbnailDiv">
    รูปโฆษณา {{ data }}
    <div class="row items-center">
      <div class="col-5">
        <div class="headerText">{{ title }}</div>
        <div>URL ปลายทาง</div>
      </div>
      <div class="headerBox row col-4" align="center">
        <div class="col-3 q-pa-sm">
          <div>วันที่ใช้</div>
          <div>64 วัน</div>
        </div>
        <div class="col-3">
          <div>น้ำหนัก</div>
          <div>25%</div>
        </div>
        <div class="col-6">640 คลิ๊ก</div>
      </div>
      <div class="col-3 row" align="center">
        <div class="underLine row col" align="center">แก้ไข</div>
        <div class="col">
          <q-btn color="positive" label="ออนไลน์" rounded />
        </div>
      </div>
    </div>
    <div class="brx">เส้นกั้น</div>
    <div class="row q-pa-sm items-center">
      <div class="col-2">สำหรับ Mobile</div>
      <div><img :src="filePic01" alt="" /></div>
    </div>
    <div class="row q-pa-sm items-center">
      <div class="col-2">สำหรับ Tablet</div>
      <div><img src="../../public/images/tabletPic.jpg" alt="" /></div>
    </div>
    <div class="row q-pa-sm items-center">
      <div class="col-2">สำหรับ PC</div>
      <div><img src="../../public/images/pcPic.jpg" alt="" /></div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    data: Object,
    required: true
  },
  data() {
    return {
      filePic01: "",
      filePic02: "",
      filePic03: "",
      title: "",
      id: ""
    };
  },
  mounted() {
    this.title = this.data.at_title;
    this.filePic01 =
      this.serverpath +
      "ads/" +
      this.data.at_folder +
      "/mobile.jpg?x=" +
      Math.floor(Math.random() * 999) +
      100;
  },
  watch: {
    data: function(newData, oldData) {
      this.title = newData["at_title"];
      this.filepic01 =
        this.serverpath +
        "ads/" +
        newData["at_folder"] +
        "/mobile.jpg?x=" +
        Math.floor(Math.random() * 999) +
        100;

      this.id = newData["at_id"];
    }
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
.headerText {
  font-size: 30px;
}
.headerBox {
  border: 1px solid white;
}
.underLine {
  text-decoration: underline;
}
</style>
