<?php
//ENTER THE RELEVANT INFO BELOW
include_once('connect.php');

$backup_name        = "quanlyhocsinh_6php.sql";
// $tables             = array("dayhoc", "diem", "giaovien", "hocky", "hocsinh", "lophoc", "monhoc","user");


$result = mysqli_query($conn, "SHOW TABLES"); //Lấy tên của tất cả các bảng
while ($row = mysqli_fetch_row($result)) {
    $tables[] = $row[0];   //Lấy tên từng bảng cho vào mảng tables     
}

// echo '<pre>';
//     print_r($tables);
// echo '</pre>';

$return = '';

foreach ($tables as $table) { // dùng foreach lặp bảng
    $result = mysqli_query($conn, "SELECT * FROM " . $table); // Lấy dữ liệu của từng bảng
    //trả về số cột
    $num_fields = mysqli_num_fields($result); //trả về số cột của bảng là số nguyên

    // $return .= 'DROP TABLE '.$table.';';
    //trả về hàng hiện tại theo mảng liên tục
    $row2 = mysqli_fetch_row(mysqli_query($conn, 'SHOW CREATE TABLE ' . $table)); //trả về câu select tạo bảng đó
    $return .= "\n\n" . $row2[1] . ";\n\n";

    for ($i = 0; $i < $num_fields; $i++) {
        while ($row = mysqli_fetch_row($result)) {
            $return .= 'INSERT INTO ' . $table . ' VALUES(';
            for ($j = 0; $j < $num_fields; $j++) {
                //chèn vào chuỗi khi trong chuỗi có nháy '  và "
                $row[$j] = addslashes($row[$j]);
                if (isset($row[$j])) {
                    $return .= '"' . $row[$j] . '"';
                } else {
                    $return .= '""';
                }
                if ($j < $num_fields - 1) {
                    $return .= ',';
                }
            }
            $return .= ");\n";
        }
    }
    $return .= "\n\n\n";
}


$handle = fopen('database/quanlyhocsinh_6php_backup.sql', 'w+');
fwrite($handle, $return);
fclose($handle);
echo "success";