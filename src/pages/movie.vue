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
      <!-- แถวสอง -->
      <div class="row q-pt-md">
        <!-- ค้นหาชื่อเรื่อง -->
        <div>
          <q-input
            v-model="txtsearch"
            dark
            outlined
            rounded
            placeholder="ค้นหาชื่อเรื่อง"
            dense
            style="width:300px;"
            @keyup.enter="searchData"
          >
            <template v-if="txtsearch" v-slot:append>
              <q-icon
                name="cancel"
                @click.stop="resetSearch"
                class="cursor-pointer"
              />
            </template>
          </q-input>
        </div>
        <!-- หมวดหมู่ -->
        <div class="row">
          <div>หมวดหมู่</div>
          <div>
            <q-select
              dark
              v-model="catSelected"
              :options="catOption"
              style="width:170px;"
              rounded
              outlined
              dense
              dark
              emit-value
              map-options
            ></q-select>
          </div>
          <div>
            <q-icon name="fas fa-edit" color="white" />
          </div>
        </div>
      </div>

      <!-- เนื้อหา -->

      <!-- <div
        style="position:relative; overflow:hidden;  width:400px; height:230px;"
      >
        <iframe
          src="https://cdn.jwplayer.com/players/ieh8jaRp-qofscDvY.html"
          width="100%"
          height="100%"
          frameborder="0"
          scrolling="auto"
          title="AKB48 Team TP / Only today"
          style="position:absolute;"
          allowfullscreen
        ></iframe>
      </div> -->
      <!-- <div
        style="position:relative; overflow:hidden;  width:400px; height:230px;"
      >
        <iframe
          src="https://cdn.jwplayer.com/players/TJXPtV7O-qofscDvY.html.html"
          width="100%"
          height="100%"
          frameborder="0"
          scrolling="auto"
          title="BNK48 Only today"
          style="position:absolute;"
          allowfullscreen
        ></iframe>
      </div> -->
      <!-- <div
        style="position:relative; overflow:hidden; width:800px; height:460px;"
      >
        <iframe
          src="https://cdn.jwplayer.com/players/ieh8jaRp-LnrZZUJA.html"
          width="100%"
          height="100%"
          frameborder="0"
          scrolling="auto"
          title="Akb48 Team Tp｜《only Today》official Mv"
          style="position:absolute;"
          allowfullscreen
        ></iframe>
      </div> -->
      <!-- <div style="position:relative; overflow:hidden; ">
        <iframe
          src="https://cdn.jwplayer.com/players/38g3LzJQ-LnrZZUJA.html"
          width="50%"
          height="50%"
          frameborder="0"
          scrolling="auto"
          title="Akb48 Team Tp｜《only Today》official Mv"
          style="position:absolute;"
          allowfullscreen
        ></iframe>
      </div> -->
      <!-- <div class="frameVDO">
        <iframe
          src="https://content.jwplatform.com/players/38g3LzJQ-LnrZZUJA.html"
          frameborder="0"
          scrolling="auto"
          allowfullscreen
          style="position:absolute;"
        ></iframe>
      </div> -->
      <div style="width:300px;height:300px;">
        <div id="myElement"></div>
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
        <div class="bginsidebig2 font14" style="height:335px;  ">
          <div class="row q-px-md q-pt-md">
            <div class="col-2">รหัสลำดับ</div>
            <div class="col" style="text-align:left">ชื่อหมวดหนัง</div>
            <div class="col-2" align="center">สถานะ</div>
            <div class="col-1">ลบ</div>
            <div class="col-1">แก้ไข</div>
          </div>
          <div class="q-px-md">
            <hr
              style="  height: 0; border: 0;   border-top: 3px solid #083972; "
            />
          </div>
          <div style="height: 270px; overflow-y:auto;">
            <div
              class="row q-px-md q-py-sm"
              v-for="(item, index) in dataCat"
              :key="index"
              :class="[index % 2 ? 'bg-strip' : '']"
            >
              <div class="col-2">{{ item.orderid }}</div>
              <div class="col" align="left">{{ item.catname }}</div>
              <div class="col-2" align="center">
                <div
                  class="btred"
                  v-show="item.status == 0"
                  @click="offlineBtn(item.mc_id)"
                >
                  ออฟไลน์
                </div>
                <div
                  class="btgreen"
                  v-show="item.status == 1"
                  @click="onlineBtn(item.mc_id)"
                >
                  ออนไลน์
                </div>
              </div>
              <div class="col-1" align="center">
                <span class=" cursor-pointer" @click="delCat(item.mc_id)"
                  ><u>ลบ</u></span
                >
              </div>
              <div class="col-1" align="center">
                <span class=" cursor-pointer" @click="editCat(item)"
                  ><u>แก้ไข</u></span
                >
              </div>
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>
    <!-- Dialog เพิ่มหมวดหนัง -->
    <q-dialog v-model="dialogAddCategory" persistent>
      <q-card
        style="max-width: 1000px;width:800px;height:330px;"
        class="bgdialogbig"
      >
        <div class="bginsidebig font24 " style="line-height:100px;">
          <div class="row">
            <div class="col-12" align="center">เพิ่มหมวดหนัง</div>
          </div>
        </div>
        <div class="bginsidebig2 font14" style="height:215px;">
          <div style="width:500px;margin:auto;">
            <div class="row q-px-md q-pt-md">
              <div class="col-2 q-pt-md" align="left">รหัสลำดับ</div>
              <div class="col q-pl-md" style="text-align:left">
                <q-input v-model="input.catCode" dark dense type="number" />
              </div>
            </div>
            <div class="row q-px-md">
              <div class="col-2 q-pt-md" align="left">ชื่อหมวดหนัง</div>
              <div class="col q-pl-md" style="text-align:left">
                <q-input v-model="input.catName" dark dense />
              </div>
            </div>
            <div class="row  justify-between" style="width:300px; margin:auto;">
              <div class="q-pt-lg">
                <q-btn
                  style="width:120px; height:45px;"
                  class="outlineblue "
                  outline
                  label="ยกเลิก"
                  @click="
                    dialogAddCategory = false;
                    dialogCategory = true;
                  "
                />
              </div>
              <div class="q-pt-lg q-pr-md">
                <q-btn
                  style="width:120px; height:45px;"
                  class="bluebtnmd"
                  label="ตกลง"
                  @click="addNewCatBtn()"
                />
              </div>
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>
    <!-- Dialog แก้ไขหมวดหนัง -->
    <q-dialog v-model="dialogEditCategory" persistent>
      <q-card
        style="max-width: 1000px;width:800px;height:330px;"
        class="bgdialogbig"
      >
        <div class="bginsidebig font24 " style="line-height:100px;">
          <div class="row">
            <div class="col-12" align="center">แก้ไขหมวดหนัง</div>
          </div>
        </div>
        <div class="bginsidebig2 font14" style="height:215px;">
          <div style="width:500px;margin:auto;">
            <div class="row q-px-md q-pt-md">
              <div class="col-2 q-pt-md" align="left">รหัสลำดับ</div>
              <div class="col q-pl-md" style="text-align:left">
                <q-input v-model="input.catCode" dark dense type="number" />
              </div>
            </div>
            <div class="row q-px-md">
              <div class="col-2 q-pt-md" align="left">ชื่อหมวดหนัง</div>
              <div class="col q-pl-md" style="text-align:left">
                <q-input v-model="input.catName" dark dense />
              </div>
            </div>
            <div class="row  justify-between" style="width:300px; margin:auto;">
              <div class="q-pt-lg">
                <q-btn
                  style="width:120px; height:45px;"
                  class="outlineblue "
                  outline
                  label="ยกเลิก"
                  @click="
                    dialogEditCategory = false;
                    dialogCategory = true;
                  "
                />
              </div>
              <div class="q-pt-lg q-pr-md">
                <q-btn
                  style="width:120px; height:45px;"
                  class="bluebtnmd"
                  label="ตกลง"
                  @click="editCatBtn()"
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
      catSelected: "", //หมวดที่เลือก
      catOption: [], //ตัวเลือกหมวด
      dialogHowToUpload: false, //เปิดหน้าต่างวิธีการ upload
      dialogCategory: false, //เปิดหมวดหนัง
      dialogAddCategory: false, //เปิดเพิ่มหมวดหนัง
      dialogEditCategory: false, //แก้ไขหมวดหนัง
      dataCat: [], //หมวดหมู่ของข้อมูล
      input: {
        catCode: "",
        catName: ""
      }, //เพิ่มหมวดหนัง
      txtsearch: "", //ข้อมูลการค้นหา
      editCatId: 0 //รหัสสำหรับแก้ไข cat
    };
  },
  methods: {
    searchData() {
      //ค้นหาข้อมูล
    },
    resetSearch() {
      //ยกเลิกการค้นหา
      this.txtsearch = "";
    },
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
      this.dataCat.sort((a, b) => a.orderid - b.orderid);
      this.catOption = [];
      this.dataCat.forEach(x => {
        let temp = {
          value: x.mc_id,
          label: x.catname
        };
        this.catOption.push(temp);
      });
      this.catSelected = this.catOption[0].value;
    },
    addNewCategoryStep2() {
      //เพิ่มหมวดหนัง
      this.dialogCategory = false;
      this.input.catCode = "";
      this.input.catName = "";

      this.dialogAddCategory = true;
    },
    async addNewCatBtn() {
      //บันทึกเพิ่มหมวดหนัง
      //Check ว่ามีการใส่ค่าถูกต้องหรือไหม
      if (this.input.catCode.length > 0 && this.input.catName.length > 0) {
        let data = {
          orderid: this.input.catCode,
          catName: this.input.catName
        };
        let url = this.serverpath + "bo_movie_add_cat.php";
        let res = await axios.post(url, JSON.stringify(data));
        if (res.data == "finish") {
          this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
          this.dialogAddCategory = false;
          this.loadcat();
          this.dialogCategory = true;
        } else {
          this.redNotify(res.data);
        }
      } else {
        this.redNotify("กรุณาใส่ข้อมูลให้ครบถ้วน");
      }
    },
    async offlineBtn(id) {
      //ปุ่ม offline หมวดหนัง
      let data = {
        status: 1,
        id: id
      };
      let url = this.serverpath + "bo_movie_cat_online.php";
      let res = await axios.post(url, JSON.stringify(data));
      this.loadcat();
    },
    async onlineBtn(id) {
      //ปุ่ม online หมวดหนัง
      let data = {
        status: 0,
        id: id
      };
      let url = this.serverpath + "bo_movie_cat_online.php";
      let res = await axios.post(url, JSON.stringify(data));
      this.loadcat();
    },
    async delCat(id) {
      //ปุ่มลบหมวดหนัง
      let data = {
        id: id
      };
      let url = this.serverpath + "bo_movie_cat_del.php";
      let res = await axios.post(url, JSON.stringify(data));
      this.greenNotify("ลบข้อมูลเสร็จสิ้น");
      this.loadcat();
    },
    editCat(item) {
      //โหลดหน้าแก้ไข cat
      this.input.catCode = item.orderid;
      this.input.catName = item.catname;
      this.dialogCategory = false;
      this.editCatId = item.mc_id;
      this.dialogEditCategory = true;
    },
    async editCatBtn() {
      //ปุ่มแก้ไขหมวดหนัง
      let data = {
        orderid: this.input.catCode,
        catName: this.input.catName,
        id: this.editCatId
      };
      let url = this.serverpath + "bo_movie_cat_edit.php";
      let res = await axios.post(url, JSON.stringify(data));
      this.loadcat();
      this.dialogEditCategory = false;
      this.dialogCategory = true;
    }
  },
  mounted() {
    this.loadcat();
    jwplayer("myElement").setup({
      playlist: [
        {
          file: "https://cdn.jwplayer.com/manifests/ieh8jaRp.m3u8",
          responsive: true,
          width: "100%",
          aspectratio: "16:9"
        }
      ]
    });
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
.frameVDO {
  position: relative;
  display: block;
  width: 60%; /* width of iframe wrapper */
  height: 0;
  margin: auto;
  padding: 0% 0% 56.25%; /* 16:9 ratio */
  overflow: hidden;
}
.frameVDO iframe {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 100%;
  border: 0;
}
</style>
