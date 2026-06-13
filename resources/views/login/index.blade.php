<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login — Aplikasi Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }
        .card-header {
            background-color: #ffffff;
            border-bottom: 1px solid #f0f0f0;
            border-radius: 12px 12px 0 0 !important;
            padding: 24px 32px 0;
        }
        .card-body {
            padding: 24px 32px 32px;
        }
        .btn-primary {
            background-color: #3b5bdb;
            border-color: #3b5bdb;
        }
        .btn-primary:hover {
            background-color: #2f4ac0;
            border-color: #2f4ac0;
        }
        .form-control:focus {
            border-color: #3b5bdb;
            box-shadow: 0 0 0 0.2rem rgba(59, 91, 219, 0.15);
        }
        .link-publik {
            font-size: 12px;
            color: #868e96;
            text-decoration: none;
            transition: color .15s;
        }
        .link-publik:hover {
            color: #3b5bdb;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center align-items-center min-vh-100">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-1 fw-semibold">Aplikasi Blog</h5>
                        <p class="text-muted small mb-3">
                            Masukkan kredensial untuk melanjutkan
                        </p>
                    </div>
                    <div class="card-body">
                        @if($errors->has('gagal'))
                            <div class="alert alert-danger alert-dismissible fade show py-2 small" role="alert">
                                {{ $errors->first('gagal') }}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        @endif

                        <form action="{{ route('login.proses') }}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label for="user_name" class="form-label small fw-medium">
                                    Username
                                </label>
                                <input type="text" class="form-control" id="user_name" name="user_name" value="{{ old('user_name') }}" placeholder="Masukkan username" autofocus>
                            </div>
                            <div class="mb-4">
                                <label for="password" class="form-label small fw-medium">
                                    Password
                                </label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Masukkan password">
                            </div>
                            <div class="d-grid mb-3">
                                <button type="submit" class="btn btn-primary">
                                    Masuk
                                </button>
                            </div>
                            <div class="text-center">
                                <a href="{{ route('guest.beranda') }}" class="link-publik">
                                    ← Kembali ke Halaman Publik
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
