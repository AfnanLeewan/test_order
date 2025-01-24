*** Settings ***
Resource    resources.robot

*** Test Cases ***
ลูกค้าสั่งซื้ออสินค้าเลือกจัดส่งตามที่อยู่และชำระเงินด้วยบัตรเครดิต
    เปิดบราวเซอร์และเข้าไปที่เว็บไซต์    ${URL}    ${BROWSER}
    ลงทะเบียนเข้าใช้งาน    ${EMAIL}    ${PASSWORD}
    ค้นหาสินค้า    ${PRODUCT}
    เลือกสินค้าและตรวจสอบ
    เพิ่มจำนวนสินค้า
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[4]/div[2]/button
    Wait Until Element Is Visible    //*[@id="page"]/div/div[3]/div/div
    Element Should Contain    //*[@id="page"]/div/div[3]/div/div    รายละเอียดการจัดส่งสินค้า
    กรอกที่อยู่จัดส่ง    พันกรร    ชมจันทร์    0619917765    45/9    7    สมุทรปราการ    บางพลี    บางปลา
    ตรวจสอบราคา    185    35    220
    กรอกข้อมูลบัตรเครดิต    พันกรร ชมจันทร์    46246977491778712    01/29    476