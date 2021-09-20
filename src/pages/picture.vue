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
                @input="changeOrder()"
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
                @input="changePage()"
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
          <div class="row btncustom" @click="openGroupDialog">
            <div class="q-px-md">
              <q-icon name="fas fa-pen" />
            </div>
            <div>จัดประเภท</div>
          </div>
          <div style="width: 15px;"></div>
          <div class="row btncustom" @click="openNewPicture">
            <div class="q-px-md">
              <q-icon name="fas fa-plus" />
            </div>
            <div>เพิ่มวาร์ปใหม่</div>
          </div>
          <div style="width: 15px;"></div>
        </div>
      </div>
      <!-- รูป thumbnail -->
      <div class="row q-pt-sm">
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[0]"
            v-if="pictureList.length >= 1"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[1]"
            v-if="pictureList.length >= 2"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[2]"
            v-if="pictureList.length >= 3"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[3]"
            v-if="pictureList.length >= 4"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[4]"
            v-if="pictureList.length >= 5"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
      </div>
      <div class="row q-pt-sm">
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[5]"
            v-if="pictureList.length >= 6"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[6]"
            v-if="pictureList.length >= 7"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[7]"
            v-if="pictureList.length >= 8"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[8]"
            v-if="pictureList.length >= 9"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
        <div class="col" style="20%">
          <picture-block
            :data="pictureList[9]"
            v-if="pictureList.length >= 10"
            @show-sample="showSambleDia"
            @edit-data="editDia"
          ></picture-block>
        </div>
      </div>
      <!-- Dialog ตัวอย่าง -->
      <q-dialog v-model="dialogSample" persistent>
        <q-card
          style="max-width: 1000px;width:800px;height:650px;"
          class="bgdialogbig"
        >
          <div class="bginsidebig font18 " style="line-height:50px;">
            <div class="row">
              <div class="col-1"></div>
              <div class="col-10" align="center">ตัวอย่างการแสดงผล</div>
              <div
                class="col-1 cursor-pointer font24"
                @click="dialogSample = false"
              >
                x
              </div>
            </div>

            <div class="row font24 justify-center">
              <div>{{ titleSample }}</div>
            </div>
          </div>
          <div
            class="bginsidebig2 font14"
            style="height:535px; overflow-y:scroll"
          >
            <div v-for="index in pageSample" :key="index">
              <img
                :src="
                  pathSample +
                    '0' +
                    index +
                    '.jpg?x=' +
                    (Math.floor(Math.random() * 999) + 100)
                "
                alt=""
                style="width:60%"
                v-if="index <= 9"
              />
              <img
                :src="
                  pathSample +
                    index +
                    '.jpg?x=' +
                    (Math.floor(Math.random() * 999) + 100)
                "
                alt=""
                style="width:60%"
                v-if="index > 9"
              />
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
      <!-- Dialog เพิ่มเรื่องใหม่ -->
      <q-dialog v-model="dialogAddNewPicture" persistent>
        <q-card
          style="max-width: 1000px;width:800px;height:450px;"
          class="bgdialogbig"
        >
          <div class="bginsidebig font30 " style="line-height:105px;">
            เพิ่มวาร์ปชุดใหม่
          </div>
          <div class="bginsidebig2 font14" style="height:335px;">
            <div class="row q-pt-lg" style="width:70%;margin:auto">
              <div class="col-1 q-pt-sm" style="width: 120px">ชื่อวาร์ป</div>
              <div class="col">
                <q-input v-model="input.title" dark outlined dense rounded />
              </div>
            </div>
            <div class="row q-pt-md" style="width:70%;margin:auto">
              <div class="col-1 q-pt-sm" style="width: 120px">ประเภท</div>
              <div class="col">
                <div class="col">
                  <q-select
                    v-model="input.type"
                    rounded
                    dense
                    dark
                    outlined
                    :options="optionGroupList"
                    emit-value
                    map-options
                  />
                </div>
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
            <div class="row q-pt-md" style="width:70%;margin:auto">
              <div class="col-1 q-pt-sm" style="width: 120px">การเข้าถึง</div>
              <div class="col" align="left">
                <q-option-group
                  v-model="input.access"
                  :options="optionAccess"
                  color="white"
                  inline
                  dark
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
                  @click="dialogAddNewPicture = false"
                />
              </div>
              <div class="q-pt-md q-pr-md">
                <q-btn
                  class="bluebtnmd font18"
                  label="ตกลง"
                  @click="addNewPictureBtn()"
                />
              </div>
            </div>
          </div>
        </q-card>
      </q-dialog>
      <!-- Dialog แก้ไขเรื่อง -->
      <q-dialog v-model="dialogEditPicture" persistent>
        <q-card
          style="max-width: 1000px;width:800px;height:450px;"
          class="bgdialogbig"
        >
          <div class="bginsidebig font30 row" style="line-height:105px;">
            <div class="col-2"></div>
            <div class="col-8" align="center">แก้ไขวาร์ป</div>
            <div class="col-2">
              <q-icon
                name="fas fa-trash-alt"
                class="cursor-pointer"
                @click="delPicture()"
              />
            </div>
          </div>
          <div class="bginsidebig2 font14" style="height:335px;">
            <div class="row q-pt-lg" style="width:70%;margin:auto">
              <div class="col-1 q-pt-sm" style="width: 120px">ชื่อวาร์ป</div>
              <div class="col">
                <q-input v-model="input.title" dark outlined dense rounded />
              </div>
            </div>
            <div class="row q-pt-md" style="width:70%;margin:auto">
              <div class="col-1 q-pt-sm" style="width: 120px">ประเภท</div>
              <div class="col">
                <div class="col">
                  <q-select
                    v-model="input.type"
                    rounded
                    dense
                    dark
                    outlined
                    :options="optionGroupList"
                    emit-value
                    map-options
                  />
                </div>
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
            <div class="row q-pt-md" style="width:70%;margin:auto">
              <div class="col-1 q-pt-sm" style="width: 120px">การเข้าถึง</div>
              <div class="col" align="left">
                <q-option-group
                  v-model="input.access"
                  :options="optionAccess"
                  color="white"
                  inline
                  dark
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
                  @click="dialogEditPicture = false"
                />
              </div>
              <div class="q-pt-md q-pr-md">
                <q-btn
                  class="bluebtnmd font18"
                  label="ตกลง"
                  @click="editPictureBtn()"
                />
              </div>
            </div>
          </div>
        </q-card>
      </q-dialog>
      <!-- Dialog จัดประเภท -->
      <q-dialog v-model="dialogSetGroup">
        <q-card
          style="max-width: 1000px;width:800px;height:550px; overflow-y:hidden"
          class="bgdialogbig"
        >
          <div class="bginsidebig font30 " style="line-height:105px; ">
            <div class="row">
              <div class="col-1"></div>
              <div class="col-10" align="center">จัดประเภท</div>
              <div
                class="col-1 cursor-pointer"
                @click="dialogSetGroup = false"
                style="position:relative; top: -30px;"
              >
                x
              </div>
            </div>
          </div>
          <div class="bginsidebig2 font14" style="height:435px;">
            <div class="row q-pa-md">
              <div class="col-1 q-pt-sm" style="width:60px" align="center">
                ลำดับ
              </div>
              <div class="col-2" style="width:100px">
                <q-input
                  v-model="inputGroup.g_order"
                  dark
                  outlined
                  dense
                  rounded
                />
              </div>
              <div class="col-1 q-pt-sm" align="center" style="width:120px">
                ชื่อประเภท
              </div>
              <div class="col">
                <q-input
                  v-model="inputGroup.g_title"
                  dark
                  outlined
                  dense
                  rounded
                />
              </div>
              <div class="col-1" style="width:150px;" align="center">
                <q-btn
                  class="bluebtnsm font16"
                  label="ตกลง"
                  @click="addNewGroupBtn()"
                />
              </div>
            </div>
            <div style="height:340px; overflow-y:auto;">
              <div class="row q-pa-sm" style="background-color:#252253">
                <div class="col-1" style="width:150px">ลำดับ</div>
                <div class="col" align="left">ชื่อประเภท</div>
                <div class="col-1" style="width:100px">ลบ</div>
                <div class="col-1" style="width:100px">แก้ไข</div>
              </div>
              <div
                class="row q-pa-sm"
                v-for="(item, index) in groupList"
                :key="index"
                :style="index % 2 == 1 ? 'background-color:#14132D' : ''"
              >
                <div class="col-1" style="width:150px">{{ item.pm_order }}</div>
                <div class="col" align="left">{{ item.pm_title }}</div>
                <div
                  class="col-1 cursor-pointer"
                  style="width:100px"
                  @click="delGroup(item.pm_id, item.pm_title)"
                >
                  <u>ลบ</u>
                </div>
                <div
                  class="col-1 cursor-pointer"
                  style="width:100px"
                  @click="
                    editGroupBtn(item.pm_id, item.pm_title, item.pm_order)
                  "
                >
                  <u>แก้ไข</u>
                </div>
              </div>
            </div>
          </div>
        </q-card>
      </q-dialog>
      <!-- Dialog confirm delete ประเภท -->
      <q-dialog
        v-model="dialogConfirmDel"
        persistent
        transition-show="scale"
        transition-hide="scale"
      >
        <div class="bgdialog">
          <div class="bginside font18">
            ลบประเภท
          </div>
          <div class="bginside2 font18">
            <div class="q-pt-lg">
              <img src="../../public/images/exclaim.png" alt="" />
            </div>
            <div>
              คุณต้องการลบประเภท <i>{{ delGroupInput.title }}</i> ?
            </div>
            <div class="row q-pl-md justify-between">
              <div class="q-pt-lg">
                <q-btn
                  class="outlineblue font18"
                  outline
                  label="ยกเลิก"
                  @click="dialogConfirmDel = false"
                />
              </div>
              <div class="q-pt-lg q-pr-md">
                <q-btn
                  class="bluebtnmd font18"
                  label="ตกลง"
                  @click="delGroupReal"
                />
              </div>
            </div>
          </div>
        </div>
      </q-dialog>
      <!-- Dialog แก้ไขประเภท -->
      <q-dialog
        v-model="dialogConfirmEdit"
        persistent
        transition-show="scale"
        transition-hide="scale"
      >
        <div class="bgdialog" style="width:400px;">
          <div class="bginside font18 row">
            <div class="col-2"></div>
            <div class="col-8" align="center">แก้ไขประเภท</div>
            <div class="col-2"></div>
          </div>
          <div class="bginside2 font14 q-pt-md">
            <div class="row q-pa-md">
              <div class="col-1 q-pt-sm" align="left" style="width:100px">
                ลำดับ
              </div>
              <div class="col ">
                <q-input
                  v-model="editGroup.orderdata"
                  dark
                  outlined
                  dense
                  rounded
                />
              </div>
            </div>
            <div class="row q-px-md">
              <div class="col-1 q-pt-sm" align="left" style="width:100px">
                ชื่อประเภท
              </div>
              <div class="col">
                <q-input
                  v-model="editGroup.title"
                  dark
                  outlined
                  dense
                  rounded
                />
              </div>
            </div>
            <div class="row q-px-md justify-between">
              <div class="q-pt-lg q-pl-lg">
                <q-btn
                  class="outlineblue font18"
                  outline
                  label="ยกเลิก"
                  @click="dialogConfirmEdit = false"
                />
              </div>
              <div class="q-pt-lg q-pr-lg">
                <q-btn
                  class="bluebtnmd font18"
                  label="ตกลง"
                  @click="editGroupReal"
                />
              </div>
            </div>
          </div>
        </div>
      </q-dialog>
      <!-- bg สีเข้ม -->
      <div
        class="fullscreen bg-backdrop"
        v-show="
          dialogHowToUpload ||
            dialogAddNewPicture ||
            dialogSetGroup ||
            dialogConfirmDel ||
            dialogConfirmEdit
        "
      ></div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import pictureBlock from "../components/pictureblock";
