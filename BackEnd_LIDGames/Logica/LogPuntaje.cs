using BackEnd_LIDGames.AccesoDatos;
using BackEnd_LIDGames.Entidades.Request;
using BackEnd_LIDGames.Entidades.Response;
using BackEnd_LIDGames.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd_LIDGames.Logica
{
    public class LogPuntaje
    {
        public ResIngresarPuntaje ingresarPuntaje(ReqIngresarPuntaje req)
        {
            ResIngresarPuntaje res = new ResIngresarPuntaje();

            try
            {
                if (req.elPuntaje.idUsuario == 0)
                {
                    res.resultado = false;
                    res.errorMensaje = "Id usuario faltante";
                }

                else if (req.elPuntaje.puntos == 0)
                {
                    res.resultado = false;
                    res.errorMensaje = "Puntos faltante";
                }

                else if (req.elPuntaje.idJuego == 0)
                {
                    res.resultado = false;
                    res.errorMensaje = "Id del juego faltante";
                }

                else
                {
                    // LLEGARON TODOS LOS DATOS
                    // ENVIAR A BASE DE DATOS

                    int? ErrorId = 0;
                    int? IdReturn = 0;
                    string ErrorDescripcion = "";

                    conexionLinqDataContext miLinq = new conexionLinqDataContext();
                    miLinq.SP_INGRESAR_PUNTAJES(req.elPuntaje.idUsuario, (int?)req.elPuntaje.puntos, req.elPuntaje.idJuego, ref IdReturn, ref ErrorId, ref ErrorDescripcion);

                    if (ErrorId == 0)
                    {
                        //Exitoso
                        res.resultado = true;
                    }

                    else
                    {
                        //Error en la BD
                        res.resultado = false;
                        res.errorMensaje = ErrorDescripcion;
                    }

                }

            }
            catch (Exception ex)
            {
                res.resultado = false;
                res.errorMensaje = ex.Message;
                //Console.WriteLine(ex.Message);
            }
            return res;
        }

        public ResObtenerPuntaje obtenerPuntaje(ReqObtenerPuntaje req)
        {
            ResObtenerPuntaje res = new ResObtenerPuntaje();
            try
            {
                // TODOS LOS DATOS ESTAN CORRECTOS
                // LLAMAR A LA BASE DE DATOS
                conexionLinqDataContext miLinq = new conexionLinqDataContext();
                List<SP_OBTENER_PUNTAJESResult> MiListaDeLinq = new List<SP_OBTENER_PUNTAJESResult>();

                //SE EJECUTA EL SP
                MiListaDeLinq = miLinq.SP_OBTENER_PUNTAJES().ToList();

                res.ListaDePuntajes = this.ArmarListaDePublicaciones(MiListaDeLinq);

                res.resultado = true;

            }
            catch (Exception ex)
            {
                res.resultado = false;
                res.errorMensaje = "Error interno";
                Console.WriteLine(ex.Message);
            }
            return res;
        }

        private List<Puntaje> ArmarListaDePublicaciones(List<SP_OBTENER_PUNTAJESResult> listaDePuntajes)
        {
            List<Puntaje> ListaDevolver = new List<Puntaje>();

            foreach (SP_OBTENER_PUNTAJESResult CadaLinq in listaDePuntajes)
            {
                Puntaje miPuntaje = new Puntaje();
                miPuntaje.nombreUsuario = CadaLinq.nombreUsuario;
                miPuntaje.idUsuario = CadaLinq.idUsuario;
                miPuntaje.idJuego = CadaLinq.idJuego;
                miPuntaje.puntos = (int)CadaLinq.puntos;
                ListaDevolver.Add(miPuntaje);
            }

            return ListaDevolver;

        }

    }
}
