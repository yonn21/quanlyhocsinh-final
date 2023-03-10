<?php
if (!defined('TEMPLATE')) {
	die('Bạn không có quyền truy cập trang này');
}

$gv_mail = $_SESSION['mail_gv'];
?>
<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><svg class="glyph stroked home">
                        <use xlink:href="#stroked-home"></use>
                    </svg></a></li>
            <li class="active">Quản lý điểm</li>
        </ol>
    </div>
    <!--/.row-->

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Vui Lòng Chọn Lớp Cần Nhập Điểm</h1>
        </div>

    </div>
    <!--/.row-->

    <div class="row">
        <div class="col-md-12">
            <form method="post" action="../teacher/excel_gv.php" style="margin: 10px;">
                <input type="hidden" name="mail" value="<?php echo $gv_mail ?>">
                <button type="submit" name="btnExport" class="btn btn-info">Xuất Danh Sách Lớp Ra Excel</button>
            </form>

            <br>
            <div class="panel panel-default">
                <div class="panel-body">
                    <table data-toolbar="#toolbar" data-toggle="table">

                        <thead>
                            <tr>
                                <th data-field="id" data-sortable="true">ID</th>
                                <th>Tên Lớp Học</th>
                                <th>Nhập Điểm</th>
                                <th>Xem Điểm Đã Nhập</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
							$sql_gv = "SELECT * FROM giaovien JOIN dayhoc ON giaovien.MaGV = dayhoc.MaGV JOIN lophoc ON lophoc.MaLopHoc = dayhoc.MaLopHoc WHERE giaovien.gv_mail = '$gv_mail'";
							$query_gv = mysqli_query($conn, $sql_gv);
							while ($row_gv = mysqli_fetch_assoc($query_gv)) {
							?>
                            <tr>
                                <td style=""><?php echo $row_gv['MaLopHoc']; ?></td>
                                <td style=""><?php echo $row_gv['Tenlophoc']; ?></td>
                                <td class="form-group">
                                    <a href="index.php?page_gv=add_points&MaHocKy=<?php echo $row_gv['MaHocKy'] ?>&MaMonHoc=<?php echo $row_gv['MaMonHoc'] ?>&MaLopHoc=<?php echo $row_gv['MaLopHoc'] ?>"
                                        class="btn btn-primary"><i class="glyphicon glyphicon-file "></i></a>
                                </td>
                                <td class="form-group">
                                    <a href="index.php?page_gv=list_points&MaHocKy=<?php echo $row_gv['MaHocKy'] ?>&MaMonHoc=<?php echo $row_gv['MaMonHoc'] ?>&MaLopHoc=<?php echo $row_gv['MaLopHoc'] ?>"
                                        class="btn btn-warning"><i class="glyphicon glyphicon-eye-open"></i></a>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
                <!-- <div class="panel-footer">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                        </ul>
                    </nav>
                </div> -->
            </div>
        </div>
    </div>
    <!--/.row-->
</div>
<!--/.main-->