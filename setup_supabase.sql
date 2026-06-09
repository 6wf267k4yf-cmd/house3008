-- Buka Supabase Dashboard -> SQL Editor -> paste dan jalankan SQL ini

CREATE TABLE transactions (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  tipe TEXT NOT NULL,
  tanggal DATE NOT NULL,
  kategori TEXT,
  keterangan TEXT,
  nominal NUMERIC NOT NULL DEFAULT 0,
  img_data TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Biarkan anon key bisa read/write (Row Level Security)
ALTER TABLE transactions ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Public access" ON transactions
  FOR ALL USING (true) WITH CHECK (true);
