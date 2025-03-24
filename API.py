import requests
from fastapi import FastAPI
from fastapi.responses import FileResponse

app = FastAPI()

@app.get("/api/health/")
def get_health():
    return "Healthy"

@app.get("/api/timetable")
def get_timetable(hash:str,user:str):
    url = f"https://zeus.uni-konstanz.de:443/hioserver/pages/cm/exa/timetable/individualTimetableCalendarExport.faces?user={user}&hash={hash}&termgroup="
    open("r.ical","wb").write(requests.get(url).content)
    return FileResponse("r.ical")

