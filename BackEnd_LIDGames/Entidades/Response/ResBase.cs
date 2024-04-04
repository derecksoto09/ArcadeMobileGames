using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd_LIDGames.Entidades.Response
{
    public class ResBase
    {
        public bool resultado { get; set; }

        public int idReturn { get; set; }

        public string errorMensaje { get; set; }

    }
}
