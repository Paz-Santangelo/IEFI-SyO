using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using IEFI_SyO_Mascotas.Models;

namespace IEFI_SyO_Mascotas.Controllers
{
    public class Propietarios_MascotasController : Controller
    {
        private MascotasEntities db = new MascotasEntities();

        // GET: Propietarios_Mascotas
        public ActionResult Index()
        {
            return View(db.Propietarios_Mascotas.ToList());
        }

        // GET: Propietarios_Mascotas/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Propietarios_Mascotas propietarios_Mascotas = db.Propietarios_Mascotas.Find(id);
            if (propietarios_Mascotas == null)
            {
                return HttpNotFound();
            }
            return View(propietarios_Mascotas);
        }

        // GET: Propietarios_Mascotas/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Propietarios_Mascotas/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Propietario,Nombre_Propietario,Telefono,email")] Propietarios_Mascotas propietarios_Mascotas)
        {
            if (ModelState.IsValid)
            {
                db.Propietarios_Mascotas.Add(propietarios_Mascotas);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(propietarios_Mascotas);
        }

        // GET: Propietarios_Mascotas/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Propietarios_Mascotas propietarios_Mascotas = db.Propietarios_Mascotas.Find(id);
            if (propietarios_Mascotas == null)
            {
                return HttpNotFound();
            }
            return View(propietarios_Mascotas);
        }

        // POST: Propietarios_Mascotas/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Propietario,Nombre_Propietario,Telefono,email")] Propietarios_Mascotas propietarios_Mascotas)
        {
            if (ModelState.IsValid)
            {
                db.Entry(propietarios_Mascotas).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(propietarios_Mascotas);
        }

        // GET: Propietarios_Mascotas/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Propietarios_Mascotas propietarios_Mascotas = db.Propietarios_Mascotas.Find(id);
            if (propietarios_Mascotas == null)
            {
                return HttpNotFound();
            }
            return View(propietarios_Mascotas);
        }

        // POST: Propietarios_Mascotas/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Propietarios_Mascotas propietarios_Mascotas = db.Propietarios_Mascotas.Find(id);
            db.Propietarios_Mascotas.Remove(propietarios_Mascotas);
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
