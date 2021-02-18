<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>원데이 클래스 등록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${contextPath}/css/onedayClass.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/0bccbc6608.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="col-12 container mt-3">
        <h2>원데이 클래스 등록</h2>
        <p>사업자님! 개설할 원데이 클래스를 등록해주세요.</p>
        <div class="insert_position">
            <form action="" method="post">
                <!-- [주제] type section : 시작  -->
                <!-- <label for="type">주제</label> -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-list"></i>
                    </span>
                    </div>
                    <select class="custom-select" name="type">
                        <option class="form-control" value="coffee">커피</option>
                        <option class="form-control" value="pottery">도자기</option>
                    </select>
                </div>
                <!-- [클래스 코드] code section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-dot-circle"></i>
                    </span>
                    </div>
                    <!-- coffee : c로 시작 / pottery : p로 시작 -->
                    <input type="text" class="form-control" placeholder="클래스 코드" id="code" name="code">
                </div>
                <!-- [클래스명] classname section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-dot-circle"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="클래스명" id="classname" name="classname">
                </div>
                <!-- [강사명] instructor section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-dot-circle"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="강사명" id="instructor" name="instructor">
                </div>
                <!-- [수강인원] person section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-user-alt"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="수강인원" id="person" name="person">
                </div>
                
                <div class="col-6 form-row mb-2">
                    <!-- [오픈일자] startdate section : 시작 -->
                    <div class="col input-group">
                        <div class=" input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-calendar-alt"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="오픈일자" id="startdate" name="startdate">
                    </div>
                     <!-- [마감일자] enddate section : 시작 -->
                    <div class="col input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-calendar-alt"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="마감일자" id="enddate" name="enddate">
                    </div>
                </div>
                <div class="col-6 form-row mb-2">
                     <!-- [오픈시간] opentime section : 시작 -->
                    <div class="col input-group">
                        <div class=" input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-clock"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="수업 오픈시간" id="opentime" name="opentime">
                    </div>
                    <!-- [마감시간] closetime section : 시작 -->
                    <div class="col input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-clock"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="수업 마감시간" id="closetime" name="closetime">
                    </div>
                </div>
                <div class="col-6 form-row mb-2">
                    <!-- [추가_오픈시간 1] add_opentime1 section : 시작 -->
                    <div class="col input-group">
                        <div class=" input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-clock"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="수업 오픈시간(추가)" id="add_opentime1" name="add_opentime1">
                    </div>
                    <!-- [추가_마감시간 1] add_closetime1 section : 시작 -->
                    <div class="col input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-clock"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="수업 마감시간(추가)" id="add_closetime1" name="add_closetime1">
                    </div>
                </div>
                <div class="col-6 form-row mb-2">
                    <!-- [추가_오픈시간 2] add_opentime2 section : 시작 -->
                    <div class="col input-group">
                        <div class=" input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-clock"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="수업 오픈시간(추가)" id="add_opentime2" name="add_opentime2">
                    </div>
                    <!-- [추가_마감시간 2] add_closetime2 section : 시작 -->
                    <div class="col input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-clock"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="수업 마감시간(추가)" id="add_closetime2" name="add_closetime2">
                    </div>
                </div>
                <!-- [가격] oneprice section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-tags"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="가격" id="oneprice" name="oneprice">
                </div>
                <!-- [우편번호] zipcode section : 시작 -->
                <div class="col-6 form-row mb-2">
                    <div class="col input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-home"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" placeholder="우편번호" id="zipcode" name="zipcode">
                    </div>
                    <div class="col input-group">
                        <button type="submit" class="btn btn-primary">우편번호 찾기</button>
                    </div>
                </div>
                <!-- [주소] address1 section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-map-marked-alt"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="주소" id="address1" name="address1">
                </div>
                <!-- [상세 주소] address2 section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-map-marked-alt"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="상세주소" id="address2" name="address2">
                </div>
                <!-- [메인 사진] main_image section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-image"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="메인사진" id="main_image" name="main_image">
                </div>
                <!-- [상세 사진 1] detail_image1 section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-image"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="세부사진(추가)" id="detail_image1" name="detail_image1">
                </div>
                <!-- [상세 사진 2] detail_image2 section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-image"></i>
                    </span>
                    </div>
                    <input type="text" class="form-control" placeholder="세부사진(추가)" id="detail_image2" name="detail_image2">
                </div>
                <!-- [수업 내용] content section : 시작 -->
                <div class="col-6 input-group mb-2">
                    <div class="input-group-prepend">
                    <span class="input-group-text">
                        <i class="fas fa-pencil-alt"></i>
                    </span>
                    </div>
                    <textarea class="form-control" name="comment" placeholder="상품 설명"></textarea>
                </div>
                <!-- 전송 버튼 -->
                <div class="col-6 btnckick">
                    <button type="submit" class="col-3 btn btn-primary">Submit</button>
                    <button type="reset" class="col-3 btn btn-warning">뒤로 가기</button>
                </div>
                <!-- --------- -->
            </form>
        </div>
    </div>
</body>
</html>