<template>
  <div class="thumbnailDiv">
    <div>
      <!-- <img :src="require(`${filepic}`)" alt="" style="width:100%" /> -->
      <q-img :src="filepic" />
    </div>
    <div class="q-pa-sm">
      <div class="font18">{{ title }}</div>
      <div class="row justify-between">
        <div class="font14">{{ pt_access }}</div>
        <div class="font14">{{ typePic }}</div>
      </div>
      <div class="row justify-between">
        <div class="font14">ยอดวิวต่อสัปดาห์</div>
        <div class="font14">{{ viewPerWeek }}</div>
      </div>
      <div class="row justify-between">
        <div class="font14">ยอดวิวรวม</div>
        <div class="font14">{{ viewTotal }}</div>
      </div>
      <div class="font12 row">
        <div class="col-4 cursor-pointer" @click="editBtn"><u>แก้ไข</u></div>
        <div class="col-4 cursor-pointer" @click="sampleBtn">
          <u>ตัวอย่าง</u>
        </div>
        <div class="col-4 btgreen" v-show="status == 1" @click="onlineBtn">
          ออนไลน์
        </div>
        <div class="col-4 btred" v-show="status == 0" @click="offlineBtn">
          ออฟไลน์
        </div>
      </div>
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
      filepic: "",
      title: "",
      viewPerWeek: "",
      viewTotal: "",
      status: 0,
      id: 0,
      pt_access: "",
      typePic: ""
    };
  },
  methods: {
    loadPic() {
      setTimeout(() => {
        this.filepic =
          this.serverpath +
          "picture/" +
          this.data["pt_folder"] +
          "/00.jpg?x=" +
          Math.floor(Math.random() * 999) +
          100;
        this.title = this.data["pt_title"];
        this.viewPerWeek = this.data["statweek"];
        this.viewTotal = this.data["statview"];
        this.status = this.data["status"];
        this.id = this.data["pt_id"];
        this.pt_access = this.data["pt_access"];
        this.typePic = this.data["typePic"];
      }, 100);
    },
    sampleBtn() {
      this.$emit("show-sample", this.id);
    },
    editBtn() {
      this.$emit("edit-data", this.id);
    },
    async onlineBtn() {
      this.status = 0;
      let temp = {
        status: 0,
        pt_id: this.id
      };
      let url = this.serverpath + "bo_picture_on_off_line.php";
      let res = await axios.post(url, JSON.stringify(temp));
    },
    async offlineBtn() {
      this.status = 1;

      let temp = {
        status: 1,
        pt_id: this.id
      };
      let url = this.serverpath + "bo_picture_on_off_line.php";
      let res = await axios.post(url, JSON.stringify(temp));
    }
  },
  watch: {
    data: function(newData, oldData) {
      this.title = newData["pt_title"];
      this.filepic =
        this.serverpath +
        "picture/" +
        newData["pt_folder"] +
        "/00.jpg?x=" +
        Math.floor(Math.random() * 999) +
        100;
      this.viewPerWeek = newData["statweek"];
      this.viewTotal = newData["statview"];
      this.status = newData["status"];
      this.typePic = newData["typePic"];
      this.pt_access = newData["pt_access"];
      this.id = newData["pt_id"];
    }
  },
  mounted() {
    this.loadPic();
  }
};
</script>

<style lang="scss" scoped>
.btgreen {
  background-color: #9eee39;
  color: black;
  text-align: center;
  border-radius: 50px;
  cursor: pointer;
}
.btred {
  background-color: #ff2070;
  color: black;
  text-align: center;
  border-radius: 50px;
  cursor: pointer;
}
.thumbnailDiv {
  width: 90%;
  margin: auto;
  padding: 10px;
  background-color: #05001e;
  border-radius: 10px;
}
</style>
