from http.server import ThreadingHTTPServer, SimpleHTTPRequestHandler
from pathlib import Path
import json
import sys

ROOT = Path(__file__).resolve().parent
DATA_DIR = ROOT / 'data'
DATA_FILE = DATA_DIR / 'students.json'

class Handler(SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/api/state':
            if not DATA_FILE.exists():
                DATA_DIR.mkdir(exist_ok=True)
                DATA_FILE.write_text('{}', encoding='utf-8')
            raw = DATA_FILE.read_text(encoding='utf-8')
            self.send_response(200); self.send_header('Content-Type','application/json; charset=utf-8'); self.end_headers(); self.wfile.write(raw.encode('utf-8')); return
        return super().do_GET()

    def do_PUT(self):
        if self.path != '/api/state': self.send_error(404); return
        length = int(self.headers.get('Content-Length','0'))
        body = self.rfile.read(length)
        data = json.loads(body.decode('utf-8'))
        DATA_DIR.mkdir(exist_ok=True)
        DATA_FILE.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding='utf-8')
        self.send_response(204); self.end_headers()

DATA_DIR.mkdir(exist_ok=True)
if not DATA_FILE.exists(): DATA_FILE.write_text('{}', encoding='utf-8')
port = int(sys.argv[1]) if len(sys.argv) > 1 else 8000
print(f'体育档案服务器已启动：http://localhost:{port}，数据统一保存于 data/students.json')
ThreadingHTTPServer(('127.0.0.1', port), Handler).serve_forever()
