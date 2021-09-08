<template>
  <div style="max-width:1600px; margin:auto;">
    <div class="contentDiv ">
      <!-- เมนูด้านบน -->
      <div class="row q-pt-md justify-between">
        <div class="row">
          <div>
            <q-input
              v-model="txtsearch"
              dark
              outlined
              rounded
              placeholder="ค้นหาชื่อเรื่อง"
              dense
              style="width:300px;"
              clearable
            />
          </div>
          <div class="row">
            <div class="q-mt-sm q-mx-md">เรียง</div>
            <div>
              <q-select
                dark
                v-model="sortOrder"
                :options="options"
                style="width:170px;"
                rounded
                outlined
                dense
                @input="cartoonListShowInPage"
              ></q-select>
            </div>
          </div>
          <div class="row">
            <div class="q-mt-sm q-mx-md">หน้า</div>
            <div>
              <q-select
                dark
                v-model="page"
                :options="pageOptions"
                style="width:70px;"
                rounded
                outlined
                dense
                @input="cartoonListShowInPage"
              ></q-select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="row btncustom" @click="dialogHowToUpload = true">
            <div class="q-px-md">
              <q-icon name="fas fa-cloud-upload-alt" />
            </div>
            <div>วิธีการอัพโหลด</div>
          </div>
          <div style="width: 15px;"></div>
          <div class="row btncustom" @click="openNewCartoon">
            <div class="q-px-md">
              <q-icon name="fas fa-plus" />
            </div>
            <div>เพิ่มเรื่องใหม่</div>
          </div>
          <div style="width: 15px;"></div>
        </div>
      </div>
      <!-- รูป thumbnail -->
      <div class="row q-pt-sm">
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[0]"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[1]"
            v-if="cartoonList.length >= 2"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[2]"
            v-if="cartoonList.length >= 3"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[3]"
            v-if="cartoonList.length >= 4"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[4]"
            v-if="cartoonList.length >= 5"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
      </div>
      <div class="row q-pt-sm">
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[5]"
            v-if="cartoonList.length >= 6"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[6]"
            v-if="cartoonList.length >= 7"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[7]"
            v-if="cartoonList.length >= 8"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[8]"
            v-if="cartoonList.length >= 9"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
        <div class="col" style="20%">
          <cartoon-block
            :data="cartoonList[9]"
            v-if="cartoonList.length >= 10"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></cartoon-block>
        </div>
      </div>
      <!-- Dialog เพิ่มเรื่องใหม่ -->
      <q-dialog v-model="dialogAddNewCartoon" persistent>
        <q-card
          style="max-width: 1000px;width:800px;height:350px;"
          class="bgdialogbig"
        >
          <div class="bginsidebig font30 " style="line-height:105px;">
            เพิ่มเรื่องใหม่
          </div>
          <div class="bginsidebig2 font14" style="height:235px;">
            <div class="row q-pt-lg" style="width:70%;margin:auto">
              <div class="col-1 q-pt-sm" style="width: 120px">ชื่อเรื่อง</div>
              <div class="col">
                <q-input v-model="input.title" dark outlined dense rounded />
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
              <div class="q-pt-lg">
                <q-btn
                  class="outlineblue font18"
                  outline
                  label="ยกเลิก"
                  @click="dialogAddNewCartoon = false"
                />
              </div>
              <div class="q-pt-lg q-pr-md">
                <q-btn
                  class="bluebtnmd font18"
                  label="ตกลง"
                  @click="addNewCartoonBtn()"
                />
              </div>
            </div>
          </div>
        </q-card>
      </q-dialog>
      <!-- Dialog แก้ไข -->
      <q-dialog v-model="dialogEditCartoon" persistent>
        <q-card
          style="max-width: 1000px;width:800px;height:350px;"
          class="bgdialogbig"
        >
          <div class="bginsidebig font30 " style="line-height:105px;">
            แก้ไขข้อมูล
          </div>
          <div class="bginsidebig2 font14" style="height:235px;">
            <div class="row q-pt-lg" style="width:70%;margin:auto">
              <div class="col-1 q-pt-sm" style="width: 120px">ชื่อเรื่อง</div>
              <div class="col">
                <q-input v-model="input.title" dark outlined dense rounded />
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
              <div class="q-pt-lg">
                <q-btn
                  class="outlineblue font18"
                  outline
                  label="ยกเลิก"
                  @click="dialogEditCartoon = false"
                />
              </div>
              <div class="q-pt-lg q-pr-md">
                <q-btn
                  class="bluebtnmd font18"
                  label="ตกลง"
                  @click="editCartoonBtn()"
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
          <div class="bginsidebig font24 " style="line-height:50px;">
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

            <div class="row font14 justify-center">
              <div
                class="unselectedBtn q-mx-md"
                v-show="!uploadWindows"
                @click="showUploadWindows"
              >
                Windows
              </div>
              <div class="selectedBtn q-mx-md" v-show="uploadWindows">
                Windows
              </div>
              <div
                class="unselectedBtn q-mx-md"
                v-show="uploadWindows"
                @click="showUploadMacs"
              >
                MacOS
              </div>
              <div class="selectedBtn q-mx-md" v-show="!uploadWindows">
                MacOS
              </div>
            </div>
          </div>
          <div class="bginsidebig2 font14" style="height:335px;">
            <div
              v-show="uploadWindows"
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
                Host: xxxxxxxxxxxx, Username: xxxxxxxxxxxx, password:
                xxxxxxxxxxx, port: xxx
              </div>
              <div>
                แล้วกดปุ่ม Quickconnect โปรแกรมจะทำการเชื่อมต่อกับ server
                โดยหน้าต่างด้านซ้ายเป็นเครื่องคอมพิวเตอร์ของเรา
                ส่วนหน้าต่างด้านขวาเป็นของ Server
              </div>
              <br />
              <div class="font20">การใส่ข้อมูลการ์ตูนเข้าระบบ</div>
              <div>
                ทำการเลือก Folder cartoon แล้วทำการสร้าง Folder ใหม่ขึ้นมาใน
                Folder cartoon โดยแนะนำให้ตั้งชื่อ Folder ในรูปแบบ c001, c002
                โดยทำการรันเลขไปเรื่อยๆ
              </div>
              <div>
                นำไฟล์รูปการ์ตูน (ต้องเป็นไฟล์ jpg เท่านั้น) โดยชื่อไฟล์ 00.jpg
                (ขนาด 180x250 px) จะเป็น cover และ
                ไฟล์ตัวหนังสือการ์ตูนจะเริ่มจากไฟล์ 01.jpg โดยการรันเลขไปเรื่อยๆ
              </div>
            </div>
            <div
              v-show="!uploadWindows"
              align="left"
              class="q-pa-md"
              style="height:335px; overflow:auto;"
            >
              ไปหาวิธีทำก่อนนะ!!!
            </div>
          </div>
        </q-card>
      </q-dialog>
      <!-- bg สีเข้ม -->
      <div
        class="fullscreen bg-backdrop"
        v-show="dialogAddNewCartoon || dialogHowToUpload || dialogEditCartoon"
      ></div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import cartoonBlock from "../components/cartoonblock";

