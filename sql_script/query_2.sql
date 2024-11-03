SELECT 
    dp.nama_prodi,
    dw.periode_tahun, 
    dw.periode_bulan, 
    dw.periode_tanggal, 
    COUNT(fp.id_peserta) AS jumlah_pendaftar
FROM 
    fact_pendaftaran fp
JOIN 
    dim_prodi dp ON fp.id_prodi = dp.id_prodi
JOIN 
    dim_waktu dw ON fp.id_waktu = dw.id_waktu
GROUP BY 
    dp.nama_prodi, dw.periode_tahun, dw.periode_bulan, dw.periode_tanggal
ORDER BY 
    jumlah_pendaftar DESC, -- Urutkan berdasarkan jumlah pendaftar dari terbanyak ke sedikit
    dw.periode_tahun, 
    dw.periode_bulan, 
    dw.periode_tanggal, 
    dp.nama_prodi;