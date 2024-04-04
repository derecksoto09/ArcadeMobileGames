using BackEnd_LIDGames.AccesoDatos;
using BackEnd_LIDGames.Entidades.Request;
using BackEnd_LIDGames.Entidades.Response;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd_LIDGames.Logica
{
    public class LogUsuario
    {
        public ResEncontrarUsuario encontrarUsuario(ReqEncontrarUsuario req)
        {
            ResEncontrarUsuario res = new ResEncontrarUsuario();

            try
            {
                if (String.IsNullOrEmpty(req.elUsuario.nombreUsuario))
                {
                    res.resultado = false;
                    res.errorMensaje = "Nombre de usuario faltante";
                }
                else
                {
                    // LLEGARON TODOS LOS DATOS
                    // ENVIAR A BASE DE DATOS

                    int? ErrorId = 0;
                    int? IdReturn = 0;
                    string ErrorDescripcion = "";

                    conexionLinqDataContext miLinq = new conexionLinqDataContext();
                    miLinq.SP_ENCONTRAR_USUARIO(req.elUsuario.nombreUsuario, ref IdReturn, ref ErrorId, ref ErrorDescripcion);


                    if (ErrorId == 0)
                    {
                        //Usuario existe
                        res.resultado = true;
                        res.idReturn = (int)IdReturn;
                        res.errorMensaje = ErrorDescripcion;
                    }

                    else if (ErrorId == 1)
                    {
                        //Usuario no existe. Se pregunta si quiere crearlo
                        res.resultado = false;
                        res.errorMensaje = ErrorDescripcion;
                    }
                    else
                    {
                        res.resultado = false;
                        res.errorMensaje = ErrorDescripcion;
                    }

                }

            }
            catch (Exception ex)
            {
                res.resultado = false;
                res.errorMensaje = "Error interno";
                Console.WriteLine(ex.Message);
            }
            return res;
        }

        public ResIngresarUsuario ingresarUsuarios(ReqIngresarUsuario req)
        {
            ResIngresarUsuario res = new ResIngresarUsuario();

            try
            {
                if (String.IsNullOrEmpty(req.elUsuario.nombreUsuario))
                {
                    res.resultado = false;
                    res.errorMensaje = "Nombre de usuario faltante";
                }
                else
                {
                    // LLEGARON TODOS LOS DATOS
                    // ENVIAR A BASE DE DATOS

                    int? ErrorId = 0;
                    int? IdReturn = 0;
                    string ErrorDescripcion = "";

                    conexionLinqDataContext miLinq = new conexionLinqDataContext();
                    miLinq.SP_INGRESAR_USUARIO(req.elUsuario.nombreUsuario, ref IdReturn, ref ErrorId, ref ErrorDescripcion);


                    if (ErrorId == 0)
                    {
                        //Exitoso
                        res.resultado = true;
                        res.idReturn = (int)IdReturn;
                        res.errorMensaje = ErrorDescripcion;
                    }
                    else if (ErrorId == 1)
                    {
                        //
                        res.resultado = false;
                        res.errorMensaje = ErrorDescripcion;
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
                res.errorMensaje = "Error interno";
                Console.WriteLine(ex.Message);
            }
            return res;
        }

    }
}
