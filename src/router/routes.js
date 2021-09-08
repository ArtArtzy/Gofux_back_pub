const routes = [
  {
    path: "/welcome",
    component: () => import("layouts/MainLayout.vue"),
    children: [
      {
        path: "",
        component: () => import("pages/Welcome.vue"),
        name: "welcome"
      },
      {
        path: "/usersystem",
        component: () => import("pages/usersystem.vue"),
        name: "usersystem"
      },
      {
        path: "/user",
        component: () => import("pages/user.vue"),
        name: "user"
      },
      {
        path: "/analysis",
        component: () => import("pages/analysis.vue"),
        name: "analysis"
      },
      {
        path: "/ads",
        component: () => import("pages/ads.vue"),
        name: "ads"
      },
      {
        path: "/picture",
        component: () => import("pages/picture.vue"),
        name: "picture"
      },
      {
        path: "/story",
        component: () => import("pages/story.vue"),
        name: "story"
      },
      {
        path: "/cartoon",
        component: () => import("pages/cartoon.vue"),
        name: "cartoon"
      },
      {
        path: "/movie",
        component: () => import("pages/movie.vue"),
        name: "movie"
      },
      {
        path: "/actress",
        component: () => import("pages/actress.vue"),
        name: "actress"
      },
      {
        path: "/website",
        component: () => import("pages/website.vue"),
        name: "website"
      }
    ]
  },

  {
    path: "/",
    component: () => import("pages/login.vue")
  },
  // Always leave this as last one,
  // but you can also remove it
  {
    path: "*",
    component: () => import("pages/Error404.vue")
  }
];

export default routes;
