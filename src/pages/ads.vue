<template>
  <div style="max-width:1600px; margin:auto;">
    <div class="contentDiv ">
      <div class="q-pt-md">
        <div class="row justify-end">
          <div class="row btncustom" @click="dialogHowToUpload = true">
            <div class="q-px-md">
              <q-icon name="fas fa-cloud-upload-alt" />
            </div>
            <div>วิธีการอัพโหลด</div>
          </div>
          <div style="width: 15px;"></div>
          <div class="row btncustom" @click="openNewAds()">
            <div class="q-px-md">
              <q-icon name="fas fa-plus" />
            </div>
            <div>เพิ่มโฆษณา</div>
          </div>
        </div>
      </div>
      <div class="q-pt-md">
        <ads-block></ads-block>
      </div>
    </div>
    <!-- Dialog เพิ่ม ads ใหม่ -->
    <q-dialog v-model="dialogNewAds" persistent>
      <q-card
        style="max-width: 1000px;width:800px;height:450px;"
        class="bgdialogbig"
      >
        <div class="bginsidebig font30 " style="line-height:105px;">
          เพิ่มโฆษณาใหม่
        </div>
        <div class="bginsidebig2 font14" style="height:335px;">
          <div class="row q-pt-lg" style="width:70%;margin:auto">
            <div class="col-1 q-pt-sm" style="width: 120px">ชื่อแคมเปญ</div>
            <div class="col">
              <q-input v-model="input.title" dark outlined dense rounded />
            </div>
          </div>
          <div class="row q-pt-md" style="width:70%;margin:auto">
            <div class="col-1 q-pt-sm" style="width: 120px">น้ำหนัก</div>
            <div class="col">
              <q-input v-model="input.weight" dark outlined dense rounded />
            </div>
          </div>
          <div class="row q-pt-md" style="width:70%;margin:auto">
            <div class="col-1 q-pt-sm" style="width: 120px">URL ปลายทาง</div>
            <div class="col">
              <q-input v-model="input.target" dark outlined dense rounded />
            </div>
          </div>
          <div class="row q-pt-md">
            <div style="width:15%"></div>
            <div class="col-1 q-pt-sm" style="width: 120px">แฟ้มข้อมูล</div>
            <div class="col">
              <q-select
                v-model="input.folder"
                rounded
                dense
                dark
                outlined
                :options="optionFolderList"
              />
            </div>
            <div style="width:15%">
              <q-icon
                name="fas fa-sync"
                size="24px"
                class="q-pt-sm cursor-pointer"
                @click="refreshFolderListBtn()"
              />
            </div>
          </div>

          <div
            class="row q-pl-md justify-between"
            style="width:350px;margin:auto;"
          >
            <div class="q-pt-md">
              <q-btn
                class="outlineblue font18"
                outline
                label="ยกเลิก"
                @click="dialogNewAds = false"
              />
            </div>
            <div class="q-pt-md q-pr-md">
              <q-btn
                class="bluebtnmd font18"
                label="ตกลง"
                @click="addNewAdsBtn()"
              />
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>
    <!-- Dialog วิธีการอัพโหลด -->
    <q-dialog v-model="dialogHowToUpload" persistent>
      <q-card
        style="max-width: 1000px;width:800px;height:450px;"
        class="bgdialogbig"
      >
        <div class="bginsidebig font24 " style="line-height:100px;">
          <div class="row">
            <div class="col-1"></div>
            <div class="col-10" align="center">วิธีการอัพโหลด</div>
            <div
              class="col-1 cursor-pointer"
              @click="dialogHowToUpload = false"
            >
              x
            </div>
          </div>
        </div>
        <div class="bginsidebig2 font14" style="height:335px;">
          <div
            align="left"
            class="q-pa-md"
            style="height:335px; overflow:auto;"
          >
            <div class="font20">การติดตั้งโปรแกรมเพื่อทำการอัพโหลดข้อมูล</div>
            <div>
              โหลดโปรแกรม FileZilla จาก <u>https://filezilla-project.org/</u>
              ทำการลงโปรแกรมให้เรียบร้อย และทำการเปิดโปรแกรม FlieZilla ขึ้นมา
              จะได้รูปดังนี้
            </div>
            <div align="center">
              <br />
              <img
                src="../../public/images/filezilla.jpg"
                alt=""
                style="width:80%"
              />
            </div>
            <br />
            <div>ให้ใส่ข้อมูลดังต่อไปนี้</div>
            <div>
              Host: xxxxxxxxxxxx, Username: xxxxxxxxxxxx, password: xxxxxxxxxxx,
              port: xxx
            </div>
            <div>
              แล้วกดปุ่ม Quickconnect โปรแกรมจะทำการเชื่อมต่อกับ server
              โดยหน้าต่างด้านซ้ายเป็นเครื่องคอมพิวเตอร์ของเรา
              ส่วนหน้าต่างด้านขวาเป็นของ Server
            </div>
            <br />
            <div class="font20">การใส่ข้อมูลโฆษณาเข้าระบบ</div>
            <div>
              ทำการเลือก Folder ads แล้วทำการสร้าง Folder ใหม่ขึ้นมาใน Folder
              ads โดยแนะนำให้ตั้งชื่อ Folder ในรูปแบบ a001, a002
              โดยทำการรันเลขไปเรื่อยๆ
            </div>
            <div>
              นำไฟล์รูป ads (ต้องเป็นไฟล์ jpg เท่านั้น) โดยชื่อไฟล์ mobile.jpg
              (ขนาด 330x100 px) / tablet.jpg (ขนาด 750x180 px) / pc.jpg (ขนาด
              900x180 px)
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import axios from "axios";
import adsBlock from "../components/adsblock";
export default {
  components: {
    adsBlock
  },
  data() {
    return {
      dialogNewAds: false, //หน้าต่างเพิ่มโฆษณาใหม่
      input: {
        title: "",
        folder: "",
        weight: 100,
        target: ""
      }, //หน้าเพิ่มโฆษณาใหม่
      optionFolderList: [], //List foloder
      dialogHowToUpload: false, //หน้าต่างวิธีการอัพโหลด
      adsData: [] //ข้อมูลโฆษณา
    };
  },
  methods: {
    async loadAdsList() {
      //load ข้อมูลโฆษณา
      this.adsData = [];

      let url = this.serverpath + "bo_ads_list.php";
      let res = await axios.get(url);
      for (let i = 0; i < res.data.length; i++) {
        this.adsData.push(res.data[i]);
      }
    },
    async openNewAds() {
      await this.loadFolderList();
      this.dialogNewAds = true;
    },
    refreshFolderListBtn() {
      this.showLoading();
      this.loadFolderList();
    },
    showLoading() {
      this.$q.loading.show();
      // hiding in 0.5s
      this.timer = setTimeout(() => {
        this.$q.loading.hide();
        this.timer = void 0;
      }, 500);
    },
    async loadFolderList() {
      //โหลด Folder ใน ads
      this.optionFolderList = [];
      let url = this.serverpath + "bo_ads_list_folder.php";
      let res = await axios.get(url);
      res.data.forEach(x => {
        this.optionFolderList.push(x);
      });
      this.input.folder = this.optionFolderList[0];
    },
    async addNewAdsBtn() {
      //save โฆษณาใหม่
      if (this.input.title.length == 0 || this.input.target.length == 0) {
        this.redNotify("กรุณาใส่ชื่อแคมเปญ");
        return;
      }

      let temp = {
        at_title: this.input.title,
        at_folder: this.input.folder,
        at_weight: this.input.weight,
        at_target: this.input.target,
        at_timestamp: new Date().getTime()
      };
      let url = this.serverpath + "bo_ads_add_ads.php";
      let res = await axios.post(url, JSON.stringify(temp));
      this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");

      // await this.loadPictureList();
      // await this.pictureListShowInPage();
      this.dialogNewAds = false;
    }
  },
  mounted() {
    this.loadAdsList();
  }
};
</script>

<style lang="scss" scoped></style>
