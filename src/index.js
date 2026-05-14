require('dotenv').config()
 
const express = require('express')
const pgp = require('pg-promise')()
 
const app = express()
app.use(express.json())
 
const db = pgp({
  host:     process.env.DB_HOST || 'localhost',
  port:     Number(process.env.DB_PORT) || 5432,
  database: process.env.POSTGRES_DB,
  user:     process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
})
 
app.get('/health', (_req, res) => {
  res.json({ status: 'ok', servicio: 'Mastercard', version: '1.0.0' })
})
 
app.post('/procesar', async (req, res) => {
  const { pan, codigo_seguridad } = req.body
 
  if (!pan) {
    return res.status(400).json({ error: 'pan es requerido' })
  }
  if (!codigo_seguridad) {
    return res.status(400).json({ error: 'codigo_seguridad es requerido' })
  }
 
  try {
    const resultado = await db.oneOrNone(
      'SELECT id FROM tarjetas WHERE numero_tarjeta = $1 AND cvv = $2',
      [pan, codigo_seguridad]
    )
 
    if (!resultado) {
      return res.json({ permitido: false, descripcion: 'Datos de tarjeta inválidos' })
    }
 
    return res.json({ permitido: true, descripcion: 'Validación autorizada' })
 
  } catch (err) {
    console.error('Error en /procesar:', err.message)
    res.status(500).json({ error: 'Error interno del servidor' })
  }
})
 
const PORT = process.env.PORT || 3002
 
async function iniciar() {
  try {
    await db.connect()
    console.log('✅ Conectado a PostgreSQL')
 
    app.listen(PORT, () => {
      console.log(`Servicio Mastercard corriendo en puerto ${PORT}`)
    })
  } catch (err) {
    console.error('❌ No se pudo conectar a PostgreSQL:', err.message)
    console.error('Asegúrate de que Docker esté corriendo: docker compose up -d')
    process.exit(1)
  }
}
 
iniciar()