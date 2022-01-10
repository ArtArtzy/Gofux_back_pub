<template>
  <div style="max-width:1600px; margin:auto;">
    <!-- หน้าหลัก -->
    <div class="contentDiv ">
      <!-- แถวแรก -->
      <div class="row q-pt-md justify-end">
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
        <div class="col">
          <q-input
            v-model="txtsearch"
            dark
            outlined
            rounded
            placeholder="ค้นหาชื่อเรื่อง"
            dense
            style="width:400px;"
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
        <div class="row" style="width:350px">
          <div class="q-mt-sm q-mx-md">หมวดหมู่</div>
          <div>
            <q-select
              dark
              v-model="catSelected"
              :options="catOption"
              style="width:200px;"
              rounded
              outlined
              dense
              dark
              emit-value
              map-options
            ></q-select>
          </div>
        </div>

        <div class="row">
          <div class="q-mt-sm q-mx-md">เรียง</div>
          <div>
            <q-select
              dark
              v-model="sortOrder"
              :options="options"
              style="width:200px;"
              rounded
              outlined
              dense
              @input="changeOrder()"
            ></q-select>
          </div>
        </div>
        <!-- หน้า -->
        <div class="row">
          <div class="q-mt-sm q-mx-md">หน้า</div>
          <div>
            <q-select
              dark
              v-model="page"
              :options="pageOptions"
              style="width:100px;"
              rounded
              outlined
              dense
              @input="changePage()"
            ></q-select>
          </div>
        </div>
      </div>
      <movieblock></movieblock>
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
                <span
                  class=" cursor-pointer"
                  @click="delCat(item.mc_id, item.catname)"
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
                  class="long "
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
                  class="long "
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
    <!-- bg สีเข้ม -->
    <div
      class="fullscreen bg-backdrop"
      v-show="
        dialogHowToUpload ||
          dialogCategory ||
          dialogAddCategory ||
          dialogEditCategory
      "
    ></div>
    <!-- Dialog confirm delete หมวดหนัง -->
    <q-dialog
      v-model="dialogConfirmDel"
      persistent
      transition-show="scale"
      transition-hide="scale"
    >
      <div class="bgdialog">
        <div class="bginside font18">
          ลบหมวดหนัง
        </div>
        <div class="bginside2 font18">
          <div class="q-pt-lg">
            <img src="../../public/images/exclaim.png" alt="" />
          </div>
          <div>
            คุณต้องการลบหมวดหนัง <i>{{ deleteCat.catName }}</i> ?
          </div>
          <div class="row q-pl-md justify-between">
            <div class="q-pt-lg">
              <q-btn
                class="outlineblue font18"
                outline
                label="ยกเลิก"
                @click="delGroupCancelBtn()"
              />
            </div>
            <div class="q-pt-lg q-pr-md">
              <q-btn
                class="bluebtnmd font18"
                label="ตกลง"
                @click="delCatConfirm()"
              />
            </div>
          </div>
        </div>
      </div>
    </q-dialog>
    <!-- เพิ่มวีดีโด step1-->
    <q-dialog v-model="addVdo.dialog">
      <q-card
        style="max-width: 1000px;width:800px;height:565px;"
        class="bgdialogbig"
      >
        <div class="bginsidebig font24 " style="line-height:100px;">
          <div align="center">เพิ่มวีดีโอ</div>
        </div>
        <div class="bginsidebig2 font14" style="height:450px;">
          <div
            align="left"
            class="q-pa-md inputLine"
            style="height:450px; overflow:auto;"
          >
            <div class="row justify-center ">
              <div class="col-2 q-pt-md">ชื่อเรื่อง</div>
              <div class="col-8">
                <q-input v-model="addVdo.title" dense dark />
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-2 q-pt-md">หมวดหมู่</div>
              <div class="col-8">
                <q-select
                  v-model="addVdo.catId"
                  :options="catOption"
                  dark
                  dense
                  style="width:250px"
                  emit-value
                  map-options
                />
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-2 q-pt-md">รหัสลิงค์ JW</div>
              <div class="col-8">
                <q-input
                  v-model="addVdo.jwCode"
                  dense
                  dark
                  style="width:250px"
                />
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-2 q-pt-md">ความยาว</div>
              <div class="col-8 row">
                <q-input
                  v-model.number="addVdo.durationHour"
                  dense
                  dark
                  style="width:50px"
                  type="number"
                />
                <div class="q-pt-md q-px-sm">ชั่วโมง</div>
                <q-input
                  v-model.number="addVdo.durationMin"
                  dense
                  dark
                  style="width:50px"
                  type="number"
                />
                <div class="q-pt-md q-px-sm">นาที</div>
              </div>
            </div>
            <div class="row justify-center" style="line-height:25px;">
              <div class="col-2 q-pt-md">ภาพหน้าปก</div>
              <div class="col-8 ">
                <div>
                  <q-file
                    v-model="addVdo.posterFile"
                    dense
                    dark
                    accept=".jpg"
                    label="เลือกไฟล์ jpg"
                  >
                  </q-file>
                  <div class="font12" style="line-height:15px;">
                    Image size: 300 x 170 px
                  </div>
                </div>
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-2 q-pt-md">ป้ายกำกับ</div>
              <div class="col-8">
                <q-input v-model="addVdo.tag" dense dark />
              </div>
            </div>
            <div
              class="row q-pl-md justify-between"
              style="width:400px;margin:auto;"
            >
              <div class="q-pt-md">
                <q-btn
                  class="outlinebluelong font16"
                  outline
                  label="ยกเลิก"
                  @click="addVdo.dialog = false"
                />
              </div>
              <div class="q-pt-md q-pr-md">
                <q-btn
                  class="bluebtnmdlong font16"
                  label="วิเคราะห์ป้ายกำกับ"
                  @click="analyticTagBtn()"
                />
              </div>
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>
    <!-- เพิ่มวีดีโด step2-->
    <q-dialog v-model="addVdo.dialogStep2">
      <q-card
        style="max-width: 1000px;width:800px;height:565px;"
        class="bgdialogbig"
      >
        <div class="bginsidebig font24 " style="line-height:100px;">
          <div align="center">เพิ่มวีดีโอ</div>
        </div>
        <div class="bginsidebig2 font14" style="height:450px;">
          <div
            align="left"
            class="q-pa-md inputLine"
            style="height:450px; overflow:auto;"
          >
            <div class="row justify-center ">
              <div class="col-2 q-pt-md">ชื่อเรื่อง</div>
              <div class="col-8">
                <q-input v-model="addVdo.title" dense dark readonly />
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-2 q-pt-md">หมวดหมู่</div>
              <div class="col-8">
                <q-select
                  v-model="addVdo.catId"
                  :options="catOption"
                  dark
                  dense
                  style="width:250px"
                  emit-value
                  map-options
                />
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-2 q-pt-md">รหัสลิงค์ JW</div>
              <div class="col-8">
                <q-input
                  v-model="addVdo.jwCode"
                  dense
                  dark
                  style="width:250px"
                  readonly
                />
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-2 q-pt-md">ความยาว</div>
              <div class="col-8 row">
                <q-input
                  v-model.number="addVdo.durationHour"
                  dense
                  dark
                  style="width:50px"
                  type="number"
                  readonly=""
                />
                <div class="q-pt-md q-px-sm">ชั่วโมง</div>
                <q-input
                  v-model.number="addVdo.durationMin"
                  dense
                  dark
                  style="width:50px"
                  type="number"
                  readonly=""
                />
                <div class="q-pt-md q-px-sm">นาที</div>
              </div>
            </div>
            <div class="row justify-center" style="line-height:25px;">
              <div class="col-2 q-pt-md">ภาพหน้าปก</div>
              <div class="col-8 ">
                <div>
                  <q-file
                    v-model="addVdo.posterFile"
                    dense
                    dark
                    accept=".jpg"
                    label="เลือกไฟล์ jpg"
                  >
                  </q-file>
                  <div class="font12" style="line-height:15px;">
                    Image size: 300 x 170 px
                  </div>
                </div>
              </div>
            </div>
            <div class="row justify-center">
              <div class="col-2 q-pt-md">ป้ายกำกับ</div>
              <div class="col-8">
                <q-input v-model="addVdo.tag" dense dark />
              </div>
            </div>
            <div
              class="row q-pl-md justify-between"
              style="width:400px;margin:auto;"
            >
              <div class="q-pt-md">
                <q-btn
                  class="outlinebluelong font16"
                  outline
                  label="แก้ไข"
                  @click="addVdoEditInStep2()"
                />
              </div>
              <div class="q-pt-md q-pr-md">
                <q-btn
                  class="bluebtnmdlong font16"
                  label="วิเคราะห์ป้ายกำกับ"
                  @click="analyticTagBtn()"
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
import movieBlock from "../components/movieblock";
import movieblock from "src/components/movieblock.vue";
export default {
  components: { movieblock },
  data() {
    return {
      catSelected: "", //หมวดที่เลือก
      catOption: [], //ตัวเลือกหมวด
      sortOrder: "ยอดวิวรวม", //เรียงลำดับ
      options: ["ยอดวิวรวม", "ยอดวิวต่อสัปดาห์", "ลำดับการอัพโหลด"], //ตัวเลือกในการเรียงลำดับ
      page: 1, //หน้า
      pageMax: 1, //จำนวนหน้าสูงสุด
      pageOptions: [], //ตัวเลือกของหน้า
      dialogHowToUpload: false, //เปิดหน้าต่างวิธีการ upload
      dialogCategory: false, //เปิดหมวดหนัง
      dialogAddCategory: false, //เปิดเพิ่มหมวดหนัง
      dialogEditCategory: false, //แก้ไขหมวดหนัง
      dialogConfirmDel: false, //หน้าต่างยืนยันการลบหมวดหนัง
      deleteCat: {
        id: "",
        catname: ""
      }, //ข้อมูลลบหมวดหมู่
      dataCat: [], //หมวดหมู่ของข้อมูล
      input: {
        catCode: "",
        catName: ""
      }, //เพิ่มหมวดหนัง
      txtsearch: "", //ข้อมูลการค้นหา
      editCatId: 0, //รหัสสำหรับแก้ไข cat
      //**** เพิ่มวีดีโอ */
      addVdo: {
        dialog: false,
        dialogStep2: false,
        title: "x1",
        catId: "",
        catName: "",
        jwCode: "x2",
        durationHour: "",
        durationMin: 12,
        posterFile: null,
        tag: "y1,y2,x1,x2"
      } //เพิ่มวีดีโอ
    };
  },
  methods: {
    //*****  หมวดหมู่หนัง *********/
    //เปิดหน้าต่างหมวดหนัง
    async opencategory() {
      this.loadcat();
      this.dialogCategory = true;
    },
    //ปุ่มเพิ่มหมวดหนัง
    addNewCategoryStep2() {
      this.dialogCategory = false;
      this.input.catCode = "";
      this.input.catName = "";
      this.dialogAddCategory = true;
    },
    //บันทึกเพิ่มหมวดหนัง
    async addNewCatBtn() {
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
    //ปุ่ม offline หมวดหนัง
    async offlineBtn(id) {
      let data = {
        status: 1,
        id: id
      };
      let url = this.serverpath + "bo_movie_cat_online.php";
      let res = await axios.post(url, JSON.stringify(data));
      this.loadcat();
    },
    //ปุ่ม online หมวดหนัง
    async onlineBtn(id) {
      let data = {
        status: 0,
        id: id
      };
      let url = this.serverpath + "bo_movie_cat_online.php";
      let res = await axios.post(url, JSON.stringify(data));
      this.loadcat();
    },
    //โหลดหน้าแก้ไข cat
    editCat(item) {
      this.input.catCode = item.orderid;
      this.input.catName = item.catname;
      this.dialogCategory = false;
      this.editCatId = item.mc_id;
      this.dialogEditCategory = true;
    },
    //ปุ่มแก้ไขหมวดหนัง
    async editCatBtn() {
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
    },
    //*********** จบหมวดหนัง ******/

    //*********** หมวดหนัง  *******/
    //ปุ่มยกเลิกการลบ
    delGroupCancelBtn() {
      this.dialogConfirmDel = false;
      this.dialogCategory = true;
    },
    //ปุ่มลบหมวดหนัง
    delCat(id, catname) {
      this.dialogCategory = false;
      this.dialogConfirmDel = true;
      this.deleteCat.id = id;
      this.deleteCat.catName = catname;
    },
    //ปุ่ม ok ยืนยันการลบหมวดหนัง
    async delCatConfirm() {
      let id = this.deleteCat.id;
      let data = {
        id: id
      };
      let url = this.serverpath + "bo_movie_cat_del.php";
      let res = await axios.post(url, JSON.stringify(data));
      this.greenNotify("ลบข้อมูลเสร็จสิ้น");
      this.dialogConfirmDel = false;
      this.loadcat();
      this.dialogCategory = true;
    },
    //โหลด cat เมื่อมีการupdate
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
    //******* จบหมวดหนัง ******* */
    searchData() {
      //ค้นหาข้อมูล
    },
    resetSearch() {
      //ยกเลิกการค้นหา
      this.txtsearch = "";
    },
    //เปิดหน้าต่างเพิ่มวีดีโอ
    openNewMovie() {
      this.addVdo.dialog = true;
      this.addVdo.catId = this.catOption[0].value;
    },
    //ปุ่มวิเคราะห์ป้ายกำกับ
    async analyticTagBtn() {
      //check input
      if (
        !(
          this.addVdo.title.length > 0 &&
          this.addVdo.jwCode.length > 0 &&
          (this.addVdo.durationHour > 0 || this.addVdo.durationMin > 0) &&
          this.addVdo.tag.length > 0
        )
      ) {
        this.redNotify("กรุณากรอกข้อมูลให้ครบถ้วน");
        return;
      }
      this.addVdo.catName = this.catOption.filter(
        x => x.value == this.addVdo.catId
      )[0].label;
      console.log(this.addVdo);
      this.addVdo.dialogStep2 = true;
      this.addVdo.dialog = false;

      // //วิเคราะห์ป้ายกำกับ
      // let url = this.serverpath + "bo_movie_analytic_tag.php";
      // let res = await axios.post(url, JSON.stringify(this.addVdo));
      // console.log(res.data);
    },
    //ปุ่มแก้ไขในหน้าเพิ่มวีดีโอ
    addVdoEditInStep2() {
      this.addVdo.dialogStep2 = false;
      this.addVdo.dialog = true;
    }
  },
  mounted() {
    this.loadcat();
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
  overflow: hidden;
  width: 50%;
  // height: calc(50%);
  padding-top: 28.125%; /* 16:9 Aspect Ratio (divide 9 by 16 = 0.5625) */
}
.frameVDO iframe {
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
}
.inputLine {
  line-height: 40px;
}
</style>
