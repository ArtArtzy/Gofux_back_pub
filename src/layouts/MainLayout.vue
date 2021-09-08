<template>
  <q-layout view="lHh Lpr lFf">
    <div class="fullscreen bgmain ">
      <div
        style="max-width:1600px; margin:auto;"
        class=" bgmainpage shadow-10 "
      >
        <div class="leftdrawer shadow-3 ">
          <div class="q-pl-md relative-position">
            <img src="../../public/images/toppink.png" alt="" />
            <div class="nametag font20">
              <div>{{ username }}</div>
              <div>{{ role }}</div>
            </div>
          </div>
          <div class="q-px-lg column colmenu justify-between">
            <div style="width:290px;">
              <!-- จัดการหน้าเว็บไซด์ -->
              <div
                class="row  cursor-pointer"
                v-show="accessMenu.frontpanel != 3"
                @click="websiteBtn"
                :class="[menuSelected == 1 ? 'boxdivSelect' : 'boxdiv']"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-laptop" size="27px" />
                </div>
                <div class="q-pl-xl  fontColor">จัดการหน้าเว็บไซด์</div>
              </div>

              <div class="" v-show="accessMenu.frontpanel != 3">
                <hr />
              </div>

              <!-- นักแสดงยอดนิยม  -->
              <div
                class="row   cursor-pointer"
                v-show="accessMenu.actress != 3"
                @click="actressBtn"
                :class="[menuSelected == 2 ? 'boxdivSelect' : 'boxdiv']"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-user" size="27px" />
                </div>
                <div class="q-pl-xl   fontColor">นักแสดงยอดนิยม</div>
              </div>

              <!-- หนังโป๊ -->
              <div
                class="row q-pt-lg  cursor-pointer"
                v-show="accessMenu.movie != 3"
                @click="movieBtn"
                :class="[menuSelected == 3 ? 'boxdivSelect' : 'boxdiv']"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-video" size="27px" />
                </div>
                <div class="q-pl-xl fontColor">หนังโป๊</div>
              </div>

              <!-- การ์ตูน -->
              <div
                class="row q-pt-lg  cursor-pointer"
                v-show="accessMenu.cartoon != 3"
                @click="cartoonBtn"
                :class="[menuSelected == 4 ? 'boxdivSelect' : 'boxdiv']"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-book-open" size="27px" />
                </div>
                <div class="q-pl-xl fontColor">การ์ตูน</div>
              </div>

              <!-- เล่าเรื่องเสียว -->
              <div
                class="row q-pt-lg cursor-pointer"
                v-show="accessMenu.story != 3"
                @click="storyBtn"
                :class="[menuSelected == 5 ? 'boxdivSelect' : 'boxdiv']"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-newspaper" size="27px" />
                </div>
                <div class="q-pl-xl fontColor">เล่าเรื่องเสียว</div>
              </div>

              <!-- แจกวาร์ป -->
              <div
                class="row q-pt-lg   cursor-pointer"
                v-show="accessMenu.picture != 3"
                @click="pictureBtn"
                :class="[menuSelected == 6 ? 'boxdivSelect' : 'boxdiv']"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-images" size="27px" />
                </div>
                <div class="q-pl-xl fontColor">แจกวาร์ป</div>
              </div>

              <div class="">
                <hr />
              </div>

              <!-- โฆษณา -->
              <div
                class="row   cursor-pointer"
                v-show="accessMenu.ads != 3"
                @click="adsBtn"
                :class="[menuSelected == 7 ? 'boxdivSelect' : 'boxdiv']"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-film" size="27px" />
                </div>
                <div class="q-pl-xl fontColor ">โฆษณา</div>
              </div>

              <!-- วิเคราะห์การใช้งาน -->
              <div
                class="row q-pt-lg cursor-pointer"
                @click="analysisBtn"
                :class="[menuSelected == 8 ? 'boxdivSelect' : 'boxdiv']"
                v-show="accessMenu.stat != 3"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-chart-line" size="27px" />
                </div>
                <div class="q-pl-xl fontColor">วิเคราะห์การใช้งาน</div>
              </div>

              <!-- สมาชิก -->
              <div
                class="row q-pt-lg  cursor-pointer"
                @click="userBtn"
                :class="[menuSelected == 9 ? 'boxdivSelect' : 'boxdiv']"
                v-show="accessMenu.member != 3"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-users" size="27px" />
                </div>
                <div class="q-pl-xl fontColor">สมาชิก</div>
              </div>

              <!-- ผู้ดูแลระบบ -->
              <div
                class="row q-pt-lg  cursor-pointer"
                @click="usersystemBtn"
                :class="[menuSelected == 10 ? 'boxdivSelect' : 'boxdiv']"
                v-show="accessMenu.system != 3"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-users-cog" size="27px" />
                </div>
                <div class="q-pl-xl fontColor">ผู้ดูแลระบบ</div>
              </div>
            </div>

            <!-- ออกจากระบบ -->
            <div class="logoutdiv " style="width:290px;">
              <div><hr /></div>
              <div
                class="row cursor-pointer boxdiv cursor-pointer"
                @click="logoutBtn"
              >
                <div class="q-pl-md">
                  <q-icon name="fas fa-sign-out-alt" size="27px" />
                </div>
                <div class="q-pl-xl fontColor">ออกจากระบบ</div>
              </div>
              <div style="height:10px"></div>
            </div>
          </div>
        </div>

        <q-page-container>
          <router-view />
        </q-page-container>
        <q-dialog v-model="showlogOut" persistent>
          <div class="bgdialog">
            <div class="bginside font18">
              ออกจากระบบ
            </div>
            <div class="bginside2 font18">
              <div class="q-pt-md">
                <img src="../../public/images/question.png" alt="" />
              </div>
              <div class="q-pt-md">คุณต้องการที่จะออกจากระบบ</div>
              <div></div>
              <div class="row q-pl-md justify-between">
                <div class="q-pt-md">
                  <q-btn
                    class="outlineblue font18"
                    outline
                    label="ยกเลิก"
                    @click="showlogOut = false"
                  />
                </div>
                <div class="q-pt-md q-pr-md">
                  <q-btn
                    class="bluebtnmd font18"
                    label="ตกลง"
                    @click="logoutAction"
                  />
                </div>
              </div>
            </div>
          </div>
        </q-dialog>
      </div>
    </div>
  </q-layout>
