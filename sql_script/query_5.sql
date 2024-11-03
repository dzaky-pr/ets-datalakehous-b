SELECT 
    dps.id_peserta, 
    dps.nama, 
    dp.nama_prodi,
    dw.periode_tahun, 
    dw.periode_bulan, 
    dw.periode_tanggal,
    dsp.label_status_seleksi
FROM 
    fact_pendaftaran fp
JOIN 
    dim_peserta dps ON fp.id_peserta = dps.id_peserta
JOIN 
    dim_prodi dp ON fp.id_prodi = dp.id_prodi
JOIN 
    dim_status_pilihan_ke dsp ON fp.id_status_pilihan_ke = dsp.id_status_pilihan_ke
JOIN 
    dim_waktu dw ON fp.id_waktu = dw.id_waktu
WHERE 
    dsp.id_status_seleksi = 1
ORDER BY 
    dp.nama_prodi, dw.periode_tahun, dw.periode_bulan, dw.periode_tanggal;