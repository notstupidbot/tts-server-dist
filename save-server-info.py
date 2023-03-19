#!/container/dist/bin/python3

import os
from supabase import create_client, Client
import json
# from flask import jsonify
from requests import get
import socket
import datetime
import re

url: str = "https://tpoausqyzvpuuxuuwmni.supabase.co"
key: str = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRwb2F1c3F5enZwdXV4dXV3bW5pIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3NzIxNTY5OSwiZXhwIjoxOTkyNzkxNjk5fQ.SNCC8HoCYTmASCSuEtrmaM5AbJeSpM-LzBPh1aPNFLc"
supabase: Client = create_client(url, key)

# data = supabase.table("app").insert({"app_id":"test"}).execute()
# assert len(data.data) > 0

# data = supabase.table("app").update({"host": "host", "start_at": "", "bore_port":"40040"}).eq("id", 1).execute()


# response = supabase.table('app').select("*").execute()
# print(json.dumps(response.data, indent=4))

def save_server_info_supabase():
	current_time = datetime.datetime.now()
	start_at = current_time.strftime("%Y-%m-%d %H:%M:%S")
	hostname = socket.gethostname()
	bore_port = get_bore_port()
	ip_addr = get_public_ip()
	supabase.table("app").update({"host": hostname, "start_at": start_at, "bore_port":bore_port, "ip_addr" : ip_addr}).eq("id", 1).execute()


def get_public_ip():
	ip_addr = get('https://api.ipify.org').content.decode('utf8')
	return ip_addr

def get_bore_port():
	tmp_file = "/tmp/bore.log"
	f = open(tmp_file, "r")
	lines = f.readline().split(' ')
	line_len = len(lines)-1
	if line_len > 0:
		line = lines[line_len]
		lines = line.split('=')
		line_len = len(lines)-1
		port=lines[line_len]
		port=re.sub("[^0-9]", "", port)
		return int(port)


if __name__ == "__main__":
    save_server_info_supabase()