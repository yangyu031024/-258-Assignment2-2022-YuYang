using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PropertySystem.Models;

namespace PropertySystem.Controllers
{
    public class LoginController : Controller
    {
        //数据库上下文连接对象
        private WuyeProjectEntities db = new WuyeProjectEntities();

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        //实现登录功能
        [HttpPost]
        public ActionResult Index(String username, String password)
        {
            if (String.IsNullOrEmpty(username))
            {
                ViewBag.notice = "用户名不能为空！";
                return View();
            }
            if (String.IsNullOrEmpty(password))
            {
                ViewBag.notice = "密码不能为空！";
                return View();
            }
            //去数据库查询是否存在该用户
            w_admin admin = db.w_admin.FirstOrDefault(p => p.username == username);
            if (admin == null)
            {
                ViewBag.notice = "用户不存在！";
            }
            else if (admin.pass != password)
            {
                ViewBag.notice = "密码不正确！";
            }
            else
            {
                //在这里需要记住登录成功的用户信息  COOKIE 或者 SESSION =》会话管理（HTTP请求是不会带状态请求的，需要使用COOKIE或者SESSION来标识请求，区分是谁访问服务端） COOKIE和SESSION有什么区别？ SESSION存储的安全性更高，安全数据，隐私数据推荐存储到SESSION中。额外注意：记住用户自己的账号和密码，则是用COOKIE，因为用户本身知道这些数据，存储在SESSION和COOKIE没区别。
                Session["username"] = admin.username;
                Session["nickname"] = admin.nickname;

                //登录成功，跳转到后端的页面
                return Redirect("/Admin/index");
            }
            return View();
        }

        public ActionResult logout()
        {
            Session["username"] = null;
            Session["nickname"] = null;
            return Redirect("/Login/index");
        }
    }
}