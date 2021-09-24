<template>
  <div style="max-width:1600px; margin:auto;">
    <div class="contentDiv ">
      <!-- แถวแรก -->
      <div class="row q-pt-md justify-between">
        <div class="row btncustom" @click="openTagSystem">
          <div class="q-px-md">
            <q-icon name="fas fa-tags" />
          </div>
          <div>ป้ายกำกับ</div>
        </div>
        <div class="row">
          <div class="row btncustom" @click="dialogHowToUpload = true">
            <div class="q-px-md">
              <q-icon name="fas fa-cloud-upload-alt" />
            </div>
            <div>การอัพโหลด</div>
          </div>
          <div style="width: 15px;"></div>
          <div class="row btncustom" @click="opencategory">
            <div class="q-px-md">
              <q-icon name="fas fa-plus" />
            </div>
            <div>หมวดหนัง</div>
          </div>
          <div style="width: 15px;"></div>
          <div class="row btncustom" @click="openNewMovie">
            <div class="q-px-md">
              <q-icon name="fas fa-plus" />
            </div>
            <div>เพิ่มวีดีโอ</div>
          </div>
        </div>
      </div>
    </div>
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
            <div class="font20">การใส่ข้อมูลการ์ตูนเข้าระบบ</div>
            <div>
              ทำการเลือก Folder picture แล้วทำการสร้าง Folder ใหม่ขึ้นมาใน
              Folder cartoon โดยแนะนำให้ตั้งชื่อ Folder ในรูปแบบ p001, p002
              โดยทำการรันเลขไปเรื่อยๆ
            </div>
            <div>
              นำไฟล์รูปการ์ตูน (ต้องเป็นไฟล์ jpg เท่านั้น) โดยชื่อไฟล์ 00.jpg
              (ขนาด 180x250 px) จะเป็น cover และ
              ไฟล์ตัวหนังสือการ์ตูนจะเริ่มจากไฟล์ 01.jpg โดยการรันเลขไปเรื่อยๆ
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>
    <!-- Dialog หมวดหนัง -->
    <q-dialog v-model="dialogCategory" persistent>
      <q-card
        style="max-width: 1000px;width:800px;height:450px;"
        class="bgdialogbig"
      >
        <div class="bginsidebig font24 " style="line-height:50px;">
          <div class="row">
            <div class="col-1"></div>
            <div class="col-10" align="center">หมวดหนัง</div>
            <div class="col-1 cursor-pointer" @click="dialogCategory = false">
              x
            </div>
          </div>
          <div align="center">
            <q-btn
              label="เพิ่มหมวดหนัง"
              icon="fas fa-plus"
              outline
              rounded
              @click="addNewCategoryStep2"
            />
          </div>
        </div>
        <div class="bginsidebig2 font14" style="height:335px;">
          <div class="row q-px-md q-pt-md">
            <div class="col-2">รหัสลำดับ</div>
            <div class="col" style="text-align:left">ชื่อหมวดหนัง</div>
            <div class="col-2" align="center">สถานะ</div>
            <div class="col-1">ลบ</div>
            <div class="col-1">แก้ไข</div>
          </div>
          <div class="q-px-md">
            <hr />
          </div>
          <div
            class="row q-px-md q-py-sm"
            v-for="(item, index) in dataCat"
            :key="index"
            :class="[index % 2 ? 'bg-strip' : '']"
          >
            <div class="col-2">{{ item.mcat_code }}</div>
            <div class="col" align="left">{{ item.catName }}</div>
            <div class="col-2" align="center">
              <div class="btred" v-show="item.status == 0" @click="offlineBtn">
                ออฟไลน์
              </div>
              <div class="btgreen" v-show="item.status == 1" @click="onlineBtn">
                ออนไลน์
              </div>
            </div>
            <div class="col-1" align="center"><u>ลบ</u></div>
            <div class="col-1" align="center"><u>แก้ไข</u></div>
          </div>
        </div>
      </q-card>
    </q-dialog>
    <!-- Dialog เพิ่มหมวดหนัง -->
    <q-dialog v-model="dialogAddCategory" persistent>
      <q-card
        style="max-width: 1000px;width:800px;height:450px;"
        class="bgdialogbig"
      >
        <div class="bginsidebig font24 " style="line-height:100px;">
          <div class="row">
            <div class="col-12" align="center">เพิ่มหมวดหนัง</div>
          </div>
        </div>
        <div class="bginsidebig2 font14" style="height:335px;">
          <div style="width:500px;margin:auto;">
            <div class="row q-px-md q-pt-md">
              <div class="col-2 q-pt-md" align="left">รหัสลำดับ</div>
              <div class="col" style="text-align:left">
                <q-input v-model="input.catCode" dark dense />
              </div>
            </div>
            <div class="row q-px-md">
              <div class="col-2 q-pt-md" align="left">ชื่อหมวดหนัง</div>
              <div class="col" style="text-align:left">
                <q-input v-model="input.catCode" dark dense />
              </div>
            </div>
            <div class="row  justify-between" style="width:300px; margin:auto;">
              <div class="q-pt-lg">
                <q-btn
                  style="width:120px; height:45px;"
                  class="outlineblue "
                  outline
                  label="ยกเลิก"
                  @click="confirmDelSystemUser = false"
                />
              </div>
              <div class="q-pt-lg q-pr-md">
                <q-btn
                  style="width:120px; height:45px;"
                  class="bluebtnmd"
                  label="ตกลง"
                  @click="delUserSystemReal"
                />
              </div>
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import axios from "axios";
export default {
  data() {
    return {
      dialogHowToUpload: false, //เปิดหน้าต่างวิธีการ upload
      dialogCategory: false, //เปิดหมวดหนัง
      dialogAddCategory: false, //เปิดเพิ่มหมวดหนัง
      dataCat: [], //หมวดหมู่ของข้อมูล
      input: {
        catCode: ""
      }
    };
  },
  methods: {
    openTagSystem() {
      //เปิดหน้าต่าง tag
      console.log("open tag system");
    },
    openNewMovie() {
      //เปิดหน้าต่างเพิ่มวีดีโอ
      console.log("open vdo tab");
    },
    async opencategory() {
      //เปิดหน้าต่างหมวดหนัง
      this.loadcat();
      this.dialogCategory = true;
    },
    async loadcat() {
      this.dataCat = [];
      let url = this.serverpath + "bo_movie_type_list.php";
      let res = await axios.get(url);
      for (let i = 0; i < res.data.length; i++) {
        this.dataCat.push(res.data[i]);
      }
    },
    addNewCategoryStep2() {
      //เพิ่มหมวดหนัง
      this.dialogCategory = false;
      setTimeout(() => {
        this.dialogAddCategory = true;
      }, 1000);
    }
  }
};
</script>

<style lang="scss" scoped>
.btgreen {
  width: 70px;
  height: 20px;
  background-color: #9eee39;
  color: black;
  text-align: center;
  border-radius: 50px;
  cursor: pointer;
}
.btred {
  width: 70px;
  height: 20px;
  background-color: #ff2070;
  color: black;
  text-align: center;
  border-radius: 50px;
  cursor: pointer;
}
</style>
