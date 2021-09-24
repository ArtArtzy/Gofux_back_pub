<template>
  <div style="max-width:1600px; margin:auto;">
    <div class="contentDiv ">
        <!-- แถวแรก -->
        <div class="row q-pt-md justify-between">
          <div class="row btncustom" @click="openNewPicture">
              <div class="q-px-md">
                <q-icon name="fas fa-tags" />
              </div>
              <div>ป้ายกำกับ</div>
          </div>
          <div class="row">
            <div class="row btncustom" @click="openNewPicture">
              <div class="q-px-md">
                <q-icon name="fas fa-cloud-upload-alt"  />
              </div>
              <div>การอัพโหลด</div>
            </div>
            <div style="width: 15px;"></div>
            <div class="row btncustom" @click="openNewPicture">
              <div class="q-px-md">
                <q-icon name="fas fa-plus"  />
              </div>
            <div>เพิ่มวีดีโอ</div>
            </div>
          </div>
        </div>
        <!-- ค้นหา -->
        <div class="row q-pt-md">
          
        </div>

      </div>
    </div>
  </div>
</template>

<script>
export default {};
</script>

<style lang="scss" scoped></style>
