<template>
  <div style="max-width:1600px; margin:auto;">
    <div class="contentDiv ">
      <div class="row q-pt-md justify-between" v-show="caneditable">
        <div>
          <div class="row btncustom">
            <div class="q-px-md">
              <q-icon name="fas fa-times" />
            </div>
            <div>ล้างไม่ผ่าน OTP</div>
          </div>
        </div>
      </div>
      <div class="q-pa-md">
        <q-table
          card-class="bgtable text-white"
          title="Treats"
          :data="data"
          :columns="columns"
          row-key="name"
          :filter="filter"
          dark
        >
          <template v-slot:top-right>
            <q-input
              borderless
              dense
              debounce="300"
              v-model="filter"
              placeholder="Search"
              dark
            >
              <template v-slot:append>
                <q-icon name="search" />
              </template>
            </q-input>
          </template>
        </q-table>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      filter: "",
      columns: [
        {
          name: "name",
          field: "name",
          required: true,
          label: "ชื่อผู้ใช้งาน",
          align: "left",
          sortable: true
        },
        {
          name: "calories",
          align: "center",
          label: "เบอร์โทรมือถือ",
          field: "calories",
          sortable: true
        },
        { name: "fat", label: "สถานะ", field: "fat", sortable: true },
        { name: "carbs", label: "วัน-เวลาสมัคร", field: "carbs" },
        { name: "protein", label: "อัตราการใช้งาน", field: "protein" },
        {
          name: "sodium",
          label: "คะแนนสัปดาห์ปัจจุบัน",
          field: "sodium"
        },
        {
          name: "calcium",
          label: "คะแนนรวม",
          field: "calcium",
          sortable: true,
          sort: (a, b) => parseInt(a, 10) - parseInt(b, 10)
        },
        {
          name: "iron",
          label: "รายละเอียด",
          field: "iron",
          sortable: true,
          sort: (a, b) => parseInt(a, 10) - parseInt(b, 10)
        }
      ],
      data: [
        {
          name: "Artzy",
          calories: "09253735553",
          fat: 6.0,
          carbs: 24,
          protein: 4.0,
          sodium: 87,
          calcium: "14%",
          iron: "1%"
        },
        {
          name: "Artzy2",
          calories: "0914567777",
          fat: 9.0,
          carbs: 37,
          protein: 4.3,
          sodium: 129,
          calcium: "8%",
          iron: "1%"
        }
      ]
    };
  }
};
</script>

<style lang="scss" scoped>
.bgtable {
  background-color: rgba(0, 0, 0, 0);
}
</style>
