<template>
  <div class="fullscreen  bgshow">
    <div class="fixed-center">
      <img src="../../public/images/bglogin.png" alt="" />
    </div>
    <div class="fixed-center">
      <img src="../../public/images/rocket.png" alt="" />
    </div>
    <div class="avatar " align="center">
      <img src="../../public/images/avatar.png" alt="" />
      <div v-if="typePage == 1">
        <div>
          <q-input
            v-model="input.username"
            outlined
            style="width:320px;"
            class="q-pt-md"
            label="ชื่อผู้ใช้งาน"
          ></q-input>
        </div>
        <div>
          <q-input
            v-model="input.password"
            outlined
            style="width:320px;"
            class="q-pt-md"
            label="รหัสผ่าน"
            :type="isPwd ? 'password' : 'text'"
            @keyup.enter="loginBtn"
          >
            <template v-slot:append>
              <q-icon
                :name="isPwd ? 'visibility_off' : 'visibility'"
                class="cursor-pointer"
                @click="isPwd = !isPwd"
              />
            </template>
          </q-input>
        </div>
        <div class="q-pt-md">
          <q-btn
            class="bluebtn"
            label="เข้าสู่ระบบ"
            push
            @click="loginBtn"
            size="xl"
          />
        </div>
      </div>
      <div style="width:320px;" v-else class="text-blue-grey-10 font24">
        <div>ยินดีต้อนรับ คุณ {{ user.name }}</div>
        <div class="q-pt-md">
          <q-btn
            class="bluebtn"
            label="เข้าสู่ระบบ"
            push
            @click="loginBtn2"
            size="xl"
          />
        </div>
        <div class="q-pt-md font18 cursor-pointer" @click="resetData">
          <u>เข้าสู่ระบบโดยใช้ชื่อผู้ใช้งานอื่น</u>
        </div>
      </div>
    </div>
    <q-dialog v-model="showError" persistent>
      <div class="bgdialog">
        <div class="bginside font18">
          ไม่สามารถเข้าระบบได้
        </div>
        <div class="bginside2 font18">
          <div class="q-pt-md">
            <img src="../../public/images/exclaim.png" alt="" />
          </div>
          <div>ชื่อผู้ใช้งาน/รหัสผ่านไม่ถูกต้อง</div>
          <div>กรุณาตรวจสอบชื่อผู้ใช้งาน/รหัสผ่านอีกครั้ง</div>
          <div class="q-pt-md">
            <q-btn
              class="bluebtnmd font18"
              label="ตกลง"
              @click="showError = false"
            />
          </div>
        </div>
      </div>
    </q-dialog>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      input: {
        username: "",
        password: ""
      },
      isPwd: true,
      tokenData: "",
      typePage: 1, //1 login , 2 welcome back
      user: {
        name: ""
      },
      showError: false
    };
  },
  methods: {
    async loginBtn() {
      // Login ใน case ปกติ
      let data = {
        username: this.input.username,
        password: this.input.password
      };
      let url = this.serverpath + "bo_checklogin.php";
      let res = await axios.post(url, JSON.stringify(data));

      if (res.data.id === null) {
        this.showError = true;
      } else {
        this.$q.localStorage.set("token", res.data.token);
        this.$q.localStorage.set("username", res.data.username);
        this.$q.localStorage.set("role", res.data.role);
        this.$q.localStorage.set("roleid", res.data.roleid);
        this.$q.localStorage.set("menuselected", 0);
        this.$router.push("/welcome");
      }
    },
    async checkToken() {
      //เมื่อ Login แล้วกลับมาอีกครั้ง ทำการ check ว่ามี login ค้างไว้หรือไหม?
      this.tokenData = this.$q.localStorage.getItem("token");
      if (this.tokenData !== null) {
        let data = { token: this.tokenData };
        let url = this.serverpath + "bo_checktoken.php";
        let res = await axios.post(url, JSON.stringify(data));
        if (res.data.userid === null) {
          localStorage.clear();
        } else {
          this.typePage = 2;
          this.user.name = res.data.realname;
        }
      }
    },
    loginBtn2() {
      //Login เมื่อ checkToken ผ่าน
      this.$q.localStorage.set("menuselected", 0);
      this.$router.push("/welcome");
    },
    resetData() {
      //เมื่อต้องการ Login ใน account คนอื่น เมื่อ CheckToken
      localStorage.clear();
      this.typePage = 1;
    }
  },
  mounted() {
    this.checkToken();
  }
};
</script>

<style lang="scss" scoped>
.bgshow {
  background-image: url("../../public/images/bg.jpg");
  background-size: cover;
  background-position: center;
}
.avatar {
  position: absolute;
  top: 35%;
  left: calc(50% - 500px);
}
</style>