</template>

<script>
import axios from "axios";
export default {
  name: "MainLayout",

  data() {
    return {
      username: this.$q.localStorage.getItem("username"),
      role: this.$q.localStorage.getItem("role"),
      showlogOut: false, //แสดง Dialog logout
      menuSelected: this.$q.localStorage.getItem("menuselected"),
      accessMenu: {
        actress: 1,
        ads: 1,
        cartoon: 1,
        frontpanel: 1,
        member: 1,
        movie: 1,
        picture: 1,
        stat: 1,
        story: 1,
        system: 1
      }
    };
  },
  methods: {
    //ออกจากระบบ
    logoutBtn() {
      //ปุ่ม ออกจากระบบ ในหน้าเมนู ทำการเปิดเมนู logout
      this.showlogOut = true;
    },
    logoutAction() {
      //ปุ่ม ตกลง ใน Dialog logout
      localStorage.clear();
      this.$router.push("/");
    },
    usersystemBtn() {
      //ปุ่ม ผู้ดูแลระบบ ในหน้าเมนู ทำการเปิดหน้า usersystem
      if (this.menuSelected != 10) {
        this.menuSelected = 10;
        this.$q.localStorage.set("menuselected", 10);
        this.$router.push("/usersystem");
      }
    },
    userBtn() {
      //ปุ่ม สมาชิก ในหน้าเมนู ทำการเปิดหน้า user
      if (this.menuSelected != 9) {
        this.menuSelected = 9;
        this.$q.localStorage.set("menuselected", 9);
        this.$router.push("/user");
      }
    },
    analysisBtn() {
      //ปุ่ม วิเคราะห์การใข้งาน ในหน้าเมนู ทำการเปิดหน้า วิเคราะห์การใช้งาน
      if (this.menuSelected != 8) {
        this.menuSelected = 8;
        this.$q.localStorage.set("menuselected", 8);
        this.$router.push("/analysis");
      }
    },
    adsBtn() {
      //ปุ่ม โฆษณา ในหน้าเมนู ทำการเปิดหน้า โฆษณา
      if (this.menuSelected != 7) {
        this.menuSelected = 7;
        this.$q.localStorage.set("menuselected", 7);
        this.$router.push("/ads");
      }
    },
    pictureBtn() {
      //ปุ่ม แจกวาร์ป ในหน้าเมนู ทำการเปิดหน้า แจกวาร์ป
      if (this.menuSelected != 6) {
        this.menuSelected = 6;
        this.$q.localStorage.set("menuselected", 6);
        this.$router.push("/picture");
      }
    },
    storyBtn() {
      //ปุ่ม แจกวาร์ป ในหน้าเมนู ทำการเปิดหน้า แจกวาร์ป
      if (this.menuSelected != 5) {
        this.menuSelected = 5;
        this.$q.localStorage.set("menuselected", 5);
        this.$router.push("/story");
      }
    },
    cartoonBtn() {
      //ปุ่ม การ์ตูน ในหน้าเมนู ทำการเปิดหน้า การ์ตูน
      if (this.menuSelected != 4) {
        this.menuSelected = 4;
        this.$q.localStorage.set("menuselected", 4);
        this.$router.push("/cartoon");
      }
    },
    movieBtn() {
      //ปุ่ม หนัง ในหน้าเมนู ทำการเปิดหน้า หนัง
      if (this.menuSelected != 3) {
        this.menuSelected = 3;
        this.$q.localStorage.set("menuselected", 3);
        this.$router.push("/movie");
      }
    },
    actressBtn() {
      //ปุ่ม นักแสดงยอดนิยม ในหน้าเมนู ทำการเปิดหน้า นักแสดง
      if (this.menuSelected != 2) {
        this.menuSelected = 2;
        this.$q.localStorage.set("menuselected", 2);
        this.$router.push("/actress");
      }
    },
    websiteBtn() {
      //ปุ่ม จัดการหน้าเว็บไซด์ ในหน้าเมนู ทำการเปิดหน้า จัดการหน้าเว็บไซด์
      if (this.menuSelected != 1) {
        this.menuSelected = 1;
        this.$q.localStorage.set("menuselected", 1);
        this.$router.push("/website");
      }
    },
    async checkAccess() {
      //ทำการ check สิทธิในการแสดงเมนู
      let roleid = this.$q.localStorage.getItem("roleid");
      let temp = {
        roleid: roleid
      };
      let url = this.serverpath + "bo_checkaccess.php";
      let res = await axios.post(url, JSON.stringify(temp));
      this.accessMenu.actress = Number(res.data[0].actress);
      this.accessMenu.ads = Number(res.data[0].ads);
      this.accessMenu.cartoon = Number(res.data[0].cartoon);
      this.accessMenu.frontpanel = Number(res.data[0].frontpanel);
      this.accessMenu.member = Number(res.data[0].member);
      this.accessMenu.movie = Number(res.data[0].movie);
      this.accessMenu.pictue = Number(res.data[0].picture);
      this.accessMenu.stat = Number(res.data[0].stat);
      this.accessMenu.story = Number(res.data[0].story);
      this.accessMenu.system = Number(res.data[0].system);
    }
  },
  mounted() {
    this.checkAccess();
  }
};
</script>
<style scoped>
.leftdrawer {
  width: 330px;
  height: 100vh;
  background-color: rgba(18, 13, 14, 0.6);
}
.bgmain {
  background-image: url("../../public/images/bgmain.jpg");
  background-size: cover;
  background-position: center;
}
.bgmainpage {
  background-color: rgba(12, 6, 44, 0.85);
}
.nametag {
  position: absolute;
  top: 30px;
  left: 135px;
}
hr {
  border: 1px solid rgba(215, 215, 215, 0.2);
}
.boxdiv:hover {
  /* padding: 10px;
  border-radius: 50px;
  background: linear-gradient(
    90deg,
    rgba(242, 40, 169, 1) 0%,
    rgba(253, 106, 128, 0) 100%
  ); */
  color: #fe6d7e;
}
.boxdiv {
  padding: 10px;
  border-radius: 50px;
  color: #887acd;
}
.boxdiv .fontColor {
  color: white;
}
.boxdiv:hover .fontColor {
  color: #fe6d7e;
}
.logoutdiv {
  position: relative;
  bottom: 0px;
}
.colmenu {
  height: calc(100vh - 140px);
  width: 320px;
}
.boxdivSelect {
  padding: 10px;
  border-radius: 50px;
  background: linear-gradient(
    90deg,
    rgba(242, 40, 169, 1) 0%,
    rgba(253, 106, 128, 0) 100%
  );
  color: white;
}
</style>
