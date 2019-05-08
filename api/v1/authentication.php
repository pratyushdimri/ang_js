<?php 
$app->get('/session', function() {
    global $db;   
    $session = $db->getSession();
    $response["uid"] = $session['uid'];
    $response["email"] = $session['email'];
    $response["name"] = $session['name'];
    echoResponse(200, $session);
});
$app->post('/login', function() use ($app) {
    require_once 'passwordHash.php';
    
    $r = json_decode($app->request->getBody());
  
    $response = array();
   global $db;   
    $password = $r->customer->password;
    $email = $r->customer->email;    
    $user = $db->findOne("customers_auth","uid,name,password,email,created",array("email"=>$email));    
    if ($user['data'] != NULL) {
        //if(passwordHash::check_password($user['data']['password'],$password)){
		if($user['data']['password'] == $password){	
        $response['status'] = "success";
        $response['message'] = 'Logged in successfully.';
        $response['name'] = $user['data']['name'];
        $response['uid'] = $user['data']['uid'];
        $response['email'] = $user['data']['email'];
        $response['createdAt'] = $user['data']['created'];
        if (!isset($_SESSION)) {
            session_start();
        }
        $_SESSION['uid'] = $user['data']['uid'];
        $_SESSION['email'] = $email;
        $_SESSION['name'] = $user['data']['name'];
        } else {
            $response['status'] = "error";
            $response['message'] = 'Login failed. Incorrect credentials';
        }
    }else {
            $response['status'] = "error";
            $response['message'] = 'No such user is registered';
        }
    echoResponse(200, $response);
});
$app->post('/signUp', function() use ($app) {
    $response = array();
    $r = json_decode($app->request->getBody());
   
    require_once 'passwordHash.php';
    global $db;
    $customer['phone']= $phone = $r->customer->phone;
    $customer['name']= $name = $r->customer->name;
    $customer['email']=$email = $r->customer->email;
    $customer['address'] = $address = $r->customer->address;
    $customer['password']= $password = $r->customer->password;
    
    $user = $db->findOne("customers_auth","uid",array("email"=>$email));
    if(!$user['data']){
        $r->customer->password = passwordHash::hash($password);
        $tabble_name = "customers_auth";
        $column_names = array('phone', 'name', 'email', 'password', 'city', 'address');
        $result = $db->insert($tabble_name, $customer, array('email', 'name', 'password'));
        if ($result != NULL) {
            $response["status"] = "success";
            $response["message"] = "User account created successfully";
            $response["uid"] = $result['data'];
            if (!isset($_SESSION)) {
                session_start();
            }
            $_SESSION['uid'] = $response["uid"];
            $_SESSION['phone'] = $phone;
            $_SESSION['name'] = $name;
            $_SESSION['email'] = $email;
            echoResponse(200, $response);
        } else {
            $response["status"] = "error";
            $response["message"] = "Failed to create customer. Please try again";
            echoResponse(201, $response);
        }            
    }else{
        $response["status"] = "error";
        $response["message"] = "An user with the provided phone or email exists!";
        echoResponse(201, $response);
    }
});
$app->get('/logout', function() {
    global $db;
    $session = $db->destroySession();
    $response["status"] = "info";
    $response["message"] = "Logged out successfully";
    echoResponse(200, $response);
});

?>