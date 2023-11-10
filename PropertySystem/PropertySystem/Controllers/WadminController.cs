using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PropertySystem.Models;

namespace PropertySystem.Controllers
{
    public class WadminController : Controller
    {
        private WuyeProjectEntities db = new WuyeProjectEntities();

        // GET: Wadmin
        public ActionResult Index()
        {
            return View(db.w_admin.ToList());
        }

        // GET: Wadmin/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            w_admin w_admin = db.w_admin.Find(id);
            if (w_admin == null)
            {
                return HttpNotFound();
            }
            return View(w_admin);
        }

        // GET: Wadmin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Wadmin/Create
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性；有关
        // 更多详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        public ActionResult Create([Bind(Include = "id,username,pass,nickname,power,createtime")] w_admin w_admin)
        {
            if (ModelState.IsValid)
            {
                db.w_admin.Add(w_admin);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(w_admin);
        }

        // GET: Wadmin/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            w_admin w_admin = db.w_admin.Find(id);
            if (w_admin == null)
            {
                return HttpNotFound();
            }
            return View(w_admin);
        }

        // POST: Wadmin/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性；有关
        // 更多详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        public ActionResult Edit([Bind(Include = "id,username,pass,nickname,power,createtime")] w_admin w_admin)
        {
            if (ModelState.IsValid)
            {
                db.Entry(w_admin).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(w_admin);
        }

        // GET: Wadmin/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            w_admin w_admin = db.w_admin.Find(id);
            if (w_admin == null)
            {
                return HttpNotFound();
            }
            return View(w_admin);
        }

        //以get方式提交删除数据
        public ActionResult DeleteConfirmed(int id)
        {
            w_admin w_admin = db.w_admin.Find(id);
            db.w_admin.Remove(w_admin);
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
