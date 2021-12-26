<template>
  <div style="max-width:1600px; margin:auto;">
    <div class="contentDiv ">
      <div class="q-pt-md" align="right">
        <q-input
          v-model="searchText"
          dark
          outlined
          dense
          placeholder="ค้นหาชื่อผู้ใช้งานหรือเบอร์มือถือ"
          style="width:300px;"
        />
      </div>
      <div class="q-pa-md ">
        <div class="row  borderTitle  ">
          <div class="col-3 q-pl-md">ชื่อผู้ใช้งาน</div>
          <div class="col-3 ">เบอร์มือถือ</div>
          <div class="col-2" align="center">สถานะ</div>
          <div class="col-2 " align="center">วัน-เวลาสมัคร</div>
          <div class="col-2" align="center">รายละเอียด</div>
        </div>
        <div style="height:20px;"></div>
        <div
          v-for="(item, index) in data"
          :key="index"
          class="row lineData textHover"
          :class="[index % 2 ? 'bg-strip' : '']"
        >
          <div class="col-3 q-pl-xl">{{ item.username }}</div>
          <div class="col-3 ">{{ phoneNumber(item.telephone) }}</div>
          <div class="col-2" align="center">
            <div
              v-if="item.status == 1"
              class="greenUseDiv"
              @click="onOffUser(0, item.id)"
            >
              ใช้งานได้
            </div>
            <div v-else class="redNotUseDiv" @click="onOffUser(1, item.id)">
              ปิดการใช้
            </div>
          </div>
          <div class="col-2" align="center">{{ item.timestamp }}</div>
          <div class="col-2 disableText" align="center"><u>รายละเอียด</u></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      searchText: "",
      data: []
    };
  },
  methods: {
    //load ข้อมูล user
    async loadData() {
      let url = this.serverpath + "bo_user.php";
      let res = await axios.get(url);
      this.data = res.data;
    },
    //convert number to phone number format
    phoneNumber(number) {
      return (
        number.substring(0, 3) +
        "-" +
        number.substring(3, 6) +
        "-" +
        number.substring(6)
      );
    },
    async onOffUser(onOffUser, id) {
      let dataSend = {
        onOff: onOffUser,
        id: id
      };
      console.log(dataSend);
      let url = this.serverpath + "bo_user_on_off_line.php";
      let res = await axios.post(url, JSON.stringify(dataSend));
      this.loadData();
    }
  },
  mounted() {
    this.loadData();
  }
};
</script>

<style lang="scss" scoped>
.borderTitle {
  border: 1px solid #fef3f9;
  margin-top: 20px;
  margin-right: 15px;
  padding: 15px;
  height: 70px;
  border-radius: 35px;
  line-height: 45px;
}
.greenUseDiv {
  background-color: #c5ee90;
  color: #0b0422;
  width: 84px;
  height: 25px;
  line-height: 25px;
  text-align: center;
  border-radius: 100px;
  cursor: pointer;
}
.redNotUseDiv {
  background-color: #ff8888;
  color: #0b0422;
  width: 84px;
  height: 25px;
  line-height: 25px;
  text-align: center;
  border-radius: 100px;
  cursor: pointer;
}
.disableText {
  color: #6b6b6b;
}
.lineData {
  line-height: 45px;
  padding-left: 15px;
  padding-right: 15px;
  margin-right: 10px;
  color: #9e93c0;
}
.bg-strip {
  background-color: #0b0422;
}
.textHover:hover {
  color: #fc6285;
}
</style>
