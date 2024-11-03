SELECT 
    dps.id_peserta,
    dps.nama,
    dps.nomor,
    fp.nilai_akhir,
    dw.periode_tahun,
    dw.periode_bulan,
    dw.periode_tanggal
FROM 
    fact_pendaftaran fp
JOIN 
    dim_peserta dps ON fp.id_peserta = dps.id_peserta
JOIN 
    dim_waktu dw ON fp.id_waktu = dw.id_waktu
ORDER BY 
    fp.nilai_akhir DESC, -- Urutkan berdasarkan nilai akhir dari terbesar ke terkecil
    dw.periode_tahun, 
    dw.periode_bulan, 
    dw.periode_tanggal, 
    dps.nama;