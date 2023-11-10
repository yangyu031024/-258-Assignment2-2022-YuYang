﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PropertySystem.Models;
using System.Web.Script.Serialization;
using System.Linq.Expressions;

namespace PropertySystem.Controllers
{
    public class SystemController : Controller
    {
        private WuyeProjectEntities db = new WuyeProjectEntities();

        // GET: System
        public ActionResult Index(String type="",String name = "")
        {
            IEnumerable<w_system_params> list = db.w_system_params;
            //如果有查询参数过来，我们就匹配条件，如果没有条件，则正常返回列表即可

            if (!string.IsNullOrEmpty(type)&& string.IsNullOrEmpty(name))
            {

                list = list.Where(p => p.type == type);
            }
            if (!string.IsNullOrEmpty(name) && string.IsNullOrEmpty(type))
            {
                list = list.Where(p => p.name == name) ;
            }
            if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(type))
            {
                list = list.Where(p => p.name == name && p.type==type);
            }
            list.OrderByDescending(t => t.id); ;
            return View(list.ToList());
        }


        // GET: System/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            w_system_params w_system_params = db.w_system_params.Find(id);
            if (w_system_params == null)
            {
                return HttpNotFound();
            }
            return View(w_system_params);
        }

        // GET: System/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: System/Create
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性；有关
        // 更多详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,code,name,type")] w_system_params w_system_params)
        {

            db.w_system_params.Add(w_system_params);
            int result = db.SaveChanges();
            if (result > 0)
            {
                //保存成功提示，并且跳转到小区首页！！
                return Content("<script>alert('保存系统参数成功！');window.location.href='/System/Index';</script>");
            }
            else
            {
                ViewBag.notice = "保存系统参数失败！请重试。";
            }

            return View(w_system_params);
        }

        // GET: System/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            w_system_params w_system_params = db.w_system_params.Find(id);
            if (w_system_params == null)
            {
                return HttpNotFound();
            }
            return View(w_system_params);
        }

        // POST: System/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性；有关
        // 更多详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,code,name,type")] w_system_params w_system_params)
        {
            if (ModelState.IsValid)
            {
                db.Entry(w_system_params).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(w_system_params);
        }

        // POST: System/Delete/5
        public ActionResult DeleteConfirmed(int id)
        {
            //查找id对应的信息回来，判断是否有这条数据
            w_system_params w_system_params = db.w_system_params.Find(id);
            //移除这条数据
            db.w_system_params.Remove(w_system_params);
            //保存数据库操作
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
