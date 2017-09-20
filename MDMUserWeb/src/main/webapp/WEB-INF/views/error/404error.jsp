<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
    <link rel="stylesheet" media="screen" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600" />
    <link rel="stylesheet" media="screen" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" />
    <title>Error</title>

    <style>
     * {
         -moz-box-sizing:border-box;
         -webkit-box-sizing:border-box;
         box-sizing:border-box;
     }

     html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre,
     abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp,
     small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li,
     fieldset, form, label, legend, caption, article, aside, canvas, details, figcaption, figure,  footer, header, hgroup,
     menu, nav, section, summary, time, mark, audio, video {
         margin:0;
         padding:0;
         border:0;
         outline:0;
         vertical-align:baseline;
         background:transparent;
     }

     article, aside, details, figcaption, figure, footer, header, hgroup, nav, section {
         display: block;
     }

     html {
         font-size: 16px;
         line-height: 24px;
         width:100%;
         height:100%;
         -webkit-text-size-adjust: 100%;
         -ms-text-size-adjust: 100%;
         overflow-y:scroll;
         overflow-x:hidden;
     }

     img {
         vertical-align:middle;
         max-width: 100%;
         height: auto;
         border: 0;
         -ms-interpolation-mode: bicubic;
     }

     body {
         min-height:100%;
         -webkit-font-smoothing: subpixel-antialiased;
     }

     .clearfix {
	       clear:both;
	       zoom: 1;
     }
     .clearfix:before, .clearfix:after {
         content: "\0020";
         display: block;
         height: 0;
         visibility: hidden;
     } 
     .clearfix:after {
         clear: both;
     }
    </style>
    <style>
  body.background.error-page-wrapper, .background.error-page-wrapper.preview {
    font-family: 'Source Sans Pro', sans-serif;
    background-position:center center;
    background-repeat:no-repeat;
    background-size:cover;
    position:relative;
  }

  .background.error-page-wrapper .content-container {
    border-radius: 6px;
    text-align: center;
    box-shadow: 0 0 20px rgba(0,0,0,.2);
    padding:50px;
    background-color: #fff;
    width:100%;
    max-width:525px;
    position:absolute;
    left:50%;
    margin-left:-262px;
  }

  .background.error-page-wrapper .content-container.in {
    left:0px;
    opacity:1;
  }

  .background.error-page-wrapper .head-line {
    transition:color .2s linear;
    font-size:48px;
    line-height:60px;
    letter-spacing: -1px;
    margin-bottom: 5px;
    color:#ccc;
  }
  .background.error-page-wrapper .subheader {
    transition:color .2s linear;
    font-size:36px;
    line-height:46px;
    color:#333;
  }
  .background.error-page-wrapper .hr {
    height:1px;
    background-color: #ddd;
    width:60%;
    max-width:250px;
    margin:35px auto;
  }
  .background.error-page-wrapper .context {
    transition:color .2s linear;
    font-size:18px;
    line-height:27px;
    color:#bbb;
  }
  .background.error-page-wrapper .context p {
    margin:0;
  }
  .background.error-page-wrapper .context p:nth-child(n+2) {
    margin-top:16px;
  }
  .background.error-page-wrapper .buttons-container {
    margin-top: 35px;
    overflow: hidden;
  }
  .background.error-page-wrapper .buttons-container a {
    transition:text-indent .2s ease-out, color .2s linear, background-color .2s linear;
    text-indent: 0px;
    font-size:14px;
    text-transform: uppercase;
    text-decoration: none;
    color:#fff;
    background-color:#2ecc71;
    border-radius: 99px;
    padding:12px 0 13px;
    text-align: center;
    display:inline-block;
    overflow: hidden;
    position: relative;
    width:45%;
  }

  .background.error-page-wrapper .buttons-container .fa {
    transition:left .2s ease-out;
    position: absolute;
    left:-50px;
  }

  .background.error-page-wrapper .buttons-container a:hover {
    text-indent: 15px;
  }

  .background.error-page-wrapper .buttons-container a:nth-child(1) {
    float:left;
  }

  .background.error-page-wrapper .buttons-container a:nth-child(2) {
    float:right;
  }

  .background.error-page-wrapper .buttons-container .fa-home {
    font-size:18px;
    top:15px;
  }

  .background.error-page-wrapper .buttons-container a:hover .fa-home {
    left:10px;
  }

  .background.error-page-wrapper .buttons-container .fa-warning {
    font-size:16px;
    top:17px;
  }

  .background.error-page-wrapper .buttons-container a:hover .fa-warning {
    left:5px;
  }

  .background.error-page-wrapper .buttons-container .fa-power-off {
    font-size:16px;
    top:17px;
  }

  .background.error-page-wrapper .buttons-container a:hover .fa-power-off {
    left:9px;
  }


  .background.error-page-wrapper .buttons-container.single-button {
    text-align: center;
  }

  .background.error-page-wrapper .buttons-container.single-button a  {
    float:none !important;
  }

  @media screen and (max-width: 555px) {
    .background.error-page-wrapper {
      padding:30px 5%;
    }
    .background.error-page-wrapper .content-container {
      padding:37px;
      position: static;
      left: 0;
      margin-left:0;
    }
    .background.error-page-wrapper .head-line {
      font-size:36px;
    }
    .background.error-page-wrapper .subheader {
      font-size:27px;
      line-height: 37px;
    }
    .background.error-page-wrapper .hr {
      margin:30px auto;
      width:215px;
    }
    .background.error-page-wrapper .buttons-container .fa {
      display:none;
    }
    .background.error-page-wrapper .buttons-container a:hover {
      text-indent: 0px;
    }
  }

  @media screen and (max-width: 450px) {
    .background.error-page-wrapper {
      padding:30px;
    }
    .background.error-page-wrapper .head-line {
      font-size:32px;
    }
    .background.error-page-wrapper .hr {
      margin:25px auto;
      width:180px;
    }
    .background.error-page-wrapper .context {
      font-size:15px;
      line-height:22px;
    }

    .background.error-page-wrapper .context p:nth-child(n+2) {
      margin-top:10px;
    }
    .background.error-page-wrapper .buttons-container {
      margin-top:29px;
    }
    .background.error-page-wrapper .buttons-container a {
      float:none !important;
      width:65%;
      margin:0 auto;
      font-size:13px;
      padding:9px 0;
    }

    .background.error-page-wrapper .buttons-container a:nth-child(2) {
      margin-top:12px;
    }
  }
