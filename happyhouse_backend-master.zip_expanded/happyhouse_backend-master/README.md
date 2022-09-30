
> **✨ 결과 산출물 ✨**
> 
> **✔ 요구사항 목록**
>
>  **(1) 로그인**
> - DB와 연동하여 아이디, 이름, 비밀번호를 저장하였습니다.
> - DB를 통해 비밀번호 찾기 탭을 클릭했을 때, 비밀번호를 볼 수 있게 하였습니다.
> - Session 처리하여 로그인된 아이디를 불러올 수 있었습니다.
> 
> &nbsp;
>
> **(2) 회원 관리**
> - 아이디에 조건을 추가하여 6자이상 12자 이하로 만들도록 하였습니다.
> - 아이디 중복 검사를 통해 이미 생성된 아이디는 만들 수 없게 하였습니다.
>
> &nbsp;
>
> **(3) 게시글**
> - DB를 연동하여 게시글 제목, 내용, 작성자를 저장하였습니다.
> - 게시글을 수정, 삭제할 수 있도록 구현하였습니다.
> - MVC 패턴을 프로젝트에 적용하여 구조를 비지니스 로직과 UI 로직을 분리하여 유지보수를 쉽게 할 수 있었습니다.
>
> &nbsp;
> 
> **✔ 클래스 다이어그램** 
> 
> 
> ![다이어그램](https://user-images.githubusercontent.com/101916058/192731763-adc6a38d-f69f-44a4-aa71-42978ec7b81f.png)
> 
> 
> &nbsp;
> 
> 
> **✔ 유스케이스 다이어그램**
>  
> **(1) main 관리 Usecase**
> 
> ![mainusecase](https://user-images.githubusercontent.com/101916058/192736194-4f077794-3b83-4c23-aa29-0429bb095ad3.png)
>
> &nbsp;
>
>
> **(2) 기본 관리 Usecase**
>
> ![usecase2](https://user-images.githubusercontent.com/101916058/192736198-582dd9ce-8d78-41d1-98e0-35f0da14eced.png)
>
> &nbsp;
>

&nbsp;

----

&nbsp;


# 🏠 1. Main View

![메인화면](https://user-images.githubusercontent.com/101916058/192698223-d4d6cd0e-b9e5-4dca-9ba2-de5e3a580995.png)

&nbsp;

### 📑 Filtering Search

![메인 필터링 검색](https://user-images.githubusercontent.com/72541544/188910119-87c524d5-5378-485f-9144-92c1eea4fafd.png)

![메인 필터링 검색2](https://user-images.githubusercontent.com/72541544/188910130-5656cea6-2efd-416d-b00d-d3b2ae59a1fd.png)

&nbsp;

----

&nbsp;

# 🏠 2. Login, Join Us

### 📑 로그인

![Login](https://user-images.githubusercontent.com/101916058/192698230-a86c2444-2a1c-4c0e-9e46-5455a3bb4b09.png)

- `email`, `password`를 입력하여 로그인

&nbsp;

### 📑 비밀번호 찾기

![비밀번호찾기](https://user-images.githubusercontent.com/101916058/192698225-104956fa-7e7f-45d8-b592-bf56197c122a.png)

![비밀번호출력](https://user-images.githubusercontent.com/101916058/192698226-ef58835f-8aec-4398-953f-56f3de30df6a.png)

- `id`를 입력하여 비밀번호를 찾는다.

&nbsp;

&nbsp;

### 📑 Join Us

![회원가입페이지](https://user-images.githubusercontent.com/101916058/192718153-50203ff1-57f9-4e51-8dbb-d9fb6da8cb57.png)

- `username`, `password`, `email` 을 입력하여 회원가입입력하기

&nbsp;

### 📑 나의 계정 수정하기

![나의정보](https://user-images.githubusercontent.com/101916058/192698215-6678e7e1-2126-4a0d-bcb4-d7d6edb67462.png)

- `modify` 클릭

&nbsp;

![이름수정](https://user-images.githubusercontent.com/101916058/192698228-1c0ea008-0419-4b35-848c-70c8de791b7a.png)

- 이메일, 이름, 패스워드 수정하기

&nbsp;

----

&nbsp;

# 🏠 3. 게시글 작성

### 📑 로그인 된 화면

![로그인된 화면](https://user-images.githubusercontent.com/101916058/192698219-88965e4a-f4a1-4e11-8a28-09da000b076a.png)

- `Home`, `logout`, `myinfo`, `post`

&nbsp;

### 📑 게시글 화면

![게시글 등록페이지](https://user-images.githubusercontent.com/101916058/192698214-0be2b449-6d63-4303-a5a1-dbf50e59ef16.png)

&nbsp;

### 📑 게시글 등록 화면

![글쓰기 테스트](https://user-images.githubusercontent.com/101916058/192717481-c57ef53d-910c-4853-9998-988ed36071e3.png)

- 제목과 내용을 입력한다.

&nbsp;

![게시글 등록페이지](https://user-images.githubusercontent.com/101916058/192717458-d8ff658d-3ea9-4ca5-b0b8-f6298e4fd18c.png)

- 게시글이 등록되었다.

&nbsp;

### 📑 게시글 수정 화면

![게시글 수정](https://user-images.githubusercontent.com/101916058/192717478-65b345d7-ac13-46f1-a7e2-7fe1a614d2c7.png)

&nbsp;

### 📑 게시글 삭제 화면

![게시글 삭제버튼](https://user-images.githubusercontent.com/101916058/192717471-e8f3e00e-3bae-4654-b871-3aec88149c61.png)

&nbsp;

&nbsp;


----

&nbsp;
