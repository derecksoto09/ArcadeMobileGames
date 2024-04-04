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
    public class UsuarioController : ApiController
    {
        // POST: Encontrar Usuario
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("api/usuario/encontrarUsuario")]
        public ResEncontrarUsuario encontrarUsuario(ReqEncontrarUsuario req)
        {
            LogUsuario miLogica = new LogUsuario();

            return miLogica.encontrarUsuario(req);
        }


        // POST: Ingresar Usuario
        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("api/usuario/ingresarUsuarios")]
        public ResIngresarUsuario ingresarUsuarios(ReqIngresarUsuario req)
        {
            LogUsuario miLogica = new LogUsuario();

            return miLogica.ingresarUsuarios(req);
        }
    }
}