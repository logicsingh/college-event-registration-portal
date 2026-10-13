<?php
declare(strict_types=1);
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
require_once __DIR__ . '/../config.php';
function db(): PDO {
 static $pdo = null;
 if ($pdo instanceof PDO) return $pdo;
 $dsn = 'mysql:host='.DB_HOST.';port='.DB_PORT.';dbname='.DB_NAME.';charset=utf8mb4';
 try {
  $pdo = new PDO($dsn, DB_USER, DB_PASS, [
   PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,
   PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,
   PDO::ATTR_EMULATE_PREPARES=>false
  ]);
 } catch (PDOException $e) {
  http_response_code(500); exit('Database connection failed. Check config.php and import database/schema.sql.');
 }
 return $pdo;
}
function e(?string $v): string { return htmlspecialchars($v ?? '', ENT_QUOTES|ENT_SUBSTITUTE, 'UTF-8'); }
function token(): string { if (empty($_SESSION['csrf'])) $_SESSION['csrf']=bin2hex(random_bytes(32)); return $_SESSION['csrf']; }
function verify_token(): void { if (!isset($_POST['csrf_token']) || !hash_equals(token(), (string)$_POST['csrf_token'])) { http_response_code(403); exit('Invalid form token. Refresh and try again.'); } }
function user(): ?array { return $_SESSION['user'] ?? null; }
function login_required(): void { if (!user()) { $_SESSION['flash']='Please sign in first.'; header('Location: login.php'); exit; } }
function admin_required(): void { login_required(); if ((user()['role'] ?? '') !== 'admin') { http_response_code(403); exit('Admin access required.'); } }
function flash(string $s): void { $_SESSION['flash']=$s; }
function go(string $to): never { header('Location: '.$to); exit; }
