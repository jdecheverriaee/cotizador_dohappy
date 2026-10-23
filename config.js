// Configuración del cotizador.
// Déjalo vacío para guardar las cotizaciones solo en este navegador (modo local).
// Para usar Supabase, pega aquí la URL del proyecto y la "anon public key"
// (Supabase → Project Settings → API). La anon key es pública por diseño:
// los datos quedan protegidos por el login y las políticas RLS de schema.sql.
window.COTIZADOR_CONFIG = {
  supabaseUrl: "https://fasyjacvqgezaxepjgmn.supabase.co",
  supabaseAnonKey: "sb_publishable_pYELXIqnoN7rNVUJd5nK7Q_-MQBZ1mB",

  // Número desde el que parte la numeración (COT-0233).
  // Si ya hay cotizaciones con un número mayor, sigue desde la última.
  numeroInicial: 233
};
