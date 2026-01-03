<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<div class="container my-5">
    <h2 class="mb-4 text-warning">${empty product ? 'Tambah' : 'Edit'} Produk</h2>

    <form method="POST" action="ProductServlet" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${product.id}">
        
        <div class="card p-4 shadow-sm">
            <div class="mb-3">
                <label class="form-label">Nama Produk</label>
                <input type="text" class="form-control" name="nama" value="${product.nama}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Deskripsi</label>
                <textarea class="form-control" name="deskripsi">${product.deskripsi}</textarea>
            </div>

            <div class="row">
                <div class="col-md-4 mb-3">
                    <label class="form-label">Harga (Rp)</label>
                    <input type="number" class="form-control" name="harga" value="${product.harga}" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label class="form-label">Stok</label>
                    <input type="number" class="form-control" name="stok" value="${product.stok}" required>
                </div>
                <div class="col-md-4 mb-3">
                    <label class="form-label">Diskon (%)</label>
                    <input type="number" class="form-control" name="diskon_persen" value="${product.diskon}">
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label">Kategori</label>
                <select class="form-select" name="kategori">
                    <option value="makanan" ${product.kategori == 'makanan' ? 'selected' : ''}>Makanan</option>
                    <option value="minuman" ${product.kategori == 'minuman' ? 'selected' : ''}>Minuman</option>
                    <option value="addon" ${product.kategori == 'addon' ? 'selected' : ''}>Add-ons</option>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Gambar Produk</label>
                <input class="form-control" type="file" name="gambar">
                <c:if test="${not empty product.gambar}">
                    <small>Gambar saat ini: ${product.gambar}</small>
                </c:if>
            </div>

            <div class="mt-3">
                <button type="submit" class="btn btn-warning text-white">Simpan Produk</button>
                <a href="ProductServlet?action=list" class="btn btn-outline-secondary">Batal</a>
            </div>
        </div>
    </form>
</div>