SELECT 
    dp.nama_prodi,
    ds.nama_kab_kota AS asal_kab_kota,
    ds.nama_provinsi AS asal_provinsi,
    dw.periode_tahun, 
    dw.periode_bulan, 
    dw.periode_tanggal, 
    COUNT(fp.id_peserta) AS jumlah_pendaftar
FROM 
    fact_pendaftaran fp
JOIN 
    dim_prodi dp ON fp.id_prodi = dp.id_prodi
JOIN 
    dim_peserta dps ON fp.id_peserta = dps.id_peserta
JOIN 
    dim_sekolah ds ON dps.id_sekolah = ds.id_sekolah
JOIN 
    dim_waktu dw ON fp.id_waktu = dw.id_waktu
GROUP BY 
    dp.nama_prodi, ds.nama_kab_kota, ds.nama_provinsi, dw.periode_tahun, dw.periode_bulan, dw.periode_tanggal
ORDER BY 
    jumlah_pendaftar DESC, -- Urutkan berdasarkan jumlah pendaftar dari terbanyak ke sedikit
    dp.nama_prodi, 
    dw.periode_tahun, 
    dw.periode_bulan, 
    dw.periode_tanggal;