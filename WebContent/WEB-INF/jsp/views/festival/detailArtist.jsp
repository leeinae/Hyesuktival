<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
<meta content="" name="description">
<meta content="" name="author">

<title>Freelancer - Start Bootstrap Theme</title>

<!-- Custom fonts for this theme -->
<link href="/resources/Detail/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> 
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet"
      type="text/css">

<!-- Theme CSS -->
<link href="/resources/Detail/css/artist.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Noto+Sans+KR&display=swap" rel="stylesheet">


<title>Insert title here</title>
</head>

<body id="page-top">
<!-- navbar -->
   <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
    <div class="container">
       <div>
       <a class="navbar-brand js-scroll-trigger" href="/">HYESUKTIVAL</a>
       </div>
      

      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">  
        
        <li class="nav-item mx-0 mx-lg-1">
             <div class="box nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">
              <div class="container-1">
                  <form action="/search" method="get">      
                      <span class="icon"><i class="fa fa-search"></i></span>                  
                  <input type="search" name="search"id="search" placeholder="Search..." />
                                                   
               </form>
              </div>
         </div>
          </li>
          
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/signup">회원가입</a>
          </li>
          
          <li class="nav-item mx-0 mx-lg-1">
            <a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="/login">로그인</a>
          </li>
          
          
          
        </ul>
      </div>
    </div>
  </nav>
<!-- Masthead -->
<header class="masthead bg-primary text-center"
style="background:linear-gradient(200deg, rgba(213, 213, 213, 0.01) 0%, rgba(213, 213, 213, 0.01) 14.286%,rgba(140, 140, 140, 0.01) 14.286%, rgba(140, 140, 140, 0.01) 28.572%,rgba(52, 52, 52, 0.01) 28.572%, rgba(52, 52, 52, 0.01) 42.858%,rgba(38, 38, 38, 0.01) 42.858%, rgba(38, 38, 38, 0.01) 57.144%,rgba(159, 159, 159, 0.01) 57.144%, rgba(159, 159, 159, 0.01) 71.42999999999999%,rgba(71, 71, 71, 0.01) 71.43%, rgba(71, 71, 71, 0.01) 85.71600000000001%,rgba(88, 88, 88, 0.01) 85.716%, rgba(88, 88, 88, 0.01) 100.002%),linear-gradient(337deg, rgba(25, 25, 25, 0.01) 0%, rgba(25, 25, 25, 0.01) 12.5%,rgba(150, 150, 150, 0.01) 12.5%, rgba(150, 150, 150, 0.01) 25%,rgba(84, 84, 84, 0.01) 25%, rgba(84, 84, 84, 0.01) 37.5%,rgba(85, 85, 85, 0.01) 37.5%, rgba(85, 85, 85, 0.01) 50%,rgba(188, 188, 188, 0.01) 50%, rgba(188, 188, 188, 0.01) 62.5%,rgba(80, 80, 80, 0.01) 62.5%, rgba(80, 80, 80, 0.01) 75%,rgba(73, 73, 73, 0.01) 75%, rgba(73, 73, 73, 0.01) 87.5%,rgba(219, 219, 219, 0.01) 87.5%, rgba(219, 219, 219, 0.01) 100%),linear-gradient(203deg, rgba(233, 233, 233, 0.01) 0%, rgba(233, 233, 233, 0.01) 25%,rgba(114, 114, 114, 0.01) 25%, rgba(114, 114, 114, 0.01) 50%,rgba(164, 164, 164, 0.01) 50%, rgba(164, 164, 164, 0.01) 75%,rgba(228, 228, 228, 0.01) 75%, rgba(228, 228, 228, 0.01) 100%),linear-gradient(317deg, rgba(139, 139, 139, 0.02) 0%, rgba(139, 139, 139, 0.02) 16.667%,rgba(44, 44, 44, 0.02) 16.667%, rgba(44, 44, 44, 0.02) 33.334%,rgba(166, 166, 166, 0.02) 33.334%, rgba(166, 166, 166, 0.02) 50.001000000000005%,rgba(2, 2, 2, 0.02) 50.001%, rgba(2, 2, 2, 0.02) 66.668%,rgba(23, 23, 23, 0.02) 66.668%, rgba(23, 23, 23, 0.02) 83.33500000000001%,rgba(21, 21, 21, 0.02) 83.335%, rgba(21, 21, 21, 0.02) 100.002%),linear-gradient(328deg, rgba(3, 3, 3, 0.03) 0%, rgba(3, 3, 3, 0.03) 12.5%,rgba(116, 116, 116, 0.03) 12.5%, rgba(116, 116, 116, 0.03) 25%,rgba(214, 214, 214, 0.03) 25%, rgba(214, 214, 214, 0.03) 37.5%,rgba(217, 217, 217, 0.03) 37.5%, rgba(217, 217, 217, 0.03) 50%,rgba(68, 68, 68, 0.03) 50%, rgba(68, 68, 68, 0.03) 62.5%,rgba(118, 118, 118, 0.03) 62.5%, rgba(118, 118, 118, 0.03) 75%,rgba(200, 200, 200, 0.03) 75%, rgba(200, 200, 200, 0.03) 87.5%,rgba(198, 198, 198, 0.03) 87.5%, rgba(198, 198, 198, 0.03) 100%),linear-gradient(97deg, rgba(195, 195, 195, 0.03) 0%, rgba(195, 195, 195, 0.03) 16.667%,rgba(177, 177, 177, 0.03) 16.667%, rgba(177, 177, 177, 0.03) 33.334%,rgba(170, 170, 170, 0.03) 33.334%, rgba(170, 170, 170, 0.03) 50.001000000000005%,rgba(158, 158, 158, 0.03) 50.001%, rgba(158, 158, 158, 0.03) 66.668%,rgba(121, 121, 121, 0.03) 66.668%, rgba(121, 121, 121, 0.03) 83.33500000000001%,rgba(146, 146, 146, 0.03) 83.335%, rgba(146, 146, 146, 0.03) 100.002%),linear-gradient(268deg, rgba(103, 103, 103, 0.03) 0%, rgba(103, 103, 103, 0.03) 25%,rgba(112, 112, 112, 0.03) 25%, rgba(112, 112, 112, 0.03) 50%,rgba(4, 4, 4, 0.03) 50%, rgba(4, 4, 4, 0.03) 75%,rgba(227, 227, 227, 0.03) 75%, rgba(227, 227, 227, 0.03) 100%),linear-gradient(90deg, hsl(98,0%,0%),hsl(98,0%,0%));">
    <div class="container d-flex align-items-center flex-column">
     
   <div class='box2'>
   
   <img alt="" class="masthead-avatar" src="${requestScope.artist.src }" 
   style="z-index: 50;margin:5rem;border-radius: 50%;">
   
     <div class='wave -one'></div>
     <div class='wave -two'></div>
     <div class='wave -three'></div>
    
         
        <h1 class="masthead-heading text-uppercase mb-0" 
        style="font-family: 'S-CoreDream-8Heavy', sans-serif;">${requestScope.artist.aname }</h1>        
        <div class="divider-custom divider-light">
           <div class="divider-custom-line"></div>
        </div>
    
    
   </div>
      
    </div>
    
