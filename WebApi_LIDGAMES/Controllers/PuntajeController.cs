using BackEnd_LIDGames.Entidades.Request;
using BackEnd_LIDGames.Entidades.Response;
using BackEnd_LIDGames.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace WebApi_LIDGAMES.Controllers
{
    public class PuntajeController : ApiController
    {
        // POST: Puntaje
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("api/puntaje/ingresarPuntaje")]

        public ResIngresarPuntaje ingresarPuntaje(ReqIngresarPuntaje req)
        {
            LogPuntaje miLogica = new LogPuntaje();

            return miLogica.ingresarPuntaje(req);

        }


        // GET: Puntaje
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("api/puntaje/obtenerPuntaje")]

        public ResObtenerPuntaje obtenerPuntaje()
        {
            ReqObtenerPuntaje req = new ReqObtenerPuntaje();

            LogPuntaje miLogica = new LogPuntaje();

            return miLogica.obtenerPuntaje(req);

        }
    }
}



