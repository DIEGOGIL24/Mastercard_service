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
  res.json({ status: 'ok', servicio: 'Mastercard' })
})

app.post('/validar', async (req, res) => {
  const { numero_tarjeta, cvv } = req.body

  if (!numero_tarjeta) {
    return res.status(400).json({ error: 'numero_tarjeta es requerido' })
  }
  if (!cvv) {
    return res.status(400).json({ error: 'cvv es requerido' })
  }

  try {
   
    const valida = await db.oneOrNone(
      'SELECT id FROM tarjetas WHERE numero_tarjeta = $1 AND cvv = $2',
      [numero_tarjeta, cvv]
    )

    if (!valida) {
      
      return res.json({ autorizado: false, mensaje: 'Datos de tarjeta inválidos' })
    }

    return res.json({ autorizado: true, mensaje: 'Tarjeta validada correctamente' })

  } catch (err) {
    console.error('Error en /validar:', err.message)
    res.status(500).json({ error: 'Error interno del servidor' })
  }
})

const PORT = process.env.PORT || 3002

async function main() {
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

main()