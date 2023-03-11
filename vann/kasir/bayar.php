<!DOCYTPE html>
<html>
<style>
form {
    background-color :  transparen;
    box-sizing : border-box;
	width: 100%;
	padding: 10px;
	font-size: 11pt;
	margin-bottom: 20px;
}

  input[type=text], select, textarea{
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
  
}

/* Style the label to display next to the inputs */
label {

  padding: 12px 12px 12px 0;
  display: inline-block;
  font-size : 11pt;
 
}

button {
    padding : 8px 16px;
            margin-left : 19px;
            margin-right : 10px;
            margin-bottom : 20px;
            border-radius : 4px ;
            color : white;
            background-color : #40E0D0;
            text-decoration : none;
            font-family : Arial,Helvetica, sans-serif ;
}

/* Style the submit button */
input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
  
}
select {
  width: 100%;
  min-width: 15ch;
  max-width: 30ch;
  border: 1px solid var(--select-border);
  border-radius: 0.25em;
  padding: 0.25em 0.5em;
  font-size: 1.25rem;
  cursor: pointer;
  line-height: 1.1;
  background-color: #40E0D0;
  background-image: linear-gradient(to top, #f9f9f9, #fff 33%);
}

/* Style the container */
.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

/* Floating column for labels: 25% width */
.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

/* Floating column for inputs: 75% width */
.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
.card-body {
    width : 350px;
    background : white ;
    margin : 80px auto ;
    padding : 30px 20px ;
    box-sizing : border-box ;
    border : 1px solid black ;
    border-radius : 16px ;
}
.link, 
.link:link,
.link:active,
.link:visited{
    padding : 7px 15px;
    height : 4px ;
    margin-left : 19px;
    margin-right : 5px;
    margin-bottom : 15px;
    border-radius : 4px ;
    color : white;
    background-color : #cf1b5c;
    text-decoration : none;
    font-family : Arial,Helvetica, sans-serif ;
}
 
        

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
  }
  </style>
<?php
$title = 'Pembayaran';
require 'koneksi.php';

$query = mysqli_query($conn, "SELECT transaksi.*, pelanggan.nama_pelanggan, detail_transaksi.total_harga FROM transaksi INNER JOIN pelanggan ON pelanggan.id_pelanggan = transaksi.id_pelanggan INNER JOIN detail_transaksi ON detail_transaksi.id_transaksi = transaksi.id_transaksi WHERE transaksi.id_transaksi = " . $_GET['id']);
$data = mysqli_fetch_assoc($query);

if (isset($_POST['btn-simpan'])) {
    $total_bayar = $_POST['total_bayar'];
    if ($total_bayar >= $data['total_harga']) {
        $query = "UPDATE transaksi SET status_bayar = 'dibayar', tgl_pembayaran = '" . date('Y-m-d h:i:s') . "' WHERE id_transaksi = " . $_GET['id'];
        $query2 = "UPDATE detail_transaksi SET total_bayar = '$total_bayar' WHERE id_transaksi = " . $_GET['id'];

        $insert = mysqli_query($conn, $query);
        $insert2 = mysqli_query($conn, $query2);
        if ($insert == 1 && $insert2 == 1) {
            echo "<script>alert('OK');</script>";
            header('location: transaksi_dibayar.php?id=' . $_GET['id']);
        } else {
            echo "<div class='alert alert-danger'>Gagal Tambah Data!!!</div>";
        }
    } else {
        $msg = "Jumlah Uang Pembayaran Kurang";
        header('location:bayar.php?id=' . $_GET['id'] . '&msg=' . $msg);
    }
}
require 'navigasi.php' ;
?>

            <?php if (isset($_SESSION['msg']) && $_SESSION['msg'] <> '') { ?>
                <div class="alert alert-success" role="alert">
                    <?= $_SESSION['msg']; ?>
                </div>
            <?php }
            $_SESSION['msg'] = ''; ?>
        </div>
        <div class="row">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title"><?= $title; ?></div>
                    </div>
                    <form action="bayar.php?id=<?= $data['id_transaksi']; ?>" id="form-submit" method="POST">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="largeInput">Kode Invoice</label>
                                <input type="text" name="kode_invoice" class="form-control form-control" id="defaultInput" value="<?= $data['kode_invoice']; ?>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="largeInput">Nama Pelanggan</label>
                                <input type="text" name="nama_pelanggan" class="form-control form-control" id="defaultInput" value="<?= $data['nama_pelanggan']; ?>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="largeInput">Total Yang Harus Dibayarkan</label>
                                <input type="text" name="total_harga" class="form-control form-control" id="defaultInput" value="<?= 'Rp ' . number_format($data['total_harga']); ?>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="largeInput">Masukan Jumlah Pembayaran</label>
                                <input type="number" name="total_bayar" id="total_bayar" class="form-control form-control" id="defaultInput" value="">
                                <?php if (isset($_GET['msg'])) : ?>
                                    <small class="text-danger"><?= $_GET['msg'] ?></small>
                                <?php endif ?>
                            </div>
                            <div class="card-action">
                                <button type="submit" name="btn-simpan" class="btn btn-success">Submit</button>
                                <!-- <button class="btn btn-danger">Cancel</button> -->
                                <br><a href="javascript:void(0)" onclick="window.history.back();" class="link">Batal</a>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>