export default {
  components: {
    pictureBlock
  },
  data() {
    return {
      txtsearch: "", //ข้อความค้นหา
      sortOrder: "ยอดวิวรวม", //เรียงลำดับ
      options: ["ยอดวิวรวม", "ยอดวิวต่อสัปดาห์", "ลำดับการอัพโหลด"], //ตัวเลือกในการเรียงลำดับ
      currentPage: 1, //หน้าปัจจุบัน
      page: 1, //หน้า
      pageMax: 1, //จำนวนหน้าสูงสุด
      pageOptions: [], //ตัวเลือกของหน้า
      dialogHowToUpload: false, //หน้าต่างวิธีการอัพโหลด
      uploadWindows: true, //ปุ่มวิธีการอัพโหลด True เป็นของ Windows
      dialogAddNewPicture: false, //หน้าต่างเพิ่มวาร์ปใหม่
      input: {
        title: "",
        type: "",
        folder: "",
        access: "ทั่วไป"
      }, //ข้อมูลการเพิ่มวาร์ปใหม่
      optionAccess: [
        {
          label: "ทั่วไป",
          value: "ทั่วไป"
        },
        {
          label: "สมาชิก",
          value: "สมาชิก"
        }
      ], //การเข้าถึงเพิ่มวาร์ปใหม่
      optionFolderList: ["c01"], //รายชื่อ Folder ในหน้าต่างเพิ่มเรื่องใหม่
      dialogSetGroup: false, //หน้าต่างจัดประเภท
      inputGroup: {
        g_order: "",
        g_title: ""
      }, //ข้อมูลเพิ่มจัดประเภท
      groupList: [], //List รายชื่อ group ทั้งหมด
      dialogConfirmDel: false, //หน้าต่าง confirm การลบของกลุ่ม
      delGroupInput: {
        id: "",
        title: ""
      }, //ข้อมูลที่ใช้ลบกลุ่ม
      dialogConfirmEdit: false, //หน้าต่าง Edit การแก้ไข
      editGroup: {
        id: "",
        orderdata: "",
        title: ""
      }, //ข้อมูลในหน้าต่างแก้ไข
      optionGroupList: [], //รายชื่อ ประเภทเรียงตาม order
      pictureData: [], //ข้อมูลรูป
      pictureList: [], //ข้อมูลที่โชว์บนหน้าจอ
      startPicture: 0, //รูปแรกที่โชว์
      endPicture: 0, //รูปสุดท้ายที่โชว์
      dialogSample: false, //หน้าต่างตัวอย่าง
      titleSample: "", //หัวข้อในหน้าตัวอย่าง
      pathSample: "", //ตำแหน่งของไฟล์
      pageSample: 0, //จำนวนหน้าที่มีในเรื่องนั้น
      dialogEditPicture: false, //หน้าต่างแก้ไข
      editID: 0, //รหัสแก้ไข
      pictureSearch: [] //ข้อมูลที่ได้จากการค้นหา
    };
  },
  methods: {
    async calPage() {
      //คำนวนหาหน้าทั้งหมดที่ต้องใช้
      this.pageOptions = [];
      let url = this.serverpath + "bo_picture_no_data.php";
      let res = await axios.get(url);
      this.pageMax = Math.ceil(res.data / 10);
      for (let i = 1; i <= this.pageMax; i++) {
        this.pageOptions.push(i);
      }
      this.page = this.currentPage;
    },
    async delPicture() {
      //ลบวาร์ป
      let temp = {
        id: this.editID
      };
      let url = this.serverpath + "bo_picture_del_picture.php";
      let res = await axios.post(url, JSON.stringify(temp));
      this.greenNotify("ลบข้อมูลเสร็จสิ้น");
      this.loadPictureList();
      this.dialogEditPicture = false;
    },
    async editDia(id) {
      //เปิดหน้าต่างแก้ไขข้อมูล
      await this.loadFolderList();
      await this.loadGroupList();
      this.dialogEditPicture = true;
      this.editID = id;
      this.refreshFolderListBtn();
      let dataShow = this.pictureData.filter(x => x.pt_id == id);
      this.input.title = dataShow[0].pt_title;
      this.input.type = dataShow[0].pt_mode_id;
      this.input.access = dataShow[0].pt_access;
      this.optionFolderList.unshift(dataShow[0].pt_folder);
    },
    async showSambleDia(id) {
      //แสดงหน้าตัวอย่างวาร์ป
      this.dialogSample = true;
      let showResult = this.pictureData.filter(x => x.pt_id == id);
      this.titleSample = showResult[0].pt_title;
      let temp = {
        pt_folder: showResult[0].pt_folder
      };
      let url = this.serverpath + "bo_picture_show_last_file.php";
      let res = await axios.post(url, JSON.stringify(temp));
      this.pageSample = Number(res.data);
      this.pathSample =
        this.serverpath + "picture/" + showResult[0].pt_folder + "/";
    },
    async addNewPictureBtn() {
      //เพิ่มวาร์ปชุดใหม่
      if (this.input.title.length == 0) {
        this.redNotify("กรุณาใส่ชื่อวาร์ป");
        return;
      }

      let temp = {
        pt_title: this.input.title,
        pt_mode_id: this.input.type,
        pt_folder: this.input.folder,
        pt_access: this.input.access,
        timestamp: new Date().getTime()
      };
      let url = this.serverpath + "bo_picture_add_picture.php";
      let res = await axios.post(url, JSON.stringify(temp));
      this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
      this.calPage();
      await this.loadPictureList();
      await this.pictureListShowInPage();
      this.dialogAddNewPicture = false;
    },
    async editPictureBtn() {
      // บันทึกแก้ไข;
      //Check ว่าใส่ข้อมูลครบถ้วน
      if (this.input.title.length == 0 || this.input.folder.length == 0) {
        this.redNotify("กรุณาใส่ข้อมูลให้ครบถ้วน");
        return;
      }
      //บันทึกข้อมูลเข้า Database
      let pt_temp = {
        pt_title: this.input.title,
        pt_folder: this.input.folder,
        pt_mode_id: this.input.type,
        pt_access: this.input.access,
        pt_timestamp: new Date().getTime(),
        pt_id: this.editID
      };

      let url = this.serverpath + "bo_picture_edit.php";
      let res = await axios.post(url, JSON.stringify(pt_temp));
      //ปิด Dialog
      this.dialogEditPicture = false;
      //ทำการอัพเดท List
      await this.loadPictureList();
      await this.pictureListShowInPage();
      window.location.reload();
    },
    editGroupBtn(id, title, orderdata) {
      //กดแก้ไขจาก List ประเภท
      this.editGroup.id = id;
      this.editGroup.orderdata = orderdata;
      this.editGroup.title = title;
      this.dialogConfirmEdit = true;
    },
    async editGroupReal() {
      //บันทึกการแก้ไขประเภท
      let temp = {
        pm_id: this.editGroup.id,
        pm_order: this.editGroup.orderdata,
        pm_title: this.editGroup.title,
        timestamp: new Date().getTime()
      };
      let url = this.serverpath + "bo_picture_edit_group.php";
      let res = await axios.post(url, JSON.stringify(temp));
      this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
      this.dialogConfirmEdit = false;
      this.loadGroupList();
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
    openGroupDialog() {
      //เปิดหน้าต่างจัดประเภท
      this.dialogSetGroup = true;
      this.loadGroupList();
    },
    async addNewGroupBtn() {
      //เพิ่มประเภท
      if (this.inputGroup.g_order == "" || this.inputGroup.g_title == "") {
        this.redNotify("กรุณากรอกข้อมูลให้ครบถ้วน");
        return;
      } else {
        let temp = {
          pm_order: this.inputGroup.g_order,
          pm_title: this.inputGroup.g_title,
          timestamp: new Date().getTime()
        };
        let url = this.serverpath + "bo_picture_add_group.php";
        let res = await axios.post(url, JSON.stringify(temp));
        if (res.data == "มีชื่อประเภทนี้แล้ว") {
          this.redNotify("มีชื่อประเภทนี้แล้ว");
        } else {
          this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
          this.inputGroup.g_order = "";
          this.inputGroup.g_title = "";
          this.loadGroupList();
        }
      }
    },
    async loadGroupList() {
      this.groupList = [];
      this.optionGroupList = [];
      let url = this.serverpath + "bo_picture_load_group.php";
      let res = await axios.get(url);
      res.data.forEach(x => {
        this.groupList.push(x);
        let tempx = {
          label: x.pm_title,
          value: x.pm_id
        };
        this.optionGroupList.push(tempx);
      });
      this.input.type = this.optionGroupList[0].value;
    },
    delGroup(id, title) {
      //กดลบกลุ่ม

      //เก็บค่า id,title
      this.delGroupInput.id = id;
      this.delGroupInput.title = title;

      //ขึ้น Dialog confirm
      // this.dialogSetGroup = false;
      // setTimeout(() => {
      this.dialogConfirmDel = true;
      // }, 1000);
    },
    async delGroupReal() {
      //ลบกลุ่มออกจริงๆ
      let temp = {
        id: this.delGroupInput.id
      };
      let url = this.serverpath + "bo_picture_del_group.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == "finish") {
        this.greenNotify("ลบข้อมูลเสร็จสิ้น");
        this.loadGroupList();
      } else {
        this.redNotify("ลบไม่ได้ มีวาร์ปอยู่ในประเภทนี้");
      }
      this.dialogConfirmDel = false;
    },
    changeOrder() {
      //เปลี่ยนการเรียง
      console.log("change order");
      if (this.txtsearch == "") {
        this.pictureListShowInPage();
      } else {
        //ทำการเลือกข้อมูลในหน้านั้น
        this.pictureList = [];
        if (this.sortOrder == "ยอดวิวรวม") {
          this.pictureSearch.sort(
            (a, b) => Number(b.statview) - Number(a.statview)
          );
        } else if (this.sortOrder == "ยอดวิวต่อสัปดาห์") {
          this.pictureSearch.sort((a, b) => {
            return Number(b.statweek) - Number(a.statweek);
          });
        } else {
          this.pictureSearch.sort(
            (a, b) => Number(a.pt_timestamp) - Number(b.pt_timestamp)
          );
        }
        this.startPicture = (this.page - 1) * 10 + 1;
        this.endPicture = this.page * 10;
        if (this.pictureSearch.length < this.endPicture) {
          this.endPicture = this.pictureSearch.length;
        }
        for (let i = this.startPicture - 1; i < this.endPicture; i++) {
          this.pictureList.push(this.pictureSearch[i]);
        }
      }
    },
    resetSearch() {
      //ยกเลิกการค้นหา
      this.txtsearch = "";
      this.calPage();
      this.page = 1;
      this.sortOrder = "ยอดวิวรวม";
      this.pictureListShowInPage();
    },
    searchData() {
      //เมื่อกดปุ่มค้นหา
      this.page = 1;
      this.sortOrder = "ยอดวิวรวม";
      this.pictureSearch = [];
      this.pictureData.forEach(x => {
        if (x.pt_title.indexOf(this.txtsearch) != -1) {
          this.pictureSearch.push(x);
        }
      });
      //ทำการหาจำนวนหน้าที่มีใหม่
      let pageFilter = Math.ceil(this.pictureSearch.length / 10);
      this.pageOptions = [];
      for (let i = 1; i <= pageFilter; i++) {
        this.pageOptions.push(i);
      }
      this.changePage();
    },
    changePage() {
      //เปลี่ยนหน้า

      if (this.txtsearch.trim().length == 0) {
        this.pictureListShowInPage();
      } else {
        //ทำการเลือกข้อมูลในหน้านั้น
        this.pictureList = [];
        if (this.sortOrder == "ยอดวิวรวม") {
          this.pictureSearch.sort(
            (a, b) => Number(b.statview) - Number(a.statview)
          );
        } else if (this.sortOrder == "ยอดวิวต่อสัปดาห์") {
          this.pictureSearch.sort((a, b) => {
            return Number(b.statweek) - Number(a.statweek);
          });
        } else {
          this.pictureSearch.sort(
            (a, b) => Number(a.pt_timestamp) - Number(b.pt_timestamp)
          );
        }
        this.startPicture = (this.page - 1) * 10 + 1;
        this.endPicture = this.page * 10;
        if (this.pictureSearch.length < this.endPicture) {
          this.endPicture = this.pictureSearch.length;
        }
        for (let i = this.startPicture - 1; i < this.endPicture; i++) {
          this.pictureList.push(this.pictureSearch[i]);
        }
      }
    },
    async openNewPicture() {
      //เปิดหน้าต่างเพิ่มเรื่องใหม่
      await this.loadFolderList();
      await this.loadGroupList();
      this.dialogAddNewPicture = true;
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
    async loadPictureList() {
      //load ข้อมูลการ์ตูน
      this.pictureData = [];
      let startTime = 1630256400000; // 1-July-2021
      let currentTime = new Date().getTime();
      let diffTime = currentTime - startTime;
      let diffWeek = Math.floor(diffTime / (1000 * 60 * 60 * 24 * 7));
      let temp = {
        diffWeek: diffWeek
      };

      let url = this.serverpath + "bo_picture_list.php";
      let res = await axios.post(url, JSON.stringify(temp));
      for (let i = 0; i < res.data.length; i++) {
        this.pictureData.push(res.data[i]);
      }
      this.pictureListShowInPage();
    },
    pictureListShowInPage() {
      // ทำข้อมูลสำหรับแสดงในหน้านั้น
      this.pictureList = [];

      let tempL = this.pictureList.length;
      //ทำการ sort ข้อมูล
      if (this.sortOrder == "ยอดวิวรวม") {
        this.pictureData.sort(
          (a, b) => Number(b.statview) - Number(a.statview)
        );
      } else if (this.sortOrder == "ยอดวิวต่อสัปดาห์") {
        this.pictureData.sort((a, b) => {
          return Number(b.statweek) - Number(a.statweek);
        });
      } else {
        this.pictureData.sort(
          (a, b) => Number(a.pt_timestamp) - Number(b.pt_timestamp)
        );
      }

      //ทำการเลือกข้อมูลในหน้านั้น
      this.startPicture = (this.page - 1) * 10 + 1;
      this.endPicture = this.page * 10;
      if (this.pictureData.length < this.endPicture) {
        this.endPicture = this.pictureData.length;
      }

      for (let i = this.startPicture - 1; i < this.endPicture; i++) {
        this.pictureList.push(this.pictureData[i]);
      }
    },
    async loadFolderList() {
      //โหลด Folder ใน picture
      this.optionFolderList = [];
      let url = this.serverpath + "bo_picture_list_folder.php";
      let res = await axios.get(url);
      res.data.forEach(x => {
        this.optionFolderList.push(x);
      });
      this.input.folder = this.optionFolderList[0];
    }
  },
  mounted() {
    this.calPage(); //คำนวนหาเพจที่ต้องมี
    this.loadPictureList();
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
