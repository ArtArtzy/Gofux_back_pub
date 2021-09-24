import Vue from "vue";
import VueRouter from "vue-router";

import routes from "./routes";

Vue.use(VueRouter);
import axios from "axios";

/*
 * If not building with SSR mode, you can
 * directly export the Router instantiation;
 *
 * The function below can be async too; either use
 * async/await or return a Promise which resolves
 * with the Router instance.
 */

export default function(/* { store, ssrContext } */) {
  const Router = new VueRouter({
    scrollBehavior: () => ({ x: 0, y: 0 }),
    routes,

    // Leave these as they are and change in quasar.conf.js instead!
    // quasar.conf.js -> build -> vueRouterMode
    // quasar.conf.js -> build -> publicPath
    mode: process.env.VUE_ROUTER_MODE,
    base: process.env.VUE_ROUTER_BASE
  });

  return Router;
}
Vue.mixin({
  data() {
    return {
      // serverpath: "https://www.yaksaconcept.com/gofuxapi/"
      serverpath: "http://localhost/gofux/"
    };
  },
  methods: {
    async checkAuth(section) {
      this.datauser = [];
      let tokenData = this.$q.localStorage.getItem("token");
      let data = { token: tokenData, menu: section };
      let url = this.serverpath + "bo_checkaccessmenuwithtoken.php";
      let res = await axios.post(url, JSON.stringify(data));
      if (res.data == "false") {
        localStorage.clear();
        this.$router.push("/");
      }
      if (res.data == 0) {
        this.$router.push("/welcome");
      }
      return res.data;
    },
    redNotify(text) {
      this.$q.notify({
        message: text,
        icon: "announcement",
        color: "negative",
        position: "top"
      });
    },
    greenNotify(text) {
      this.$q.notify({
        message: text,

        color: "secondary",
        position: "top"
      });
    }
  }
});