</header>

<!-- Portfolio Section -->
<section class="page-section" id="portfolio">
    <div class="container">

        <!-- Portfolio Section Heading -->
        <div>
         <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"
        style="font-family: 'S-CoreDream-8Heavy', sans-serif;word-spacing: 43rem;
        padding-left: 30px">TOP5  Award</h2>
        </div>

       
        <!-- Icon Divider -->
        <div class="divider-custom">
        <div class="divider-custom-line" ></div> 
        <div class="divider-custom-line" style="max-width: 44rem;height: 0.25rem;
    background-color: transparent; margin-left: 10px;"></div>
        <div class="divider-custom-line" ></div> 
        </div>

        <div class="MList">
            <div class="recomList">
                
                <a class="song" style="text-align: center"></a>
                <table class="table table-hover table-bordered" align="center" style="table-layout: fixed;">
                    <thead>
                    <tr>
                        <td style="width: 70px;">순위</td>
                        <td colspan="2" style="text-align: center" width="250px">곡</td>
                        <td style="width: 90px;">앨범</td>
                        
                    </tr>
                    </thead>
                    <tbody>                    
                       <c:forEach items="${requestScope.musicList }" begin="1" end="5" var="music" varStatus="status">
                  <tr>
                     <td>${ status.count }</td>                     
                     <td><img src="${music.src }" width="90" height="90"></td>
                     <td><h6>${music.mname }</h6></td>
                     <td><h6>${music.album }</h6></td>
                                       
                  </tr>
                  </c:forEach>
                   
                   </tbody>
                </table>
            </div>

            <div class="userRecomList">
               <div>
                <table class="table table-bordered" style="table-layout: fixed;"><!-- word-break:break-all; -->
                   
                   <tr>
                   <c:forEach items="${requestScope.musicList }" begin="0" end="2" var="music" varStatus="status">
                   <td colspan="4">                      
                         <div>                        
                         <img src="${music.src }" width="90px" height="90px">
                         <h6 style="text-align: center">${status.count}위
                         <c:set var="m" value="${music.mname }"/>                   
                        <c:choose>
                           <c:when test="${fn:length(m) > 14}">
                            <marquee direction="left">${music.mname }</marquee>      
                            </c:when>
                            <c:otherwise><br>${music.mname }</c:otherwise>
                        </c:choose>                                                             
                         </h6>
                         <h6 style="text-align: center;color:red;">${music.mCnt }</h6>
                         <div>
                         <input class="btn btn-primary btn-sm" type="button" style="width: 100px" value="투표하기">
                         </div>
                         
                         </div>
                   </td>  
                   </c:forEach>
                  </tr>                  
                  
                  <tr>
                  <c:forEach items="${requestScope.musicList }" begin="3" end="5" var="music" varStatus="status">
                    <td colspan="4">                 
                          <div>
                         <img src="${music.src }" width="90px" height="90px">
                         <h6 style="text-align: center">${status.count+3}위
                         <c:set var="m" value="${music.mname }"/>                   
                        <c:choose>
                           <c:when test="${fn:length(m) > 20}">
                            <marquee direction="left">${music.mname }</marquee>      
                            </c:when>
                            <c:otherwise><br>${music.mname }</c:otherwise>
                        </c:choose>  
                         </h6>
                         <h6 style="text-align: center;color:red;">${music.mCnt }</h6>
                         <input class="btn btn-primary btn-sm" type="button" style="width: 100px" value="투표하기">
                         </div>                                             
                    </td>  
                    </c:forEach>                                     
                  </tr>
                  
                  <tr>
                  <c:forEach items="${requestScope.musicList }" begin="6" end="9" var="music" varStatus="status">
                    <td colspan="3">                       
                          <div>
                         <img src="${music.src }" width="90px" height="90px">
                         <h6 style="text-align: center">${status.count+6}위
                         <c:set var="m" value="${music.mname }"/>                   
                        <c:choose>
                           <c:when test="${fn:length(m) > 20}">
                            <marquee direction="left">${music.mname }</marquee>      
                            </c:when>
                            <c:otherwise><br>${music.mname }</c:otherwise>
                        </c:choose>  
                         </h6>
                         <h6 style="text-align: center;color:red;">${music.mCnt }</h6>
                         <input class="btn btn-primary btn-sm" type="button" style="width: 100px" value="투표하기">
                         </div>
                         
                    </td>    
                    </c:forEach>    
                  </tr>
                  
                </table>
                  

                </div>

            </div>
        </div>
    </div>
    <br><br><br>


