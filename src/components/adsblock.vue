<template>
  <div class="thumbnailDiv">
    <div class="row items-center">
      <div class="col-6 q-pl-md">
        <div class="headerText">{{ title }}</div>
        <div>URL ปลายทาง {{ target }}</div>
      </div>
      <div class="headerBox row items-center col-4" align="center">
        <div class="col-3 q-pa-sm">
          <div class="borderR">
            <div>วันที่ใช้</div>
            <div>64 วัน</div>
          </div>
        </div>
        <div class="col-3">
          <div class="borderR">
            <div>น้ำหนัก</div>
            <div>{{ weight }}%</div>
          </div>
        </div>
        <div class="col-6" style="font-size:35px;">{{ statview }} คลิ๊ก</div>
      </div>
      <div class="col-2 row" align="center">
        <div class="underLine col">
          แก้ไข
        </div>
        <div v-show="status == 1" class="col btgreen" @click="onlineBtn">
          ออนไลน์
        </div>
        <div v-show="status == 0" class="col btred" @click="offlineBtn">
          ออฟไลน์
        </div>
      </div>
    </div>
    <div class="q-pt-sm"><hr style="width:98%" /></div>
    <div class="row q-pa-md items-center">
      <div class="col-2">สำหรับ Mobile</div>
      <div><img :src="filePic01" alt="" /></div>
    </div>
    <div class="row q-pa-sm items-center">
      <div class="col-2">สำหรับ Tablet</div>
      <div><img :src="filePic02" alt="" /></div>
    </div>
    <div class="row q-pa-sm items-center">
      <div class="col-2">สำหรับ PC</div>
      <div><img :src="filePic03" alt="" /></div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
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
      id: "",
      target: "",
      weight: 0,
      status: 0,
      statview: 0
    };
  },
  methods: {
    async onlineBtn() {
      this.status = 0;
      let temp = {
        status: 0,
        at_id: this.id
      };
      let url = this.serverpath + "bo_ads_on_off_line.php";
      let res = await axios.post(url, JSON.stringify(temp));
    },
    async offlineBtn() {
      this.status = 1;

      let temp = {
        status: 1,
        at_id: this.id
      };
      let url = this.serverpath + "bo_ads_on_off_line.php";
      let res = await axios.post(url, JSON.stringify(temp));
    }
  },
  mounted() {
    this.title = this.data.at_title;
    this.target = this.data.at_target;
    this.weight = this.data.at_weight;
    this.statview = this.data.statview;
    this.status = this.data.status;
    this.id = this.data.at_id;
    this.filePic01 =
      this.serverpath +
      "ads/" +
      this.data.at_folder +
      "/mobile.jpg?x=" +
      Math.floor(Math.random() * 999) +
      100;
    this.filePic02 =
      this.serverpath +
      "ads/" +
      this.data.at_folder +
      "/tablet.jpg?x=" +
      Math.floor(Math.random() * 999) +
      100;
    this.filePic03 =
      this.serverpath +
      "ads/" +
      this.data.at_folder +
      "/pc.jpg?x=" +
      Math.floor(Math.random() * 999) +
      100;
  },
  watch: {
    data: function(newData, oldData) {
      this.title = newData["at_title"];
      this.target = newData["at_target"];
      this.weight = newData["at_weight"];
      this.statview = newData["statview"];
      this.status = newData["status"];
      this.id = newData["at_id"];
      this.filepic01 =
        this.serverpath +
        "ads/" +
        newData["at_folder"] +
        "/mobile.jpg?x=" +
        Math.floor(Math.random() * 999) +
        100;

      this.filepic02 =
        this.serverpath +
        "ads/" +
        newData["at_folder"] +
        "/tablet.jpg?x=" +
        Math.floor(Math.random() * 999) +
        100;
      this.filepic03 =
        this.serverpath +
        "ads/" +
        newData["at_folder"] +
        "/pc.jpg?x=" +
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
.borderR {
  border-right: 1px solid white;
}
.btgreen {
  width: 70%;
  background-color: #9eee39;
  color: black;
  text-align: center;
  border-radius: 50px;
  cursor: pointer;
}
.btred {
  width: 70%;
  background-color: #ff2070;
  color: black;
  text-align: center;
  border-radius: 50px;
  cursor: pointer;
}
</style>