export default {
  components: {
    cartoonBlock
  },
  data() {
    return {
      txtsearch: "", //ข้อความค้นหา
      sortOrder: "ยอดวิวรวม", //เรียงลำดับ
      options: ["ยอดวิวรวม", "ยอดวิวต่อสัปดาห์", "ลำดับการอัพโหลด"], //ตัวเลือกในการเรียงลำดับ
      page: 1, //หน้า
      pageMax: 1, //จำนวนหน้าสูงสุด
      pageOptions: [], //ตัวเลือกของหน้า
      currentPage: 1, //หน้าปัจจุบัน
      folderList: [], //รายชื่อ folder ทั้งหมดใน folder cartoon
      dialogAddNewCartoon: false, //หน้าต่างเพิ่มเรื่องใหม่
      input: {
        title: "",
        folder: ""
      }, //ค่าสำหรับ input ในหน้าต่างเพิ่มเรื่องใหม่
      optionFolderList: ["c01"], //รายชื่อ Folder ในหน้าต่างเพิ่มเรื่องใหม่
      dialogHowToUpload: false, //หน้าต่างวิธีการอัพโหลด
      uploadWindows: true, //ปุ่มวิธีการอัพโหลด True เป็นของ Windows
      cartoonData: [], //ข้อมูลการ์ตูนทั้งหมด
      startCartoon: 0, //ลำดับข้อมูลการ์ตูนตัวแรกที่แสดง
      endCartoon: 0, //ลำดับข้อมูลการ์ตูนตัวสุดท้ายที่แสดง
      cartoonList: [], //ข้อมูลการ์ตูนที่แสดงในหน้านั้น
      dialogEditCartoon: false, //Dialog แก้ไขข้อมูล
      editId: 0 //รหัส cartoon id ที่ต้องการแก้ไข
    };
  },
  methods: {
    showSambleDia(id) {
      console.log(id);
    },
    editDia(id) {
      //เปิดหน้าต่างแก้ไขข้อมูล
      this.dialogEditCartoon = true;
      this.editID = id;
      this.refreshFolderListBtn();
      let dataShow = this.cartoonData.filter(x => x.ct_id == id);
      this.input.title = dataShow[0].ct_title;
      this.optionFolderList.unshift(dataShow[0].ct_folder);
    },
    async editCartoonBtn() {
      // บันทึกแก้ไข;
      //Check ว่าใส่ข้อมูลครบถ้วน
      if (this.input.title.length == 0 || this.input.folder.length == 0) {
        this.redNotify("กรุณาใส่ข้อมูลให้ครบถ้วน");
        return;
      }
      //บันทึกข้อมูลเข้า Database
      let ct_temp = {
        ct_title: this.input.title,
        ct_folder: this.input.folder,
        ct_timestamp: new Date().getTime(),
        ct_id: this.editID
      };

      let url = this.serverpath + "bo_cartoon_edit.php";
      let res = await axios.post(url, JSON.stringify(ct_temp));
      //ปิด Dialog
      this.dialogEditCartoon = false;
      //ทำการอัพเดท List
      this.loadCartoon();
    },
    async openNewCartoon() {
      //เปิดหน้าต่างเพิ่มเรื่องใหม่
      await this.loadFolderList();
      this.dialogAddNewCartoon = true;
      this.input.title = "";
    },
    showUploadWindows() {
      //ปุ่มเลือก Windows ในวิธีอัพโหลด
      this.uploadWindows = true;
    },
    showUploadMacs() {
      //ปุ่มเลือก MacOS ในวิธีอัพโหลด
      this.uploadWindows = false;
    },
    async OpenDialogAddNewCartoon() {
      //กดปุ่มเพิ่มเรื่องใหม่
      await this.loadFolderList();
      this.dialogAddNewCartoon = true;
    },
    async loadFolderList() {
      //โหลด Folder ใน cartoon
      this.optionFolderList = [];
      let url = this.serverpath + "bo_cartoon_list_folder.php";
      let res = await axios.get(url);
      res.data.forEach(x => {
        this.optionFolderList.push(x);
      });
      this.input.folder = this.optionFolderList[0];
    },
    refreshFolderListBtn() {
      // this.dialogAddNewCartoon = false;
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
    async addNewCartoonBtn() {
      //บันทึกในหน้าเพิ่มเรื่องใหม่
      //Check ว่ามีการใส่ค่าหรือไหม
      if (this.input.title.length == 0 || this.input.folder.length == 0) {
        this.redNotify("กรุณาใส่ข้อมูลให้ครบถ้วน");
        return;
      }
      let ct_temp = {
        ct_title: this.input.title,
        ct_folder: this.input.folder,
        ct_timestamp: new Date().getTime()
      };
      let url = this.serverpath + "bo_cartoon_add.php";
      let res = await axios.post(url, JSON.stringify(ct_temp));
      this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
      this.dialogAddNewCartoon = false;
      this.loadCartoon();
    },
    async calPage() {
      //คำนวนหาหน้าทั้งหมดที่ต้องใช้
      let url = this.serverpath + "bo_cartoon_no_data.php";
      let res = await axios.get(url);
      this.pageMax = Math.ceil(res.data / 10);
      for (let i = 1; i <= this.pageMax; i++) {
        this.pageOptions.push(i);
      }
      this.page = this.currentPage;
    },
    async loadfolder() {
      //โหลด Folder ที่เก็บการ์ตูน
      let url = this.serverpath + "bo_cartoon_list_folder.php";
      let res = await axios.get(url);
      this.folderList = res.data;
    },
    async loadCartoon() {
      //load ข้อมูลการ์ตูน
      this.cartoonData = [];
      let startTime = 1630256400000; // 1-July-2021
      let currentTime = new Date().getTime();
      let diffTime = currentTime - startTime;
      let diffWeek = Math.floor(diffTime / (1000 * 60 * 60 * 24 * 7));
      let temp = {
        diffWeek: diffWeek
      };
      let url = this.serverpath + "bo_cartoon_list.php";
      let res = await axios.post(url, JSON.stringify(temp));
      for (let i = 0; i < res.data.length; i++) {
        this.cartoonData.push(res.data[i]);
      }
      this.cartoonListShowInPage();
    },
    cartoonListShowInPage() {
      // ทำข้อมูลสำหรับแสดงในหน้านั้น
      this.cartoonList = [];

      let tempL = this.cartoonList.length;
      //ทำการ sort ข้อมูล
      if (this.sortOrder == "ยอดวิวรวม") {
        this.cartoonData.sort(
          (a, b) => Number(b.statview) - Number(a.statview)
        );
      } else if (this.sortOrder == "ยอดวิวต่อสัปดาห์") {
        this.cartoonData.sort((a, b) => {
          return Number(b.statweek) - Number(a.statweek);
        });
      } else {
        this.cartoonData.sort(
          (a, b) => Number(a.ct_timestamp) - Number(b.ct_timestamp)
        );
      }
      // this.cartoonData.forEach(x => {
      //   console.log(x.ct_id);
      // });

      // console.log("--------------");

      //ทำการเลือกข้อมูลในหน้านั้น
      this.startCartoon = (this.page - 1) * 10 + 1;
      this.endCartoon = this.page * 10;
      if (this.cartoonData.length < this.endCartoon) {
        this.endCartoon = this.cartoonData.length;
      }
      for (let i = this.startCartoon - 1; i < this.endCartoon; i++) {
        this.cartoonList.push(this.cartoonData[i]);
      }
    }
  },

  beforeDestroy() {
    if (this.timer !== void 0) {
      clearTimeout(this.timer);
      this.$q.loading.hide();
    }
  },
  mounted() {
    this.calPage(); //คำนวนหาเพจที่ต้องมี

    this.loadCartoon();
  }
};
</script>

<style lang="scss" scoped>
.unselectedBtn {
  border: 1px solid white;
  width: 135px;
  height: 35px;
  line-height: 35px;
  border-radius: 35px;
  cursor: pointer;
}
.selectedBtn {
  width: 135px;
  height: 35px;
  line-height: 35px;
  border-radius: 35px;
  background: linear-gradient(
    180deg,
    rgba(242, 40, 169, 1) 0%,
    rgba(254, 109, 126, 1) 100%
  );
  cursor: pointer;
  color: white;
}
</style>
