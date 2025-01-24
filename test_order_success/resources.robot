*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.allonline.7eleven.co.th/
${BROWSER}    chrome
${EMAIL}    naaanlw22@gmail.com
${PASSWORD}    C5kykR!!5q53bWx
${PRODUCT}    ยำยำช้างน้อย รสบาร์บีคิว 120 กรัม

*** Keywords ***
เปิดบราวเซอร์และเข้าไปที่เว็บไซต์
    [Arguments]    ${url}    ${browser}
    Open Browser    url=${url}    browser=${browser}
    Wait Until Page Contains    seven

ลงทะเบียนเข้าใช้งาน
    [Arguments]    ${email}    ${password}
    Click Element    //*[@id="page"]/header/div[4]/div/div/div/ul/li[4]/a
    Wait Until Element Is Visible    //*[@id="__next"]/div/div/div[2]/div[2]/div/div
    Input Text    name=email    ${email}
    Input Text    name=password    ${password}
    Click Element    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div/div[6]/a[1]
    Wait Until Element Is Visible    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div[3]/div/button[2]
    Click Element    //*[@id="__next"]/div/div/div[2]/div[2]/div/div/div[3]/div/button[2]
    Wait Until Element Is Visible    name=q

ค้นหาสินค้า
    [Arguments]    ${product_name}
    Input Text    name=q    ${product_name}
    Click Element    xpath=//*[@id="search_id_form"]/div/span/button
    Wait Until Element Is Visible    xpath=//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]

เลือกสินค้าและตรวจสอบ
    Click Element    xpath=//*[@id="page"]/div[2]/div[2]/div/div/div[2]/div/div/div/div/div/div[3]/div[1]
    Wait Until Element Is Visible    //*[@id="article-form"]/div[2]
    Element Attribute Value Should Be    name=order_count    value    1
    Element Should Contain    //*[@id="article-form"]/div[1]/div[3]/div/div[2]/div/span/span    คุณจะได้รับ 9 คะแนน

เพิ่มจำนวนสินค้า

    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Click Element    //*[@id="article-form"]/div[2]/div[2]/div[1]/span[2]/a
    Element Attribute Value Should Be    name=order_count    value    5

กรอกที่อยู่จัดส่ง
    [Arguments]    ${firstname}    ${lastname}    ${phone}    ${address_no}    ${moo}    ${province}    ${district}    ${subdistrict}
    Click Element    //*[@id="address-tabs"]/ul/li[2]/a
    Click Element    //*[@id="addressbook"]/div/div[2]/div[2]
    Input Text    name=shippingData.homeShippingData.newShippingAddress.firstname    ${firstname}
    Input Text    name=shippingData.homeShippingData.newShippingAddress.lastname    ${lastname}
    Input Text    name=shippingData.homeShippingData.newShippingAddress.mobilePhone    ${phone}
    Input Text    name=shippingData.homeShippingData.newShippingAddress.addrNo    ${address_no}
    Input Text    name=shippingData.homeShippingData.newShippingAddress.moo    ${moo}
    Select From List By Label    id=new-address-province    ${province}
    Select From List By Label    id=new-address-district    ${district}
    Select From List By Label    id=new-address-sub-district    ${subdistrict}
    Wait Until Element Contains    id=selected-location    เลือกที่อยู่
    Sleep    5
    Click Element    id=selected-location
    Wait Until Element Is Not Visible    id=selected-location
    Wait Until Element Is Visible    id=conf-dif-addr
    Click Element    id=conf-dif-addr
    Click Element    id=continue-payment-btn

กรอกข้อมูลบัตรเครดิต
    [Arguments]    ${card_name}    ${card_number}    ${expiry_date}    ${cvv}
    Click Element    //*[@id="payment-options"]/div[1]
    Wait Until Element Is Visible    //*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button
    Sleep    5
    Click Element    //*[@id="stepModel"]/div[1]/div[2]/footer/div/div/button/i
    Sleep    5
    Wait Until Element Is Visible    id=cardName
    Input Text    id=cardName    ${card_name}
    Input Text    id=cardNumber    ${card_number}
    Input Text    id=expiryDate    ${expiry_date}
    Input Text    id=cvCode    ${cvv}

ตรวจสอบราคา
    [Arguments]    ${product_price}    ${shipping_fee}    ${total_price}
    Wait Until Element Is Visible    //*[@id="payment-options"]/div[1]
    Element Should Contain    //*[@id="js-invoice-details-tbody"]/tr[1]/td[2]/b    ฿ ${product_price}
    Element Should Contain    //*[@id="js-invoice-details-tbody"]/tr[2]/td[2]/b    ฿ ${shipping_fee}
    Element Should Contain    id=totalAmount    ฿ ${total_price}