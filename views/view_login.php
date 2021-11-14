<?php

/**
 * View Login
 * Author: Phạm Quang Huy (Harry Pham)
 * Mail: pqhuy2@software.misa.com.vn
 **/

class View_Login
{
    public function show_login()
    {
        require_once 'config/config.php';
        include 'res/templates/login.php';
    }
}
