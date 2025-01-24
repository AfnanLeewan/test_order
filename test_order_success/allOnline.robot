*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
ลูกค้าสั่งซื้ออสินค้าเลือกจัดส่งตามที่อยู่และชำระเงินด้วยบัตรเครดิต
    เปิดบราวเซอร์และเข้าไปที่ all Online
    ลงทะเบียนเข้าใช้งาน
    ค้นหายำยำช้างน้อย รสบาร์บีคิว 120 กรัมและพบข้อมูลที่ค้นหา
    กดเลือกสินค้าและตรวจสอบยอดจำนวนของสินค้าเท่ากับ1
    กดเพิ่มจำนวนสินค้าเป็น 5 ชิ้น
    กดซื้อเลยและตรวจสอบว่าแสดงหน้าจัดส่งสินค้า
    กดจัดส่งตามที่อยู่และกรอกรายละเอียดการจัดส่ง
    กรอกรายละเอียดการชำระเงิน


*** Keywords ***
เปิดบราวเซอร์และเข้าไปที่ all Online
    Open Browser    url=https://www.allonline.7eleven.co.th/   browser=chrome
    Wait Until Page Contains    seven
ลงทะเบียนเข้าใช้งาน
    Click Element    //*[@id="page"]/header/div[4]/div/div/div/ul/li[4]/a
    Wait Until Element Is Visible    //*[@id="__next"]/div/div/div[2]/div[2]/div/div
    Input Text    name=email    naaanlw22@gmail.com
    Input Text    name=password    C5kykR!!5q53bWx
    Click Element    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
    Wait Until Element Is Visible    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div[3]/div/button[2]
    Click Element    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div[3]/div/button[2]
    Wait Until Element Is Visible    name=q
ค้นหายำยำช้างน้อย รสบาร์บีคิว 120 กรัมและพบข้อมูลที่ค้นหา
    Input Text    name=q    ยำยำช้างน้อย รสบาร์บีคิว 120 กรัม
    Click Element    xpath=//*[@id="search_id_form"]/div/span/button
    Wait Until Element Is Visible    xpath=//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]   
กดเลือกสินค้าและตรวจสอบยอดจำนวนของสินค้าเท่ากับ1
    Click Element    xpath=//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]
    Wait Until Element Is Visible    //*[@id="article-form"]/div[2]
    Element Attribute Value Should Be    name=order_count    value    1
กดเพิ่มจำนวนสินค้าเป็น 5 ชิ้น
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Element Attribute Value Should Be    name=order_count    value    5
กดซื้อเลยและตรวจสอบว่าแสดงหน้าจัดส่งสินค้า
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[4]/div[2]/button
    Wait Until Element Is Visible    //*[@id="page"]/div/div[3]/div/div
    Element Should Contain    //*[@id="page"]/div/div[3]/div/div    รายละเอียดการจัดส่งสินค้า
กดจัดส่งตามที่อยู่และกรอกรายละเอียดการจัดส่ง
    Click Element    //*[@id="address-tabs"]/ul/li[2]/a
    Click Element    //*[@id="addressbook"]/div/div[2]/div[2]
    Input Text    name=shippingData.homeShippingData.newShippingAddress.firstname    พันกรร
    Input Text    name=shippingData.homeShippingData.newShippingAddress.lastname    ชมจันทร์
    Input Text    name=shippingData.homeShippingData.newShippingAddress.mobilePhone    0619917765
    Input Text    name=shippingData.homeShippingData.newShippingAddress.addrNo    45/9
    Input Text    name=shippingData.homeShippingData.newShippingAddress.moo    7
    Select From List By Label    id=new-address-province    สมุทรปราการ
    Select From List By Label    id=new-address-district    บางพลี  
    Select From List By Label    id=new-address-sub-district    บางปลา  
    # Wait Until Element Contains    id=selected-location    เลือกที่อยู่
    # Click Element    id=selected-location
    # Click Element    id=selected-location    
    # Wait Until Element Is Not Visible    id=selected-location
    # Wait Until Element Is Visible    id=conf-dif-addr
    #Click Element    id=conf-dif-addr
    Click Element    id=continue-payment-btn
กรอกรายละเอียดการชำระเงิน
    Wait Until Element Is Visible    //*[@id="payment-options"]/div[1]
    Click Element    //*[@id="payment-options"]/div[1]
    Wait Until Element Is Visible    //*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button
    Click Element    //*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button

    Wait Until Element Is Visible    id=cardName
    Input Text    id=cardName    พันกรร ชมจันทร์
    Input Text    id=cardNumber   46246977491778712
    Input Text    id=expiryDate   01/29
    Input Text    id=cvCode    476
    # Wait Until Page Contains    sevenddddd
    