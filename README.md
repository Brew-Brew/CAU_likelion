# Ruby on rails 웹 설계하기

## 멋사 중앙대 사이트 구축

```
이번에 제작하게 되는 rails로 제작하게 되는 웹은 REST API 규칙을 지키면서 설계하고,
필요한 기능에 따라 필요한 모델과 컨트롤러만 만들고, 불필요한 작업을 줄이기위해 주저리주저리 적어본다.
```


### 기능

일단 웹에서 주요로 제공하는 기능은



1. **Landing page  (기능이라기 보다는 페이지이지만..)**

  - ui 애니메이션 요소 집어넣기 (시선을 끌만한)
  - 운영진 소개
  - contact us를 여기다 넣어도 될듯? 굳이페이지를 하나 파지않고.



2. **스터디팀용 스터디게시판 (스터디 자료 업로드,다운로드 )**

  - 게시판 editor 적용시키기,  파일첨부기능 (업로드,다운로드 ), 팀별 접근권한


3. **contact us**

  - 우리사이트에 contact하고 싶은 분들을 위한 form형식의 페이지를 만들어서 연락하는 사람의 이메일과 번호?와 연락목적등을 입력해 전송하면, 관리자들은 그 연락내용을 볼수 있는 구조로 생각하고있다. 앞서 말했듯 굳이 페이지 하나를 만드는게 아니라 랜딩페이지에 하단에 넣어도 될듯하다.


4. **익명게시판 (가능하다면(?))**

  -  실시간 대화기능(?) 소켓사용 해서 대화하는 게시판 or 그냥 crud게시판

### 모델


  - Team과 관련한 모델을 만들까 생각했었지만, 세팀뿐이므로 overspec 일것이고, 딱히 액션도 그 Team에 대한것을 보여주는 것 뿐이므로, 그저 user모델에 team이라는 컬럼을 넣어주면된다.



  - Team 모델이 필요없고 user모델에서 team이라는 attribute만 추가해주면 된다고 생각했는데, 그러면 각각의 유저들이 참조하는 team (ex: 1) 이라는 attribute는 그저 같은 숫자값일 뿐이고, 같은팀(부모)를 참조한다는 느낌이 들지 않을것 같아 적절치 못한구조라 생각되어 Team 모델을 만들기로 했다.



  1. Post

  스터디용 게시판의 자료들이 저장될 모델이다.


  2. User

  유저정보와 관련된 모델이다. (스터디장(운영진), 스터디원)


  3. Contact

  우리 사이트에 컨택트하는 form을 보내게되면 데이터가 저장되는 모델이다.

  4. Team

### URI 설계

- uri설계할때 참고한 자료를 아래에 적어보았다.
```
리소스 간의 관계를 표현하는 방법

REST 리소스 간에는 연관 관계가 있을 수 있고, 이런 경우 다음과 같은 표현방법으로 사용합니다.
/리소스명/리소스 ID/관계가 있는 다른 리소스명    
ex)GET : /users/{userid}/devices (일반적으로 소유 ‘has’의 관계를 표현할 때)

```
윗글 **http://meetup.toast.com/posts/92** 참고

따라서 스터디게시판 같은경우는

http://examplesite/team/1/posts 와 같은 uri 패턴을 적용하려한다.

- ex) GET:  http://examplesite/teams/1/posts/1

-> 스터디게시판의 팀1의 첫번째 post글


### 컨트롤러


-시작하기에 앞서 고민했던 점은 랜딩페이지용 컨트롤러를 만들것인가, 아니면 그냥 스태틱 페이지만 만들것인가 였는데, 아래 링크를 참고하면, 많은 rails 사이트들이 랜딩페이지를 만들때 컨트롤러를 만들고, semi static page를 가진다고 한다 하여, 앞서 contact 페이지를 만들어주려 했었으므로, home 컨트롤러에 index, contact 두가지 액션을 가지게 설계하였다.



https://stackoverflow.com/questions/18047191/generate-routes-for-one-page-landing-pages



-그리고 액션과 라우트를 매칭 시키기 때문에 그점도 생각하였다.


> Home

-index **(GET: /)**

첫 랜딩페이지가 된다.

-contact **(GET: /contact)**

contact us 부분이된다.

> Team

-index **(GET: teams/:teamid)**

스터디 팀을 선택했을때의 각 팀의 페이지라 생각하면된다.

post 컨트롤러에서는 posts/1  과 같이 show액션으로 접근했었다면, team/1과 같이 index 액션으로 접근한다고 생각하면 된다. show라는 이름의 액션으로 지을까 했지만, 각 컨트롤러를 대표하는 액션은 index로 통일하는 것이 뭔가 더 모듈화 된 느낌이고, 통일성을 준다고 생각하여, 위와 같은 패턴을 선택했다.

> Post

-index **( GET: teams/:teamid/posts)**

-create **( POST: teams/:teamid/posts)**

-new **( GET: teams/:teamid/posts/new)**

-update **( PUT/PATCH : teams/:teamid/posts/update)**

-edit **( GET: teams/:teamid/posts/edit)**

-show **( GET: teams/:teamid/posts/:id)**

-destroy **(DELETE: teams/1/posts/:id)**

> User

-index **(GET: users/:id)**

mypage와 같은 기능이다.
