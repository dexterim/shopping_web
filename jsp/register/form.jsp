<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<div class="container">

	<form onsubmit="return checkForm(this);" method="post" action="../register/pro.jsp" class="form-horizontal" name="myform">
		<div class="container">
			<fieldset>
				<!-- 약관동의_체크박스 1개 변수 전달 -->
				<div class="form-group">
					<label class="col-sm-2 control-label">약관 동의</label>
					<div class="col-sm-8">
						<label class="form-check-label">
							<input type="checkbox" class="form-check-input" name="agree" value="1">
							이용 약관에 동의 합니다.
						</label>
						<textarea class="form-control" rows="5" id="comment">
1."몰"은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다.
다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.
가) 성명 (한글, 영문)
나) 주민등록번호(회원, 비회원 공통)
다) 주소
라) 전화번호
마) 희망ID(회원의 경우)
바) 비밀번호(회원의 경우)
사) 주문 비밀번호
2."몰"이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
3.제공된 개인정보는 당해 이용자의 동의없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 "몰"이 집니다. 다만, 다음의 경우에는 예외로 합니다.

가) 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호) 를 알려주는 경우
나) 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
4."몰"이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는자, 제공목적 및 제공할 정보의 내용)등 정보 통신망 이용촉진 등에 관한 법률 제16조제3항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
5.이용자는 언제든지 "몰"이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 "몰"은 이에 대해 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 "몰"은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
6."몰"은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
7."몰" 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.
						</textarea>
					</div>
				</div>

				<!-- 아이디_name="id"를 이용하여 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">회원아이디</label>
					<div class="col-sm-6">
						<input type="text" name="id" class="form-control" placeholder="아이디를 입력하세요.">
						<h6>아이디를 입력 하셔야 합니다.</h6>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-primary btn-block" onclick="overlap()">ID 중복 검사</button>
					</div>
				</div>

				<!-- 비밀번호_name="pass"를 이용하여 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-8">
						<input type="password" id="pass_chk1" name="pass" class="form-control" placeholder="비밀번호를 입력하세요.">
						<h6>비밀 번호는 6자리 이상~12자리 이하로 입력해 주세요.</h6>
					</div>
				</div>

				<!-- 비밀번호_name="pass"를 이용하여 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">비밀번호 확인</label>
					<div class="col-sm-8">
						<input type="password" id="pass_chk2" name="pass" class="form-control" placeholder="비밀번호를 한번 더 입력하세요.">
						<h6>위와 같은 비밀번호를 입력해주세요.</h6>
					</div>
				</div>

				<!-- 이름_name="name1,2"를 이용하여 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">이름</label>
					<div class="col-sm-8">
						<input type="text" name="name" class="form-control" placeholder="이름을 입력하세요.">
					</div>
				</div>

				<!-- 주민 등록 번호_name="security1,2"를 이용하여 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">주민 등록 번호</label>
					<div class="col-sm-4">
						<input type="text" name="security1" class="form-control" placeholder="주민번호 6자리를 입력하세요.">
					</div>
					<div class="col-sm-4">
						<input type="password" name="security2" class="form-control" placeholder="주민번호 7자리를 입력하세요.">
					</div>
				</div>

				<!-- 성별_라디오 버튼을 그룹으로 묶어 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">성별</label>
					<div class="col-sm-8">
						<label class="radio-inline">
							<input type="radio" name="gender" value="1"> 남자
						</label>
						<label class="radio-inline">
							<input type="radio" name="gender" value="2" checked="checked"> 여자
						</label>
					</div>
				</div>

				<!-- 휴대 전화_셀렉트박스를 이용하여 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">휴대 전화 입력</label>
					<div class="col-sm-2">
						<select name="phone1" class="form-control">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="013">013</option>
						</select>
					</div>
					<div class="col-sm-6">
						<div class="input-group">
							<input type="text" name="phone2" class="form-control" placeholder="휴대전화를 입력하세요.">
							<span class="input-group-btn">
								<button class="btn btn-primary" type="button" onclick="send()">인증번호 보내기</button>
							</span>
						</div>
					</div>
				</div>

				<!-- 취미_체크박스 여러개 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">취미</label>
					<div class="col-sm-8" id="isChk">
						<label class="checkbox-inline"><input type="checkbox" name="hobby" value="클라이밍">클라이밍</label>
						<label class="checkbox-inline"><input type="checkbox" name="hobby" value="헬스">헬스</label>
						<label class="checkbox-inline"><input type="checkbox" name="hobby" value="영화 감상">영화 감상</label>
						<input type="text" id="chk" hidden="hidden" name="chk">
					</div>
				</div>

				<!-- 관심 과목_셀렉트박스 여러개 변수 전달 -->

				<div class="form-group">
					<label class="col-sm-2 control-label">관심 과목</label>
					<div class="col-sm-8">
						<select multiple class="form-control" id="subject" name="subject">
							<option value="Jsp">Jsp</option>
							<option value="Mobile">Mobile</option>
							<option value="SQL">SQL</option>
							<option value="C">C</option>
							<option value="Python">Python</option>
						</select>
						<input type="text" name="mul" hidden="hidden" >
					</div>
				</div>

				<!-- to.jsp로 전송하는 버튼 -->

				<div class="form-group">
					<div class="col-sm-4  col-sm-offset-2">
						<button type="submit" class="btn btn-success btn-block">회원가입</button>
					</div>
					<div class="col-sm-4">
						<button type="reset" class="btn btn-primary btn-block">다시 입력</button>
					</div>
				</div>

			</fieldset>
		</div>
	</form>
</div>