</section>
<section class="page-section portfolio bg-primary mb-0" id="portfolio">
    <div class="container">
        <!-- Portfolio Section Heading -->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0"
        style="font-family: 'S-CoreDream-8Heavy', sans-serif;">Zickcam list</h2>

        <!-- Icon Divider -->
        <div class="divider-custom">
           <!--  <div class="divider-custom-line"></div> -->
         </div>

           
        <!--Comment-->
        <br><br><br>
        <div class="comments" style="font-family: Eoe_Zno_L">
            <table class="table table-striped">
                <thead>     
                <tr>
                    <td colspan="3">
                       <div  >
                         <input type="text" class="form-control" placeholder="https://www.youtube.com/...">
                         <textarea class="form-control"style="width: 100%;" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요">
                         </textarea>           
                            <div>
                                <a href='#' onClick="fn_comment('${result.code }')" class="btn pull-right btn-success">등록</a>
                            </div>
              
                        </div>
                        <br>
                    </td>
                </tr>           
                <td><strong>영상</strong></td>
                <td><strong>댓글</strong></td>
                <td><strong>추천수</strong></td>
                </thead>
          
                <tbody>
                
                
                               
                <tr>
                    <td>
                        <iframe width="300" height="200" src="https://www.youtube.com/embed/mxa8ydeI-ZQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </td>
                    <td>
                        <h2>작성자</h2>
                        <h3>너무 귀여워요..으아아아아아아아아악!!!!!!!!!!!!!!!!!!!!!!!!!!</h3>
                        <button class="btn btn-warning">수정</button>
                        <button class="btn btn-danger">삭제</button>
                    </td>
                    <td>
                        <button class="btn btn-primary">추천</button>
                        <button class="btn btn-dark">비추천</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iframe width="300" height="200" src="https://www.youtube.com/embed/N5fwidQnt54" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </td>
                    <td>
                        <h2>작성자</h2>
                        <h3>너무 귀여워요..으아아아아아아아아악!!!!!!!!!!!!!!!!!!!!!!!!!! 더 길게 쓰면 어떻게 되는지 궁금.................아하</h3>
                        <button class="btn btn-warning ">수정</button>
                        <button class="btn btn-danger">삭제</button>
                    </td>
                    <td>
                        <button class="btn btn-primary">추천</button>
                        <button class="btn btn-dark">비추천</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iframe width="300" height="200" src="https://www.youtube.com/embed/N5fwidQnt54" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </td>
                    <td>
                        <h2>작성자</h2>
                        <h3>너무 귀여워요..으아아아아아아아아악!!!!!!!!!!!!!!!!!!!!!!!!!! 더 길게 쓰면 어떻게 되는지 궁금.................아하</h3>
                        <button class="btn btn-warning">수정</button>
                        <button class="btn btn-danger">삭제</button>
                    </td>
                    <td>
                        <button class="btn btn-primary ">추천</button>
                        <button class="btn btn-dark">비추천</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <iframe width="300" height="200" src="https://www.youtube.com/embed/N5fwidQnt54" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </td>
                    <td>
                        <h2>작성자</h2>
                        <h3>너무 귀여워요..으아아아아아아아아악!!!!!!!!!!!!!!!!!!!!!!!!!! 더 길게 쓰면 어떻게 되는지 궁금.................아하</h3>
                        <button class="btn btn-warning">수정</button>
                        <button class="btn btn-danger">삭제</button>
                    </td>
                    <td>
                        <button class="btn btn-primary">추천</button>
                        <button class="btn btn-dark">비추천</button>
                    </td>
                </tr>
                
                </tbody>
            </table>
            <div id="pageForm" align="center">
              <c:if test="true">
                  <a href="BoardListAction.bo?page=-1" style="color:black">[ 이전 ]</a>
              </c:if>
              
             <%--  <c:foreach var="pageNum" begin="1" end="5">
                  <c:if test="true">
                      &nbsp;
                  </c:if>
                  <c:if test="false">
                      <a href="BoardListAction.bo?page=">&nbsp;</a>
                  </c:if>
              </c:foreach>
               --%>
              <c:if test="false">
                  <a href="BoardListAction.bo?page=1" style="color:black">[다음]</a>
              </c:if>
          </div>
        </div>
    </div>
