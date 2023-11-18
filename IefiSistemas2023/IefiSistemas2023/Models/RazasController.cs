﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace IefiSistemas2023.Models
{
    public class RazasController : Controller
    {
        private BichitosEntities db = new BichitosEntities();

        // GET: Razas
        public ActionResult Index()
        {
            var razas = db.Razas.Include(r => r.Animale);
            return View(razas.ToList());
        }

        // GET: Razas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Raza raza = db.Razas.Find(id);
            if (raza == null)
            {
                return HttpNotFound();
            }
            return View(raza);
        }

        // GET: Razas/Create
        public ActionResult Create()
        {
            ViewBag.Id_Animal = new SelectList(db.Animales, "Id_Animal", "Nombre_Animal");
            return View();
        }

        // POST: Razas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Raza,Nombre_Raza,Id_Animal,FechaBaja")] Raza raza)
        {
            if (ModelState.IsValid)
            {
                db.Razas.Add(raza);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id_Animal = new SelectList(db.Animales, "Id_Animal", "Nombre_Animal", raza.Id_Animal);
            return View(raza);
        }

        // GET: Razas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Raza raza = db.Razas.Find(id);
            if (raza == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id_Animal = new SelectList(db.Animales, "Id_Animal", "Nombre_Animal", raza.Id_Animal);
            return View(raza);
        }

        // POST: Razas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Raza,Nombre_Raza,Id_Animal,FechaBaja")] Raza raza)
        {
            if (ModelState.IsValid)
            {
                db.Entry(raza).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id_Animal = new SelectList(db.Animales, "Id_Animal", "Nombre_Animal", raza.Id_Animal);
            return View(raza);
        }

        // GET: Razas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Raza raza = db.Razas.Find(id);
            if (raza == null)
            {
                return HttpNotFound();
            }
            return View(raza);
        }

        // POST: Razas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Raza raza = db.Razas.Find(id);
            db.Razas.Remove(raza);
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
