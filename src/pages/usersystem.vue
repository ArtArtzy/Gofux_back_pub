<template>
  <div style="max-width:1600px; margin:auto;">
    <div class="contentDiv ">
      <div class="row q-pt-md justify-between" v-show="canEditAble">
        <div>
          <div class="row btncustom" @click="addKeyBtn">
            <div class="q-px-md">
              <q-icon name="fas fa-key" />
            </div>
            <div>การเข้ารหัส</div>
          </div>
        </div>
        <div class="row">
          <div class="row btncustom" @click="addNewTypeBtn">
            <div class="q-px-md">
              <q-icon name="fas fa-pen" />
            </div>
            <div>จัดการประเภท</div>
          </div>
          <div style="width: 15px;"></div>
          <div class="row btncustom" @click="addNewStaffMenu">
            <div class="q-px-md">
              <q-icon name="fas fa-plus" />
            </div>
            <div>เพิ่มผู้ดูแลระบบ</div>
          </div>
          <div style="width: 15px;"></div>
        </div>
      </div>

      <div class="row borderTitle">
        <div style="width: 130px;" align="center">ชื่อผู้ใช้งาน</div>
        <div style="width: 100px;" align="center">ประเภท</div>

        <div class="icondiv " align="center">
          <q-icon name="fas fa-user" size="20px" />
        </div>
        <div class="icondiv " align="center">
          <q-icon name="fas fa-video" size="20px" />
        </div>
        <div class="icondiv " align="center">
          <q-icon name="fas fa-book-open" size="20px" />
        </div>
        <div class="icondiv" align="center">
          <q-icon name="fas fa-newspaper" size="20px" />
        </div>
        <div class="icondiv" align="center">
          <q-icon name="fas fa-images" size="20px" />
        </div>
        <div class="icondiv" align="center">
          <q-icon name="fas fa-film" size="20px" />
        </div>
        <div class="icondiv" align="center">
          <q-icon name="fas fa-chart-line" size="20px" />
        </div>
        <div class="icondiv" align="center">
          <q-icon name="fas fa-users" size="20px" />
        </div>
        <div class="icondiv" align="center">
          <q-icon name="fas fa-users-cog" size="20px" />
        </div>
        <div
          style="width: 70px;"
          :class="{ disableText2: !canEditAble }"
          align="center"
        >
          ลบ
        </div>
        <div
          style="width: 70px;"
          :class="{ disableText2: !canEditAble }"
          align="center"
        >
          แก้ไข
        </div>
      </div>

      <div style="height:15px;"></div>
      <div
        v-for="(item, index) in datauser"
        :key="index"
        class="row"
        :class="[index % 2 ? 'bg-strip' : '']"
        style="height:40px;line-height:40px;"
      >
        <div style="width: 145px;" class="" align="center">
          {{ item.realname }}
        </div>
        <div style="width: 100px;" align="center">{{ item.rolename }}</div>

        <div class="icondiv2 " align="center" v-if="item.actress == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.actress == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div class="icondiv2 " align="center" v-if="item.movie == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.movie == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div class="icondiv2 " align="center" v-if="item.cartoon == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.cartoon == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div class="icondiv2 " align="center" v-if="item.story == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.story == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div class="icondiv2 " align="center" v-if="item.picture == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.picture == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div class="icondiv2 " align="center" v-if="item.ads == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.ads == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div class="icondiv2 " align="center" v-if="item.stat == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.stat == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div class="icondiv2 " align="center" v-if="item.member == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.member == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div class="icondiv2 " align="center" v-if="item.system == 0">
          <q-icon name="fas fa-times" style="color:#FF8888" />
        </div>
        <div class="icondiv2 " align="center" v-if="item.system == 1">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
        </div>

        <div
          align="center"
          style="width:70px;"
          class="disableText2 "
          v-if="!canEditAble"
        >
          <u>ลบ</u>
        </div>
        <div
          align="center"
          style="width:70px;"
          class="cursor-pointer"
          v-else
          @click="delSystemUser(item.userid, item.realname)"
        >
          <u>ลบ</u>
        </div>

        <div
          align="center"
          style="width:70px;"
          class="disableText2 "
          v-if="!canEditAble"
        >
          <u>แก้ไข</u>
        </div>
        <div
          align="center"
          style="width:70px;"
          class="cursor-pointer"
          v-else
          @click="editSystemUser(item.userid, item.realname)"
        >
          <u>แก้ไข</u>
        </div>
      </div>
      <div class="row remarkDiv">
        <div class="col-6" align="center">
          <q-icon name="fas fa-check" style="color:#C5EE90" />
          ใช้งานได้ทั้งหมด
        </div>
        <div class="col-6" align="center">
          <q-icon name="fas fa-times" style="color:#FF8888" />
          ไม่สามารถดูได้
        </div>
      </div>
    </div>

    <!--  Dialog จัดการประเภทผู้ดูแลระบบ -->
    <q-dialog v-model="editTypeMenu" persistent>
      <q-card style="max-width: 1200px;width:1000px;" class="bgdialogbig">
        <div class="bginsidebig font18">
          <div>จัดการประเภทผู้ดูแลระบบ</div>
          <div>
            <q-btn
              label="เพิ่มประเภท"
              icon="fas fa-plus"
              outline
              rounded
              @click="addNewTypeStep2"
            />
          </div>
        </div>
        <div class="bginsidebig2 font14">
          <div class="row justify-center q-pt-md">
            <div class="q-pt-sm">ประเภท</div>
            <div class="q-pl-md">
              <q-select
                v-model="userType"
                :options="userTypeList"
                emit-value
                map-options
                dark
                dense
                style="width:200px;"
                @input="showOption"
              />
            </div>
            <div class="q-pt-sm q-pl-md cursor-pointer">
              <q-icon name="fas fa-trash" size="20px" @click="delUserType" />
            </div>
          </div>
          <div class="row q-pt-md q-px-xl">
            <div class="col-5">
              <div class="row">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-user" />
                </div>
                <div style="width: 150px;" align="left">นักแสดงยอดนิยม</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.actress == 1
                      ? (accessJson.actress = 0)
                      : (accessJson.actress = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.actress == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.actress == 0
                      ? (accessJson.actress = 1)
                      : (accessJson.actress = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.actress == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-video" />
                </div>
                <div style="width: 150px;" align="left">หนังโป๊</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.movie == 1
                      ? (accessJson.movie = 0)
                      : (accessJson.movie = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.movie == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.movie == 0
                      ? (accessJson.movie = 1)
                      : (accessJson.movie = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.movie == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-book-open" />
                </div>
                <div style="width: 150px;" align="left">การ์ตูน</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.cartoon == 1
                      ? (accessJson.cartoon = 0)
                      : (accessJson.cartoon = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.cartoon == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.cartoon == 0
                      ? (accessJson.cartoon = 1)
                      : (accessJson.cartoon = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.cartoon == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-newspaper" />
                </div>
                <div style="width: 150px;" align="left">เล่าเรื่องเสียว</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.story == 1
                      ? (accessJson.story = 0)
                      : (accessJson.story = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.story == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.story == 0
                      ? (accessJson.story = 1)
                      : (accessJson.story = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.story == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-images" />
                </div>
                <div style="width: 150px;" align="left">ภาพโป๊</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.picture == 1
                      ? (accessJson.picture = 0)
                      : (accessJson.picture = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.picture == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.picture == 0
                      ? (accessJson.picture = 1)
                      : (accessJson.picture = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.picture == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
            </div>

            <div class="col-2"><div class="vl" style="margin:auto;"></div></div>
            <div class="col-5 ">
              <div class="row">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-film" />
                </div>
                <div style="width: 150px;" align="left">โฆษณา</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.ads == 1
                      ? (accessJson.ads = 0)
                      : (accessJson.ads = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.ads == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.ads == 0
                      ? (accessJson.ads = 1)
                      : (accessJson.ads = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[accessJson.ads == 0 ? 'redsymbol' : 'greysymbol']"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-chart-line" />
                </div>
                <div style="width: 150px;" align="left">วิเคราะห์การใช้งาน</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.stat == 1
                      ? (accessJson.stat = 0)
                      : (accessJson.stat = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.stat == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.stat == 0
                      ? (accessJson.stat = 1)
                      : (accessJson.stat = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[accessJson.stat == 0 ? 'redsymbol' : 'greysymbol']"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-users" />
                </div>
                <div style="width: 150px;" align="left">สมาชิก</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.member == 1
                      ? (accessJson.member = 0)
                      : (accessJson.member = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.member == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px "
                  class="cursor-pointer"
                  @click="
                    accessJson.member == 0
                      ? (accessJson.member = 1)
                      : (accessJson.member = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.member == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-users-cog" />
                </div>
                <div style="width: 150px;" align="left">ผู้ดูแลระบบ</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.system == 1
                      ? (accessJson.system = 0)
                      : (accessJson.system = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.system == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.system == 0
                      ? (accessJson.system = 1)
                      : (accessJson.system = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.system == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
            </div>
            <div class="row justify-center q-pt-md" style="width:100%">
              <div class="q-pr-md">
                <q-btn
                  label="ยกเลิก"
                  outline
                  color="white"
                  style="width:120px; height:45px;"
                  @click="
                    addTypeMenu = false;
                    editTypeMenu = false;
                  "
                />
              </div>
              <div class="q-pl-md">
                <q-btn
                  label="บันทึก"
                  color="deep-purple-13"
                  style="width:120px; height:45px;"
                  @click="editType"
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
        editTypeMenu ||
          addTypeMenu ||
          addNewStaff ||
          confirmDelSystemUser ||
          cannotDelAdminMenu ||
          confirmDelUserType ||
          cannotDelUserType ||
          editNewStaff ||
          addKeyDialog
      "
    ></div>
    <!-- Dialog เพิ่มประเภทผู้ดูแลระบบ -->
    <q-dialog v-model="addTypeMenu" persistent>
      <q-card style="max-width: 1200px;width:1000px;" class="bgdialogbig">
        <div class="bginsidebig font30">
          <div class="q-pt-lg">เพิ่มประเภทผู้ดูแลระบบ</div>
        </div>
        <div class="bginsidebig2 font14">
          <div class="row justify-center">
            <div class="q-pt-md">ประเภท:</div>
            <div class="q-pl-md">
              <q-input v-model="inputTypeText" dark dense="" />
            </div>
          </div>
          <div class="row q-pt-md q-px-xl">
            <div class="col-5">
              <!-- นักแสดงยอดนิยม -->
              <div class="row">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-user" />
                </div>
                <div style="width: 150px;" align="left">นักแสดงยอดนิยม</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.actress == 1
                      ? (accessJson.actress = 0)
                      : (accessJson.actress = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.actress == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.actress == 0
                      ? (accessJson.actress = 1)
                      : (accessJson.actress = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.actress == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
              <!-- หนังโป๊ -->
              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-video" />
                </div>
                <div style="width: 150px;" align="left">หนังโป๊</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.movie == 1
                      ? (accessJson.movie = 0)
                      : (accessJson.movie = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.movie == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.movie == 0
                      ? (accessJson.movie = 1)
                      : (accessJson.movie = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.movie == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
              <!-- การ์ตูน -->
              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-book-open" />
                </div>
                <div style="width: 150px;" align="left">การ์ตูน</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.cartoon == 1
                      ? (accessJson.cartoon = 0)
                      : (accessJson.cartoon = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.cartoon == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.cartoon == 0
                      ? (accessJson.cartoon = 1)
                      : (accessJson.cartoon = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.cartoon == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-newspaper" />
                </div>
                <div style="width: 150px;" align="left">เล่าเรื่องเสียว</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.story == 1
                      ? (accessJson.story = 0)
                      : (accessJson.story = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.story == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.story == 0
                      ? (accessJson.story = 1)
                      : (accessJson.story = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.story == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-images" />
                </div>
                <div style="width: 150px;" align="left">ภาพโป๊</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.picture == 1
                      ? (accessJson.picture = 0)
                      : (accessJson.picture = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.picture == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.picture == 0
                      ? (accessJson.picture = 1)
                      : (accessJson.picture = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.picture == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
            </div>

            <div class="col-2"><div class="vl" style="margin:auto;"></div></div>
            <div class="col-5 ">
              <div class="row">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-film" />
                </div>
                <div style="width: 150px;" align="left">โฆษณา</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.ads == 1
                      ? (accessJson.ads = 0)
                      : (accessJson.ads = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.ads == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.ads == 0
                      ? (accessJson.ads = 1)
                      : (accessJson.ads = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[accessJson.ads == 0 ? 'redsymbol' : 'greysymbol']"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-chart-line" />
                </div>
                <div style="width: 150px;" align="left">วิเคราะห์การใช้งาน</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.stat == 1
                      ? (accessJson.stat = 0)
                      : (accessJson.stat = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.stat == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.stat == 0
                      ? (accessJson.stat = 1)
                      : (accessJson.stat = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[accessJson.stat == 0 ? 'redsymbol' : 'greysymbol']"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-users" />
                </div>
                <div style="width: 150px;" align="left">สมาชิก</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.member == 1
                      ? (accessJson.member = 0)
                      : (accessJson.member = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.member == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px "
                  class="cursor-pointer"
                  @click="
                    accessJson.member == 0
                      ? (accessJson.member = 1)
                      : (accessJson.member = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.member == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-users-cog" />
                </div>
                <div style="width: 150px;" align="left">ผู้ดูแลระบบ</div>
                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.system == 1
                      ? (accessJson.system = 0)
                      : (accessJson.system = 1)
                  "
                >
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.system == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div
                  style="width:50px;"
                  class="cursor-pointer"
                  @click="
                    accessJson.system == 0
                      ? (accessJson.system = 1)
                      : (accessJson.system = 0)
                  "
                >
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.system == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
            </div>
            <div class="row justify-center q-pt-lg" style="width:100%">
              <div class="q-pr-md">
                <q-btn
                  label="ยกเลิก"
                  outline
                  color="white"
                  style="width:120px; height:45px;"
                  @click="cancelAddUserType"
                />
              </div>
              <div class="q-pl-md">
                <q-btn
                  label="บันทึก"
                  color="deep-purple-13"
                  style="width:120px; height:45px;"
                  @click="saveType"
                />
              </div>
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>

    <!-- Dialog confirm การลบ user type -->
    <q-dialog v-model="confirmDelUserType" persistent>
      <div class="bgdialog">
        <div class="bginside font18">
          ลบประเภทผู้ใช้งาน
        </div>
        <div class="bginside2 font18">
          <div class="q-pt-lg">
            <img src="../../public/images/exclaim.png" alt="" />
          </div>
          <div>
            คุณต้องการลบประเภท <i>{{ userTypeNameDel }}</i> ?
          </div>
          <div class="row q-pl-md justify-between">
            <div class="q-pt-lg">
              <q-btn
                class="outlineblue font18"
                outline
                label="ยกเลิก"
                @click="confirmDelUserType = false"
              />
            </div>
            <div class="q-pt-lg q-pr-md">
              <q-btn
                class="bluebtnmd font18"
                label="ตกลง"
                @click="delUserTypeReal"
              />
            </div>
          </div>
        </div>
      </div>
    </q-dialog>

    <!-- Dialog add new staff -->
    <q-dialog v-model="addNewStaff" persistent>
      <q-card style="max-width: 1200px;width:1000px;" class="bgdialogbigxl">
        <div class="bginsidebig font30">
          <div class="q-pt-lg">เพิ่มผู้ดูแลระบบ</div>
        </div>
        <div class="bginsidebig2xl font14">
          <div style="width:300px; margin:auto;">
            <div class="q-pt-md">
              <q-input
                outlined
                v-model="input.realname"
                dark
                label="ชื่อผู้ดูแลระบบ"
              />
            </div>
            <div class="q-pt-md">
              <q-input
                outlined
                v-model="input.username"
                dark
                label="ชื่อผู้ใช้งาน"
              />
            </div>
            <div class="q-pt-md">
              <q-input
                outlined
                v-model="input.password"
                dark
                label="รหัสผ่าน"
              />
            </div>
          </div>
          <div class="row justify-center q-py-md">
            <div class="q-pt-md">ประเภท:</div>
            <div class="q-pl-md">
              <q-select
                v-model="userType"
                :options="userTypeList"
                emit-value
                map-options
                dark
                dense
                style="width:200px;"
                @input="showOption"
              />
            </div>
          </div>
          <div class="row q-pt-md q-px-xl">
            <div class="col-5">
              <!-- นักแสดงยอดนิยม -->
              <div class="row ">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-user" />
                </div>
                <div style="width: 150px;" align="left">นักแสดงยอดนิยม</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.actress == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.actress == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <!-- หนังโป๊ -->
              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-video" />
                </div>
                <div style="width: 150px;" align="left">หนังโป๊</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.movie == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.movie == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-book-open" />
                </div>
                <div style="width: 150px;" align="left">การ์ตูน</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.cartoon == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.cartoon == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-newspaper" />
                </div>
                <div style="width: 150px;" align="left">เล่าเรื่องเสียว</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.story == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.story == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-images" />
                </div>
                <div style="width: 150px;" align="left">ภาพโป๊</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.picture == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.picture == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
            </div>

            <div class="col-2"><div class="vl" style="margin:auto;"></div></div>
            <div class="col-5 ">
              <div class="row">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-film" />
                </div>
                <div style="width: 150px;" align="left">โฆษณา</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.ads == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[accessJson.ads == 0 ? 'redsymbol' : 'greysymbol']"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-chart-line" />
                </div>
                <div style="width: 150px;" align="left">วิเคราะห์การใช้งาน</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.stat == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[accessJson.stat == 0 ? 'redsymbol' : 'greysymbol']"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-users" />
                </div>
                <div style="width: 150px;" align="left">สมาชิก</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.member == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px ">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.member == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-users-cog" />
                </div>
                <div style="width: 150px;" align="left">ผู้ดูแลระบบ</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.system == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.system == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
            </div>
            <div class="row justify-center q-pt-lg" style="width:100%">
              <div class="q-pr-md">
                <q-btn
                  label="ยกเลิก"
                  outline
                  color="white"
                  style="width:120px; height:45px;"
                  @click="showMain()"
                />
              </div>
              <div class="q-pl-md">
                <q-btn
                  label="บันทึก"
                  color="deep-purple-13"
                  style="width:120px; height:45px;"
                  @click="saveNewStaff()"
                />
              </div>
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>

    <!-- Dialog confirm delete -->
    <q-dialog v-model="confirmDelSystemUser" persistent>
      <div class="bgdialog">
        <div class="bginside font18">
          ลบผู้ดูแลระบบ
        </div>
        <div class="bginside2 font18">
          <div class="" style="padding-top:25px;">
            <img src="../../public/images/exclaim.png" alt="" />
          </div>
          <div>
            คุณต้องการลบประเภท <i>{{ userSystemNameDel }}</i> ?
          </div>
          <div
            class="row q-pl-md justify-between"
            style="width:300px; margin:auto;"
          >
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
    </q-dialog>

    <!-- Dialog you can't del admin account -->
    <q-dialog v-model="cannotDelAdminMenu" persistent>
      <div class="bgdialog">
        <div class="bginside font18">
          ลบ Admin
        </div>
        <div class="bginside2 font18">
          <div class="q-pt-lg">
            <img src="../../public/images/exclaim.png" alt="" />
          </div>
          <div>คุณไม่มีสิทธิลบ <i>Admin</i></div>
          <div class="row q-pl-md justify-center">
            <div class="q-pt-lg q-pr-md">
              <q-btn
                class="bluebtnmd font18"
                label="ตกลง"
                @click="cannotDelAdminMenu = false"
              />
            </div>
          </div>
        </div>
      </div>
    </q-dialog>

    <!-- Dialog you can't del user system type because there is exist user used it -->
    <q-dialog v-model="cannotDelUserType" persistent>
      <div class="bgdialog">
        <div class="bginside font18">
          ไม่สามารถลบประเภทผู้ดูแลระบบ
        </div>
        <div class="bginside2 font18">
          <div class="q-pt-lg">
            <img src="../../public/images/exclaim.png" alt="" />
          </div>
          <div>เนื่องจากมี user ที่ใช้ประเภทนี้อยู่</div>
          <div class="row q-pl-md justify-center">
            <div class="q-pt-lg q-pr-md">
              <q-btn
                class="bluebtnmd font18"
                label="ตกลง"
                @click="cannotDelUserType = false"
              />
            </div>
          </div>
        </div>
      </div>
    </q-dialog>

    <!-- Dialog edit staff -->
    <q-dialog v-model="editNewStaff" persistent>
      <q-card style="max-width: 1200px;width:1000px;" class="bgdialogbigxl">
        <div class="bginsidebig font30">
          <div class="q-pt-lg">แก้ไขผู้ดูแลระบบ</div>
        </div>
        <div class="bginsidebig2xl font14">
          <div style="width:300px; margin:auto;">
            <div class="q-pt-md">
              <q-input
                outlined
                v-model="input.realname"
                dark
                label="ชื่อผู้ดูแลระบบ"
              />
            </div>
            <div class="q-pt-md">
              <q-input
                outlined
                v-model="input.username"
                dark
                label="ชื่อผู้ใช้งาน"
              />
            </div>
            <div class="q-pt-md">
              <q-input
                outlined
                v-model="input.password"
                dark
                label="รหัสผ่าน"
              />
            </div>
          </div>
          <div class="row justify-center q-py-md">
            <div class="q-pt-md">ประเภท:</div>
            <div class="q-pl-md">
              <q-select
                v-model="userType"
                :options="userTypeList"
                emit-value
                map-options
                dark
                dense
                style="width:200px;"
                @input="showOption"
              />
            </div>
          </div>
          <div
            class="row q-pt-md "
            style="width: 780px; position:relative;left:150px;"
          >
            <div class="col-5">
              <div class="row ">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-user" />
                </div>
                <div style="width: 150px;" align="left">นักแสดงยอดนิยม</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.actress == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.actress == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-video" />
                </div>
                <div style="width: 150px;" align="left">หนังโป๊</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.movie == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.movie == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-book-open" />
                </div>
                <div style="width: 150px;" align="left">การ์ตูน</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.cartoon == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.cartoon == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-newspaper" />
                </div>
                <div style="width: 150px;" align="left">เล่าเรื่องเสียว</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.story == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.story == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-images" />
                </div>
                <div style="width: 150px;" align="left">ภาพโป๊</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.picture == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.picture == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
            </div>

            <div class="col-2 " style="width: 50px;">
              <div class="vl" style="margin:auto;"></div>
            </div>
            <div class="col-5 q-pl-md ">
              <div class="row">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-film" />
                </div>
                <div style="width: 150px;" align="left">โฆษณา</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.ads == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[accessJson.ads == 0 ? 'redsymbol' : 'greysymbol']"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-chart-line" />
                </div>
                <div style="width: 150px;" align="left">วิเคราะห์การใช้งาน</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.stat == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[accessJson.stat == 0 ? 'redsymbol' : 'greysymbol']"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-users" />
                </div>
                <div style="width: 150px;" align="left">สมาชิก</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.member == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px ">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.member == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>

              <div class="row q-pt-md">
                <div style="width:50px;" align="left">
                  <q-icon name="fas fa-users-cog" />
                </div>
                <div style="width: 150px;" align="left">ผู้ดูแลระบบ</div>
                <div style="width:50px;">
                  <q-icon
                    name="fas fa-check"
                    :class="[
                      accessJson.system == 1 ? 'greensymbol' : 'greysymbol'
                    ]"
                  />
                </div>

                <div style="width:50px;">
                  <q-icon
                    name="fas fa-times"
                    :class="[
                      accessJson.system == 0 ? 'redsymbol' : 'greysymbol'
                    ]"
                  />
                </div>
              </div>
            </div>
          </div>
          <div class="row justify-center q-pt-lg" style="width:100%">
            <div class="q-pr-md">
              <q-btn
                label="ยกเลิก"
                outline
                color="white"
                style="width:120px; height:45px;"
                @click="editNewStaff = false"
              />
            </div>
            <div class="q-pl-md">
              <q-btn
                label="บันทึก"
                color="deep-purple-13"
                style="width:120px; height:45px;"
                @click="saveEditStaff()"
              />
            </div>
          </div>
        </div>
      </q-card>
    </q-dialog>

    <!--Dialog input security key -->
    <q-dialog v-model="addKeyDialog" persistent>
      <div class="bgdialog">
        <div class="bginside font18">
          การเข้ารหัส
        </div>
        <div class="bginside2 font18">
          <div class="q-px-md" style="padding-top:25px;">
            <q-input
              label="รหัสป้องกันหนัง"
              dark
              outlined
              v-model="securityKey"
            ></q-input>
          </div>
          <div class="font14 q-px-md q-pt-md">
            รหัสที่ใช้ในการป้องกันการนำหนัง
            จำเป็นต้องเป็นค่าเดียวกับระบบหลังบ้านใน jw player
          </div>
          <div
            class="row q-pl-md justify-between"
            style="width:300px; margin:auto;"
          >
            <div class="q-pt-lg">
              <q-btn
                style="width:120px; height:45px;"
                class="outlineblue"
                outline
                label="ยกเลิก"
                @click="addKeyDialog = false"
              />
            </div>
            <div class="q-pt-lg q-pr-md">
              <q-btn
                style="width:120px; height:45px;"
                class="bluebtnmd"
                label="ตกลง"
                @click="editNewKeybtn"
              />
            </div>
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
      canEditAble: true, //true = view only mode
      datauser: [], //ข้อมูลรายชื่อผู้ดูแลระบบ
      userTypeOption: [], //ใช้เก็บข้อมูลทั้งหมดของแต่ละประเภทของผู้ดูแลระบบ
      userTypeList: [], //สำหรับใช้เป็นตัวเลือก (select) ประเภทผู้ดูแลระบบ
      userType: "", //เก็บค่ารหัสประเภทผู้ดูแลของผู้ใช้ปัจจุบัน
      securityKey: "", //รหัสป้องกันการแอบใช้ VDO
      addKeyDialog: false, //เปิด Dialog ข้อมูลการเข้ารหัส
      editTypeMenu: false, //เปิด Dialog จัดการประเภท
      addTypeMenu: false, //เปิด Dialog เพิ่มประเภท
      accessJson: {
        actress: 1,
        movie: 1,
        cartoon: 1,
        story: 1,
        picture: 1,
        ads: 1,
        stat: 1,
        member: 1,
        system: 1
      }, //ค่าสิทธิของแต่ละ usersystemtype ในหน้า จัดการประเภทผู้ดูแล
      confirmDelUserType: false, //Dialog ยืนยันการลบ usersystemtype
      cannotDelUserType: false, //Dialog บอกว่าลบ usersystemtype นี้ไม่ได้เพราะมีคนใช้อยู่
      userTypeNameDel: "", //เก็บชื่อประเภทของ usersystem ที่ต้องการจะลบ
      inputTypeText: "", //ชื่อประเภทที่ตั้งขึ้นในหน้าเพิ่มประภทผู้ดูแลระบบ / เพิ่มผู้ดูแล
      input: {
        realname: "",
        username: "",
        password: ""
      }, //ข้อมูลที่ใข้กรอกในหน้าเพิ่มผู้ดูแลระบบ
      addNewStaff: false, //เปิด Dialog สำหรับเพิ่มผูุ้ดูแลระบบ
      userSystemId: "", //user id ของคนที่แก้ไข
      editNewStaff: false,

      cannotDelAdminMenu: false,
      userSystemDelId: "",
      userSystemNameDel: "",
      confirmDelSystemUser: false
    };
  },
  methods: {
    //*********** */ โหลดข้อมูล
    async loadData() {
      //ดึงข้อมูลผู้ดูแลระบบ เรียงลำดับตาม username เก็บในตัวแปร datauser
      this.datauser = [];
      let tokenData = this.$q.localStorage.getItem("token");
      let data = { token: tokenData };
      let url = this.serverpath + "bo_loadusersystem.php";
      let res = await axios.post(url, JSON.stringify(data));
      this.datauser = res.data;
      this.datauser.sort((a, b) => (a.username > b.username ? 1 : -1));
    },
    async loadusertype() {
      /*ดึงข้อมูล usersystemtype จากฐานข้อมูล
      userTypeList สำหรับใช้เป็นตัวเลือก (select) ประเภทผู้ดูแลระบบ
      useTypeOption  ใช้เก็บข้อมูลทั้งหมดของแต่ละประเภทของผู้ดูแลระบบ
      userType = เก็บค่ารหัสประเภทผู้ดูแลของผู้ใช้ปัจจุบัน*/
      this.userTypeOption = [];
      this.userTypeList = [];
      let url = this.serverpath + "bo_loadusersytemtype.php";
      let res = await axios.get(url);
      for (let i = 0; i < res.data.length; i++) {
        let data = res.data[i];
        let temp = {
          id: data.id,
          typename: data.typename,
          actress: data.actress,
          ads: data.ads,
          cartoon: data.cartoon,
          frontpanel: data.frontpanel,
          member: data.member,
          movie: data.movie,
          picture: data.picture,
          stat: data.stat,
          story: data.story,
          system: data.system
        };
        this.userTypeOption.push(temp);
        let temp2 = {
          value: data.id,
          label: data.typename
        };
        this.userTypeList.push(temp2);
      }
      this.userTypeList.sort((a, b) => (a.label > b.label ? 1 : -1));
      this.userType = this.$q.localStorage.getItem("roleid");
      this.showOption();
    },
    //*********** */ การเข้ารหัส
    async editNewKeybtn() {
      //ทำการเปลี่ยนรหัสสำหรับป้องกันการกันคนอื่นมาใช้ VDO ของเรา
      if (this.securityKey.length == 0) {
        this.redNotify("กรุณากรอกข้อมูลให้ครบถ้วน");
        return;
      }
      let tokenData = this.$q.localStorage.getItem("token");
      let temp = {
        securityKey: this.securityKey,
        token: tokenData
      };
      let url = this.serverpath + "bo_addnewkey.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == "finish") {
        this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
        this.addKeyDialog = false;
      }
    },
    async addKeyBtn() {
      //ทำการเปิดหน้าต่างสำหรับการเข้ารหัสเพื่อป้องกันคนอื่นมาใช้ VDO ของเรา
      let tokenData = this.$q.localStorage.getItem("token");
      let temp = {
        token: tokenData
      };
      let url = this.serverpath + "bo_getkey.php";
      let res = await axios.post(url, JSON.stringify(temp));
      this.securityKey = res.data; //ค่า securityKey สำหรับการป้องกัน VDO
      this.addKeyDialog = true; //เปิดหน้าต่าง Dialog การเข้ารหัส
    },
    //*********** */ จัดการประเภท
    addNewTypeBtn() {
      //กดปุ่ม จัดการประเภท
      this.loadusertype(); //ทำการ load usersystemtype
      this.editTypeMenu = true; //เปิดเมนูสำหรับแก้ไขจัดการประเภท
    },
    addNewTypeStep2() {
      //เมื่อกดปุ่ม เพิ่มประเภท ในหน้าจัดการประเภทผู้ดูแลระบบ
      this.accessJson = {
        actress: 1,
        movie: 1,
        cartoon: 1,
        story: 1,
        picture: 1,
        ads: 1,
        stat: 1,
        member: 1,
        system: 1
      };
      this.inputTypeText = "";
      this.editTypeMenu = false; //ปิดหน้าต่างจัดการประเภทผู้ดูแลระบบ
      this.addTypeMenu = true; //เปิดหน้าต่างสำหรับเพิ่มประเภทผู้ดูแลระบบ
    },
    async editType() {
      // เมื่อกดบันทึกในหน้าจัดการประเภท
      let temp = {
        id: this.userType,
        typename: this.inputTypeText,
        actress: this.accessJson.actress,
        movie: this.accessJson.movie,
        cartoon: this.accessJson.cartoon,
        story: this.accessJson.story,
        picture: this.accessJson.picture,
        ads: this.accessJson.ads,
        stat: this.accessJson.stat,
        member: this.accessJson.member,
        system: this.accessJson.system,
        editor: this.$q.localStorage.getItem("username"),
        timestamp: new Date().getTime()
      };
      let url = this.serverpath + "bo_editusersystemtype.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == "finish") {
        this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
        this.loadData();
        this.loadusertype();
        this.editTypeMenu = false;
      }
    },
    cancelAddUserType() {
      //ยกเลิกเพิ่มประเภทผู้ดูแลระบบ
      this.addTypeMenu = false; //ปิด Dialog สำหรับเพิ่มประเภทผู้ดูลแลระบบ
      this.editTypeMenu = true; //เปิด Dialog สำหรับจัดการประเภท
    },
    async saveType() {
      //เมื่อกดบันทึก เพิ่มประเภทผู้ดูแล
      if (this.inputTypeText.length == 0) {
        this.redNotify("กรุณาใส่ชื่อประเภท");
        return;
      }

      let temp = {
        typename: this.inputTypeText,
        actress: this.accessJson.actress,
        movie: this.accessJson.movie,
        cartoon: this.accessJson.cartoon,
        story: this.accessJson.story,
        picture: this.accessJson.picture,
        ads: this.accessJson.ads,
        stat: this.accessJson.stat,
        member: this.accessJson.member,
        system: this.accessJson.system,
        editor: this.$q.localStorage.getItem("username"),
        timestamp: new Date().getTime()
      };
      let url = this.serverpath + "bo_addusersystemtype.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == "มีชื่อประเภทซ้ำ") {
        this.redNotify("มีชื่อประเภทนี้แล้ว");
      } else {
        this.greenNotify("บันทึกข้อมูลเรียบร้อย");
        this.addTypeMenu = false;
        this.editTypeMenu = true;
        this.accessJson = {
          actress: 1,
          movie: 1,
          cartoon: 1,
          story: 1,
          picture: 1,
          ads: 1,
          stat: 1,
          member: 1,
          system: 1
        };
        this.inputTypeText = "";
        this.loadData();
        this.loadusertype();
      }
    },
    async delUserType() {
      //ทำการ check ว่ามี user ใน role นี้หรือเปล่าว ถ้าไม่มีถึงยอมให้ลบได้ โดยจะขึ้น confirm อีกท แต่ถ้ามีขึ้นข้อความเตือนและลบไม่ได้
      let temp = {
        roleid: this.userType
      };
      let url = this.serverpath + "bo_checkexistusertype.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == true) {
        this.confirmDelUserType = true; //เปิดหน้าต่างยืนยันการลบปรเภทผู้ใช้งาน
        this.userTypeNameDel = this.userTypeList.filter(
          x => x.value == this.userType
        )[0].label; //ชื่อ usertype ที่ต้องการจะลบ
      } else {
        this.cannotDelUserType = true;
      }
    },
    async delUserTypeReal() {
      // เมื่อกดตกลง ในการลบ usersystemtype
      let temp = {
        id: this.userType
      };
      let url = this.serverpath + "bo_delusersystemtype.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == "finish") {
        this.greenNotify("ลบข้อมูลเสร็จสิ้น");
        this.loadusertype();
        this.confirmDelUserType = false;
      }
    },
    //********** */เพิ่มผู้ดูแลระบบ
    addNewStaffMenu() {
      //เปิดหน้าต่าง เพิ่มผู้ดูแลระบบ
      this.input.username = "";
      this.input.password = "";
      this.input.realname = "";
      this.addNewStaff = true;
      this.loadusertype();
    },
    showOption() {
      //เมื่อทำการเลือกประเภท ในหน้า จัดการประเภทผู้ดูแลระบบ ทำการโชว์ค่าที่เลือกไว้ในแต่ละประเภท
      let dataShow = this.userTypeOption.filter(x => x.id == this.userType);

      this.accessJson.frontpanel = dataShow[0].frontpanel;
      this.accessJson.actress = dataShow[0].actress;
      this.accessJson.movie = dataShow[0].movie;
      this.accessJson.cartoon = dataShow[0].cartoon;
      this.accessJson.story = dataShow[0].story;
      this.accessJson.picture = dataShow[0].picture;
      this.accessJson.ads = dataShow[0].ads;
      this.accessJson.stat = dataShow[0].stat;
      this.accessJson.member = dataShow[0].member;
      this.accessJson.system = dataShow[0].system;
    },
    showMain() {
      //ใข้ตอนยกเลิกหน้าต่างเพิ่มผู้ดูแลระบบ
      this.addNewStaff = false;
      this.loadData();
    },
    async saveNewStaff() {
      //ใช้เพื่อเพิ่มผู้ดูแลระบบคนใหม่เข้า database กดตกลง
      if (
        this.input.username.length == 0 ||
        this.input.password.length == 0 ||
        this.input.realname.length == 0
      ) {
        this.redNotify("กรุณากรอกข้อมูลให้ครบถ้วน");
        return;
      }
      if (this.input.username == "admin") {
        this.redNotify("คุณไม่มีสิทธิ์สร้างผู้ใช้งานชื่อ admin");
        return;
      }
      let temp = {
        username: this.input.username,
        password: this.input.password,
        realname: this.input.realname,
        roleid: this.userType,
        editor: this.$q.localStorage.getItem("username"),
        timestamp: new Date().getTime()
      };
      let url = this.serverpath + "bo_addusersystem.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == "finish") {
        this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
        this.addNewStaff = false;
        this.loadData();
      } else {
        this.redNotify("username นี้มีแล้วในระบบ");
      }
    },

    delSystemUser(id, realname) {
      //เรียกหน้าต่างลบ user ขึ้นมา
      if (realname == "admin") {
        this.cannotDelAdminMenu = true;
      } else {
        this.confirmDelSystemUser = true;
        this.userSystemNameDel = realname;
        this.userSystemDelId = id;
      }
    },
    async delUserSystemReal() {
      //ลบ user ออกจากระบบ
      let temp = {
        id: this.userSystemDelId
      };

      let url = this.serverpath + "bo_delusersystem.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == "finish") {
        this.greenNotify("ลบข้อมูลเสร็จสิ้น");
        this.loadData();
        this.confirmDelSystemUser = false;
      }
    },
    async editSystemUser(id, realname) {
      //เมื่อกด แก่ไข
      this.editNewStaff = true;
      this.userSystemId = id;
      let tokenData = this.$q.localStorage.getItem("token");
      let temp = {
        userid: this.userSystemId,
        token: tokenData
      };
      let url = this.serverpath + "bo_loadusersystemwithid.php";
      let res = await axios.post(url, JSON.stringify(temp));

      this.input.realname = res.data[0].realname;
      this.input.username = res.data[0].username;
      this.input.password = res.data[0].password;
      await this.loadusertype();
      this.userType = res.data[0].roleid;

      this.showOption();
    },
    async saveEditStaff() {
      // เมื่อดกบันทในหน้าแก้ไขผู้ดูแลระบบ
      if (
        this.input.username.length == 0 ||
        this.input.password.length == 0 ||
        this.input.realname.length == 0
      ) {
        this.redNotify("กรุณากรอกข้อมูลให้ครบถ้วน");
        return;
      }
      let temp = {
        userid: this.userSystemId,
        realname: this.input.realname,
        username: this.input.username,
        password: this.input.password,
        roleid: this.userType,
        editor: this.$q.localStorage.getItem("username"),
        timestamp: new Date().getTime()
      };
      let url = this.serverpath + "bo_editusersystem.php";
      let res = await axios.post(url, JSON.stringify(temp));
      if (res.data == "finish") {
        this.greenNotify("บันทึกข้อมูลเสร็จสิ้น");
        this.loadData();
        this.editNewStaff = false;
      }
    }
  },
  async mounted() {
    let accessable = await this.checkAuth(9);
    //accesable =1 : access ,0 can not access
    if (accessable != 0) {
      this.loadData(); //โหลดข้อมูล usersystem
    }
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
.remarkDiv {
  width: 400px;
  margin: auto;
  border: 1px solid white;
  border-radius: 5px;
  padding: 10px;
  margin-top: 20px;
}
.icondiv {
  width: calc((100% - 370px) / 9);
}
.icondiv2 {
  width: calc((100% - 415px) / 9);
}
.disableText2 {
  color: #5f5f5f;
}
.vl {
  border-left: 1px solid #fef3f9;
  height: 180px;
  width: 1px;
}
.greysymbol {
  color: #656565;
}
.greensymbol {
  color: #c5ee90;
}
.redsymbol {
  color: #ff8888;
}
.bluesymbol {
  color: #1976d2;
}
</style>
