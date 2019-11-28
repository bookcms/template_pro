<?php
namespace app\index\controller;

use app\common\controller\Common;
use think\facade\Session;

class Login extends Common
{

    protected function initialize()
    {
        parent::initialize();

        if (session("login_token") != null && $this->request->action() != "logout") {
            $this->redirect(url("/user/index"));
        }

    }

    /**
     * 用户登录
     * @return mixed
     */
    public function index (){

        if ($this->request->isPost()) {

            $data = $this->request->only(['username', 'password','verify']);
            $validate_result = $this->validate($data, 'Login');

            if ($validate_result !== true) {
                $this->echoJson("",301,$validate_result);
            } else {

                $data['platform'] = "pc";
                $data['last_login_ip'] = $this->request->ip();

                $result = curl_server("api_v1/user_login",$data);

                if ($result['code'] == 0) {
                    session('login_token',$result['data']);
                    $this->echoJson(\url("/user/index"),$result['code'],$result['msg']);
                }else {
                    $this->echoJson("",$result['code'],$result['msg']);
                }

            }

        }

        $this->assign("current_cate",array('name' => "用户登录", 'alias' => "user_login",));
        $this->site_seo('login');
        return $this->fetch("index");
    }

    /**
     * 账号注册
     * @return mixed
     */
    public function reg (){

        if ($this->request->isPost()) {

            $data            = $this->request->only(['username', 'password','password2','email','verify']);
            $validate_result = $this->validate($data, 'Login');

            if ($validate_result !== true) {
                $this->echoJson("",301,$validate_result);
            } else {

                if ($data['password'] != $data['password2']) {
                    $this->echoJson("",301,"密码不一致请重新输入!");
                }else {
                    $data['platform'] = "pc";
                    $data['last_login_ip'] = $this->request->ip();

                    $result = curl_server("api_v1/user_reg",$data);

                    if ($result['code'] == 0) {
                        session('login_token',$result['data']);
                        $this->echoJson(\url("/user/index"),$result['code'],$result['msg']);
                    }else {
                        $this->echoJson($result['data'],$result['code'],$result['msg']);
                    }
                }

            }

        }

        $this->assign("current_cate",array('name' => "用户注册", 'alias' => "user_reg",));
        $this->site_seo('reg');
        return $this->fetch("reg");

    }

    /**
     * 检测重复项
     */
    public function check (){
        $type = $this->request->param("type");
        $value = $this->request->param("value");
        $data = curl_server("api_v1/user_check",array(
            'type' => $type,
            'value' => $value,
            'platform' => "pc",
        ));

        $this->echoJson($data['data'],$data['code'],$data['msg']);
    }


    /**
     * 退出登录
     */
    public function logout()
    {
        Session::delete("login_token");
        $this->redirect(url("/login/index"));
    }


}

