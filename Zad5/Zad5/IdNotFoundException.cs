using System;
using System.Runtime.Serialization;

namespace Zad5
{
    public class IdNotFoundException : Exception
    {
        public IdNotFoundException()
        {
        }

        public IdNotFoundException(string message) : base(message)
        {
        }

        public IdNotFoundException(string message, Exception innerException) : base(message, innerException)
        {
        }

        protected IdNotFoundException(SerializationInfo info, StreamingContext context) : base(info, context)
        {
        }
    }
}