</section>



<!-- Footer -->


<!-- Copyright Section -->
<section class="copyright py-4 text-center text-white">
    <div class="container">
        <small>Copyright &copy; Your Website 2019</small>
    </div>
</section>

<!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
<div class="scroll-to-top d-lg-none position-fixed ">
    <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
        <i class="fa fa-chevron-up"></i>
    </a>
</div>

<!-- Portfolio Modals -->
<!-- 
Portfolio Modal 1
<div aria-hidden="true" aria-labelledby="portfolioModal1Label" class="portfolio-modal modal fade" id="portfolioModal1"
     role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <button aria-label="Close" class="close" data-dismiss="modal" type="button">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
            </button>
            <div class="modal-body text-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            Portfolio Modal - Title
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Log Cabin</h2>
                            Icon Divider
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                
                            </div>
                            Portfolio Modal - Image
                            <img alt="" class="img-fluid rounded mb-5" src="img/portfolio/cabin.png">
                            Portfolio Modal - Text
                            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque
                                assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit
                                asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-dismiss="modal" href="#">
                                <i class="fas fa-times fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

Portfolio Modal 2
<div aria-hidden="true" aria-labelledby="portfolioModal2Label" class="portfolio-modal modal fade" id="portfolioModal2"
     role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <button aria-label="Close" class="close" data-dismiss="modal" type="button">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
            </button>
            <div class="modal-body text-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            Portfolio Modal - Title
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Tasty Cake</h2>
                            Icon Divider
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                            </div>
                            Portfolio Modal - Image
                            <img alt="" class="img-fluid rounded mb-5" src="img/portfolio/cake.png">
                            Portfolio Modal - Text
                            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque
                                assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit
                                asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-dismiss="modal" href="#">
                                <i class="fas fa-times fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

