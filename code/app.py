from fastapi import FastAPI
from pydantic import BaseModel
import joblib
import uvicorn

app = FastAPI()

# Tải lại mô hình từ tệp
loaded_model = joblib.load('/home/linhphuong/anaconda3/hackathon/hackathon/code/nuoc.pth')  # Thay đổi thành tên tệp chứa trạng thái mô hình của bạn

# Định nghĩa lớp Pydantic để xử lý dữ liệu đầu vào từ yêu cầu API
class InputData(BaseModel):
    data: list

# Định nghĩa endpoint để thực hiện dự đoán
@app.post("/predict/")
def predict(data: InputData):
    try:
        input_data = data.data
        # Thực hiện dự đoán bằng cách sử dụng mô hình đã tải
        prediction = loaded_model.predict(input_data)
        if prediction == 1:
            a = "An toan, co the dung"
        else:
            a = "Khong an toan de uong"
        return {"prediction": a}
    except Exception as e:
        return {"error": str(e)}

if __name__ == '__main__':
    uvicorn.run(app, host="127.0.0.1", port=8000)
