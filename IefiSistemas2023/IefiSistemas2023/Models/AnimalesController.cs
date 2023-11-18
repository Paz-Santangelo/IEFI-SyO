using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace IefiSistemas2023.Models
{
    public class AnimalesController : Controller
    {
        private BichitosEntities db = new BichitosEntities();

        // GET: Animales
        public ActionResult Index()
        {
            return View(db.Animales.ToList());
        }

        // GET: Animales/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Animale animale = db.Animales.Find(id);
            if (animale == null)
            {
                return HttpNotFound();
            }
            return View(animale);
        }

        // GET: Animales/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Animales/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Animal,Nombre_Animal,FechaBaja")] Animale animale)
        {
            if (ModelState.IsValid)
            {
                db.Animales.Add(animale);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(animale);
        }

        // GET: Animales/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Animale animale = db.Animales.Find(id);
            if (animale == null)
            {
                return HttpNotFound();
            }
            return View(animale);
        }

        // POST: Animales/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Animal,Nombre_Animal,FechaBaja")] Animale animale)
        {
            if (ModelState.IsValid)
            {
                db.Entry(animale).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(animale);
        }

        // GET: Animales/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Animale animale = db.Animales.Find(id);
            if (animale == null)
            {
                return HttpNotFound();
            }
            return View(animale);
        }

        // POST: Animales/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Animale animale = db.Animales.Find(id);
            db.Animales.Remove(animale);
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
