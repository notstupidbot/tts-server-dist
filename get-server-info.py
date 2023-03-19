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

def get_server_info_supabase():
	response = supabase.table('app').select("*").eq("id", 1).execute()
	print(response.data)



if __name__ == "__main__":
    get_server_info_supabase()