</style>
    <style>



    .primary-text-color {
      color: #494949 !important;
    }

    .secondary-text-color {
      color: #AAAAAA !important;
    }

    .sign-text-color {
      color: #FFBA00 !important;
    }

    .sign-frame-color {
      color: #343C3F;
    }

    .pane {
      background-color: #FFFFFF !important;
    }

    .border-button {
      color: #2ECC71 !important;
      border-color: #2ECC71 !important;
    }
    .button {
      background-color: #2ECC71 !important;
      color: #FFFFFF !important;
    }

    .shadow {
      box-shadow: 0 0 60px #000000;
    }

</style>
  </head>
  <body class="background error-page-wrapper background-color background-image">
    <center>
  <div class="content-container shadow">
    <div class="head-line secondary-text-color">
      404
    </div>
    <div class="subheader primary-text-color">
      	페이지를 찾을 수 없습니다.
    </div>
    <div class="hr"></div>
    <div class="context secondary-text-color">
    </div>
    <div class="buttons-container">
      <a class="button" href="${pageContext.request.contextPath}/" target="_blank"><span class="fa fa-home"></span> Go To Homepage</a>
      <a class="button" href="${pageContext.request.contextPath}/profile" target="_blank"><span class="fa fa-warning"></span> Back to the Profile</a>
    </div>
  </div>
</center>

    <script>
     function ErrorPage(container, pageType, templateName) {
       this.$container = $(container);
       this.$contentContainer = this.$container.find(templateName == 'sign' ? '.sign-container' : '.content-container');
       this.pageType = pageType;
       this.templateName = templateName;
     }

     ErrorPage.prototype.centerContent = function () {
       var containerHeight = this.$container.outerHeight()
         , contentContainerHeight = this.$contentContainer.outerHeight()
         , top = (containerHeight - contentContainerHeight) / 2
         , offset = this.templateName == 'sign' ? -100 : 0;

       this.$contentContainer.css('top', top + offset);
     };

     ErrorPage.prototype.initialize = function () {
       var self = this;

       this.centerContent();
       this.$container.on('resize', function (e) {
         e.preventDefault();
         e.stopPropagation();
         self.centerContent();
       });

       // fades in content on the plain template
       if (this.templateName == 'plain') {
         window.setTimeout(function () {
           self.$contentContainer.addClass('in');
         }, 500);
       }

       // swings sign in on the sign template
       if (this.templateName == 'sign') {
         $('.sign-container').animate({textIndent : 0}, {
           step : function (now) {
             $(this).css({
               transform : 'rotate(' + now + 'deg)',
               'transform-origin' : 'top center'
             });
           },
           duration : 1000,
           easing : 'easeOutBounce'
         });
       }
     };


     ErrorPage.prototype.createTimeRangeTag = function(start, end) {
       return (
         '<time utime=' + start + ' simple_format="MMM DD, YYYY HH:mm">' + start + '</time> - <time utime=' + end + ' simple_format="MMM DD, YYYY HH:mm">' + end + '</time>.'
       )
     };


     ErrorPage.prototype.handleStatusFetchSuccess = function (pageType, data) {
       if (pageType == '503') {
         $('#replace-with-fetched-data').html(data.status.description);
       } else {
         if (!!data.scheduled_maintenances.length) {
           var maint = data.scheduled_maintenances[0];
           $('#replace-with-fetched-data').html(this.createTimeRangeTag(maint.scheduled_for, maint.scheduled_until));
           $.fn.localizeTime();
         }
         else {
           $('#replace-with-fetched-data').html('<em>(there are no active scheduled maintenances)</em>');
         }
       }
     };


     ErrorPage.prototype.handleStatusFetchFail = function (pageType) {
       $('#replace-with-fetched-data').html('<em>(enter a valid Statuspage url)</em>');
     };


     ErrorPage.prototype.fetchStatus = function (pageUrl, pageType) {
       //console.log('in app.js fetch');
       if (!pageUrl || !pageType || pageType == '404') return;

       var url = ''
         , self = this;

       if (pageType == '503') {
         url = pageUrl + '/api/v2/status.json';
       }
       else {
         url = pageUrl + '/api/v2/scheduled-maintenances/active.json';
       }

       $.ajax({
         type : "GET",
         url : url,
       }).success(function (data, status) {
         //console.log('success');
         self.handleStatusFetchSuccess(pageType, data);
       }).fail(function (xhr, msg) {
         //console.log('fail');
         self.handleStatusFetchFail(pageType);
       });

     };
     var ep = new ErrorPage('body', "404", "background");
     ep.initialize();

     // hack to make sure content stays centered >_<
     $(window).on('resize', function() {
       $('body').trigger('resize')
     });

    </script>

    
  </body>
</html>