Portfolio Modal 3
<div aria-hidden="true" aria-labelledby="portfolioModal3Label" class="portfolio-modal modal fade" id="portfolioModal3"
     role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <button aria-label="Close" class="close" data-dismiss="modal" type="button">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
            </button>
            <div class="modal-body text-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            Portfolio Modal - Title
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Circus Tent</h2>
                            Icon Divider
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            Portfolio Modal - Image
                            <img alt="" class="img-fluid rounded mb-5" src="img/portfolio/circus.png">
                            Portfolio Modal - Text
                            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque
                                assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit
                                asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-dismiss="modal" href="#">
                                <i class="fas fa-times fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

Portfolio Modal 4
<div aria-hidden="true" aria-labelledby="portfolioModal4Label" class="portfolio-modal modal fade" id="portfolioModal4"
     role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <button aria-label="Close" class="close" data-dismiss="modal" type="button">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
            </button>
            <div class="modal-body text-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            Portfolio Modal - Title
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Controller</h2>
                            Icon Divider
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            Portfolio Modal - Image
                            <img alt="" class="img-fluid rounded mb-5" src="img/portfolio/game.png">
                            Portfolio Modal - Text
                            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque
                                assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit
                                asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-dismiss="modal" href="#">
                                <i class="fas fa-times fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

Portfolio Modal 5
<div aria-hidden="true" aria-labelledby="portfolioModal5Label" class="portfolio-modal modal fade" id="portfolioModal5"
     role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <button aria-label="Close" class="close" data-dismiss="modal" type="button">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
            </button>
            <div class="modal-body text-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            Portfolio Modal - Title
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Locked Safe</h2>
                            Icon Divider
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            Portfolio Modal - Image
                            <img alt="" class="img-fluid rounded mb-5" src="img/portfolio/safe.png">
                            Portfolio Modal - Text
                            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque
                                assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit
                                asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-dismiss="modal" href="#">
                                <i class="fas fa-times fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

Portfolio Modal 6
<div aria-hidden="true" aria-labelledby="portfolioModal6Label" class="portfolio-modal modal fade" id="portfolioModal6"
     role="dialog" tabindex="-1">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <button aria-label="Close" class="close" data-dismiss="modal" type="button">
          <span aria-hidden="true">
            <i class="fas fa-times"></i>
          </span>
            </button>
            <div class="modal-body text-center">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-8">
                            Portfolio Modal - Title
                            <h2 class="portfolio-modal-title text-secondary text-uppercase mb-0">Submarine</h2>
                            Icon Divider
                            <div class="divider-custom">
                                <div class="divider-custom-line"></div>
                                <div class="divider-custom-icon">
                                    <i class="fas fa-star"></i>
                                </div>
                                <div class="divider-custom-line"></div>
                            </div>
                            Portfolio Modal - Image
                            <img alt="" class="img-fluid rounded mb-5" src="img/portfolio/submarine.png">
                            Portfolio Modal - Text
                            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Mollitia neque
                                assumenda ipsam nihil, molestias magnam, recusandae quos quis inventore quisquam velit
                                asperiores, vitae? Reprehenderit soluta, eos quod consequuntur itaque. Nam.</p>
                            <button class="btn btn-primary" data-dismiss="modal" href="#">
                                <i class="fas fa-times fa-fw"></i>
                                Close Window
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
 -->
<!-- Bootstrap core JavaScript -->
<script src="/resources/Detail/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/Detail/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Plugin JavaScript -->
<script src="/resources/Detail/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Contact Form JavaScript -->
<script src="/resources/Detail/resources/js/jqBootstrapValidation.js"></script>
<script src="/resources/Detail/resources/js/contact_me.js"></script>

<!-- Custom scripts for this template -->
<script src="/resources/Detail/resources/js/freelancer.min.js"></script>

</body>
</html>