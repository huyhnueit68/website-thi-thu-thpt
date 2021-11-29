<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>
		<?= Config::TITLE ?>
	</title>
	<link rel="stylesheet" href="res/css/style.min.css">
	<link rel="stylesheet" href="res/css/font-awesome.css">
	<link rel="stylesheet" href="res/css/materialize.min.css">
</head>

<body class="bg-login">
	<div id="status" class="status"></div>
	<div class="fade">
		<div class="login-page__lang">
			<div class="lang__box">
				<div class="icon-box">
					<div class="icon-vn"></div>
				</div>
				<div class="title-lang" onclick="choose_lang()">Tiếng Việt</div>
			</div>
		</div>
		<div class="login fadeInLogin">
			<div class="box-title-login">
				<img src="res/img/logo trường.png" class="logo-hnue-custom" alt="">
				<div class="title-login">
					<button id="reload" class="material-icons" onclick="reload()" title="Quay lại">arrow_back</button>
					ĐĂNG KÝ TÀI KHOẢN
				</div>
			</div>
			<div class="login-form">
				<div class="row" style="position: relative;">
					<img src="/res/img/loading.gif" alt="" id="loading" class="img-loading hidden">
					<form method="POST">
						<div class="input-field" id="field_username">
							<input type="email" name="username" id="username" required autofocus>
							<label for="username" id="lbl_usr">Email</label>
							<div class="left-align" style="color: #3c763d;">
							</div>
						</div>
						<div class="input-field" id="field_username">
							<input type="password" name="password" id="password" required>
							<label for="password" id="lbl_usr">Mật khẩu</label>
							<div class="left-align" style="color: #3c763d;">
							</div>
						</div>
						<div class="input-field" id="field_username">
							<input type="password" name="password2" id="password2" required>
							<label for="password2" id="lbl_usr">Nhập lại mật khẩu</label>
							<div class="left-align" style="color: #3c763d;">
							</div>
						</div>
						<div class="input-field" id="field_username">
							<input type="text" name="username" id="username" required>
							<label for="username" id="lbl_usr">Họ tên</label>
							<div class="left-align" style="color: #3c763d;">
							</div>
						</div>
						<div class="input-field" id="field_username">
							<input type="text" name="username" id="username" required>
							<label for="username" id="lbl_usr">Số điện thoại</label>
							<div class="left-align" style="color: #3c763d;">
							</div>
						</div>
						<div class="input-field" id="field_username">
							<input type="text" name="username" id="username">
							<label for="username" id="lbl_usr">Địa chỉ</label>
							<div class="left-align" style="color: #3c763d;">
							</div>
						</div>
						<div class="login-btn">
							<button type="submit" class="login-form-btn" onclick="submit_register()" id="btn-login">Đăng Ký</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="res/js/jquery.js"></script>
	<script src="res/js/login.js"></script>
	<script src="res/js/materialize.min.js"></script>
</body>

</html>