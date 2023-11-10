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
    public class InfoController : Controller
    {
        private WuyeProjectEntities db = new WuyeProjectEntities();

        // GET: Info
        public ActionResult Index()
        {
            return View(db.w_room_info.ToList());
        }

        // GET: Info/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            w_room_info w_room_info = db.w_room_info.Find(id);
            if (w_room_info == null)
            {
                return HttpNotFound();
            }
            return View(w_room_info);
        }

        // GET: Info/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Info/Create
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性；有关
        // 更多详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,name,phone,link_name,stop_car_area,construct_date,road_area,room_area,lh_area,room_number,address,remark")] w_room_info w_room_info)
        {
            if (ModelState.IsValid)
            {
                db.w_room_info.Add(w_room_info);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(w_room_info);
        }

        // GET: Info/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            w_room_info w_room_info = db.w_room_info.Find(id);
            if (w_room_info == null)
            {
                return HttpNotFound();
            }
            return View(w_room_info);
        }

        // POST: Info/Edit/5
        // 为了防止“过多发布”攻击，请启用要绑定到的特定属性；有关
        // 更多详细信息，请参阅 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,name,phone,link_name,stop_car_area,construct_date,road_area,room_area,lh_area,room_number,address,remark")] w_room_info w_room_info)
        {
            if (ModelState.IsValid)
            {
                db.Entry(w_room_info).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(w_room_info);
        }

        // GET: Info/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            w_room_info w_room_info = db.w_room_info.Find(id);
            if (w_room_info == null)
            {
                return HttpNotFound();
            }
            return View(w_room_info);
        }

        // POST: Info/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            w_room_info w_room_info = db.w_room_info.Find(id);
            db.w_room_info.Remove(w_room_info);
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
