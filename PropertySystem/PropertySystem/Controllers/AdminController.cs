using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PropertySystem.Models;

namespace PropertySystem.Controllers
{
    public class AdminController : Controller
    {
        private WuyeProjectEntities db = new WuyeProjectEntities();
        // GET: Admin
        public ActionResult Index()
        {
            //如果用户没有登录，需要强制先登录！！ 避免没有权限也可以操作后台，这样是很不安全的！
            if(Session["username"] == null)
            {
                return Redirect("/Login/index");
            }
            return View();
        }

        //小区管理部分的编写
        //小区管理的首页
        public ActionResult RoomIndex()
        {
            //获取一条小区信息回来展示
            w_room_info info = db.w_room_info.FirstOrDefault();
            return View(info);
        }

        //实现添加小区
        public ActionResult AddRoom()
        {
            return View();
        }

        //实现添加小区操作
        [HttpPost]
        public ActionResult AddRoom(w_room_info room)
        {
            ViewBag.notice = "";
            db.w_room_info.Add(room);
            //执行完添加之后，还要补充一句话！！
            //执行修改数据库操作
            int result = db.SaveChanges();
            if(result > 0)
            {
                //保存成功提示，并且跳转到小区首页！！
                return Content("<script>alert('保存小区信息成功！');window.location.href='/Admin/RoomIndex';</script>");
            }
            else
            {
                ViewBag.notice = "保存小区信息失败！请重试。";
            }
            return View();
        }

        //编辑小区信息
        public ActionResult UpdateRoom()
        {
            //取一条信息回来
            w_room_info info = db.w_room_info.FirstOrDefault();
            if(info == null)
            {
                //如果不存在编辑的信息，需要先提示新增，才能修改！！避免一开始就直接编辑了。
                return Content("<script>alert('未找到需要编辑小区的信息，请先新增小区信息！');window.location.href='/Admin/AddRoom';</script>");
            }

            return View(info);
        }

        [HttpPost]
        public ActionResult UpdateRoom(w_room_info info)
        {
            db.Entry(info).State = System.Data.Entity.EntityState.Modified;
            //新增、修改、删除 对数据库执行相关操作时，都要保存修改操作！！
            if(db.SaveChanges() > 0)
            {
                return Content("<script>alert('编辑小区信息成功！');window.location.href='/Admin/RoomIndex';</script>");
            }
            else
            {
                ViewBag.notice = "编辑小区信息失败！请重试。";
            }
            return View();
        }
    }
}